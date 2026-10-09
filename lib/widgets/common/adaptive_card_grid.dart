import 'package:flutter/material.dart';

/// Cards share column widths while retaining the height their content needs.
class AdaptiveCardGrid extends StatelessWidget {
  final int columns;
  final List<Widget> children;
  final double spacing;

  const AdaptiveCardGrid({
    super.key,
    required this.columns,
    required this.children,
    this.spacing = 10,
  }) : assert(columns > 0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = (constraints.maxWidth - spacing * (columns - 1)) / columns;
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: [
          for (final child in children) SizedBox(width: width, child: child),
        ],
      );
    });
  }
}
