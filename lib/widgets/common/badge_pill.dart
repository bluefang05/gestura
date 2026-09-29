import 'package:flutter/material.dart';
import '../../core/utils/contrast_utils.dart';

class BadgePill extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;
  final Color? textColor;
  final Color? backgroundColor;

  const BadgePill({
    super.key,
    required this.text,
    this.icon,
    required this.color,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final tint = backgroundColor ??
        (isDark
            ? color.withValues(alpha: 0.22)
            : color.withValues(alpha: 0.12));

    // Resolve transparency before measuring contrast, and render that same color.
    final bg = Color.alphaBlend(tint, Theme.of(context).colorScheme.surface);
    final double bgLuminance = bg.computeLuminance();
    final bool isBgLight = bgLuminance > 0.45;

    final fallback = ContrastUtils.contrastRatio(Colors.black, bg) >=
            ContrastUtils.contrastRatio(Colors.white, bg)
        ? Colors.black
        : Colors.white;
    final Color fg =
        textColor ?? (ContrastUtils.isWcagAa(color, bg) ? color : fallback);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isBgLight
              ? (isDark
                  ? color.withValues(alpha: 0.6)
                  : color.withValues(alpha: 0.4))
              : (isDark
                  ? color.withValues(alpha: 0.55)
                  : color.withValues(alpha: 0.35)),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18, color: fg),
            const SizedBox(width: 5),
          ],
          Flexible(
              child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: fg,
              letterSpacing: 0.1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );
  }
}
