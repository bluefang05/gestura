import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Utilities for calculating WCAG 2.1 Relative Luminance and Contrast Ratios.
///
/// Complies with W3C Web Content Accessibility Guidelines (WCAG) 2.1 specifications:
/// https://www.w3.org/WAI/GL/wiki/Relative_luminance
/// https://www.w3.org/WAI/GL/wiki/Contrast_ratio
class ContrastUtils {
  ContrastUtils._();

  /// Calculates the relative luminance of a given [Color] normalized to [0.0, 1.0].
  static double calculateLuminance(Color color) {
    double transform(double channel) {
      final c = channel / 255.0;
      return c <= 0.04045
          ? c / 12.92
          : math.pow((c + 0.055) / 1.055, 2.4).toDouble();
    }

    final r = transform(color.r * 255.0);
    final g = transform(color.g * 255.0);
    final b = transform(color.b * 255.0);

    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }

  /// Calculates the WCAG contrast ratio between [foreground] and [background].
  /// Returns a value between 1.0 (lowest) and 21.0 (highest, e.g. black on white).
  static double contrastRatio(Color foreground, Color background) {
    final l1 = calculateLuminance(foreground);
    final l2 = calculateLuminance(background);

    final lighter = math.max(l1, l2);
    final darker = math.min(l1, l2);

    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Checks if the contrast satisfies WCAG AA for normal text (ratio >= 4.5).
  static bool isWcagAa(Color foreground, Color background) {
    return contrastRatio(foreground, background) >= 4.5;
  }

  /// Checks if the contrast satisfies WCAG AA for large text / graphical objects (ratio >= 3.0).
  static bool isWcagAaLarge(Color foreground, Color background) {
    return contrastRatio(foreground, background) >= 3.0;
  }

  /// Checks if the contrast satisfies WCAG AAA for normal text (ratio >= 7.0).
  static bool isWcagAaa(Color foreground, Color background) {
    return contrastRatio(foreground, background) >= 7.0;
  }

  /// Checks if the contrast satisfies WCAG AAA for large text (ratio >= 4.5).
  static bool isWcagAaaLarge(Color foreground, Color background) {
    return contrastRatio(foreground, background) >= 4.5;
  }
}
