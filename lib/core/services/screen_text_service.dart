import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenText {
  final String text;
  final Rect bounds;
  const ScreenText(this.text, this.bounds);
}

/// Reads the actual rendered copy, including rich text and editable values.
/// It never consults the data catalog (which could reveal unanswered exercises).
class ScreenTextService {
  static List<ScreenText> collect(BuildContext context) {
    final root = context.findRenderObject();
    if (root is! RenderBox || !root.hasSize) return [];
    final viewport = root.localToGlobal(Offset.zero) & root.size;
    final result = <ScreenText>[];

    Rect? visibleBounds(RenderBox box) {
      if (!box.attached || !box.hasSize || box.size.isEmpty) return null;
      var bounds = box.localToGlobal(Offset.zero) & box.size;
      RenderObject child = box;
      for (var parent = child.parent; parent != null; parent = child.parent) {
        if (parent is RenderOffstage && parent.offstage) return null;
        if (parent is RenderOpacity && parent.opacity == 0) return null;
        if (parent is RenderIndexedStack) {
          final children = parent.getChildrenAsList();
          if (parent.index == null || children[parent.index!] != child) {
            return null;
          }
        }
        final clip = parent.describeApproximatePaintClip(child);
        if (clip != null) {
          bounds = bounds.intersect(
              MatrixUtils.transformRect(parent.getTransformTo(null), clip));
        }
        child = parent;
      }
      bounds = bounds.intersect(viewport);
      return bounds.isEmpty || !bounds.isFinite ? null : bounds;
    }

    void add(String text, RenderBox box) {
      final copy = text.trim();
      if (copy.isEmpty) return;
      final bounds = visibleBounds(box);
      if (bounds == null) return;
      result.add(ScreenText(copy, bounds));
    }

    bool containsText(Element element) {
      var found = false;
      void visit(Element child) {
        if (child.widget is Icon) return;
        if (child.widget is RichText || child.widget is EditableText) {
          found = true;
        } else {
          child.visitChildElements(visit);
        }
      }

      element.visitChildElements(visit);
      return found;
    }

    void visit(Element element) {
      // Material icon glyphs are fonts, but are not readable copy.
      if (element.widget is Icon) return;
      if (element.widget case Offstage(offstage: true)) return;
      // Inherited elements can resolve their own inherited model. Registering
      // that self-dependency would break notifications on the next navigation.
      if (element is! InheritedElement) {
        final route = ModalRoute.of(element);
        if (route != null && !route.isCurrent) return;
      }
      if (element is RenderObjectElement) {
        final object = element.renderObject;
        if (object is RenderParagraph) {
          add(object.text.toPlainText(), object);
        } else if (object is RenderEditable && !object.obscureText) {
          add(object.plainText, object);
        }
      }
      // Icon-only actions also have a spoken name.
      if (element.widget case Tooltip(message: final message?)) {
        final box = element.findRenderObject();
        if (box is RenderBox && !containsText(element)) add(message, box);
      }
      if (element.widget case Semantics(properties: final properties)) {
        final box = element.findRenderObject();
        if (box is RenderBox) {
          if (properties.image == true && properties.label != null) {
            add(properties.label!, box);
          }
          if (properties.toggled case final toggled?) {
            add(toggled ? 'Activado' : 'Desactivado', box);
          } else if (properties.checked case final checked?) {
            add(checked ? 'Marcado' : 'Sin marcar', box);
          }
        }
      }
      element.visitChildElements(visit);
    }

    context.visitChildElements(visit);
    // Group text by visual rows, then follow the interface's reading direction.
    final rtl = Directionality.of(context) == TextDirection.rtl;
    result.sort((a, b) {
      final row =
          (a.bounds.top / 8).floor().compareTo((b.bounds.top / 8).floor());
      if (row != 0) {
        return row;
      }
      return rtl
          ? b.bounds.left.compareTo(a.bounds.left)
          : a.bounds.left.compareTo(b.bounds.left);
    });
    return result;
  }
}
