import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/services/feedback_service.dart';

class BodyPartFilterBar extends StatelessWidget {
  final String selectedPart;
  final ValueChanged<String> onSelected;

  const BodyPartFilterBar({
    super.key,
    required this.selectedPart,
    required this.onSelected,
  });

  static const List<String> parts = [
    'Todos',
    'Ojos',
    'Boca',
    'Cejas',
    'Voz',
    'Brazos',
    'Espacio',
    'Digital',
  ];

  static String localizedLabel(BuildContext context, String part) {
    final loc = AppLocalizations.of(context);
    switch (part.toLowerCase()) {
      case 'todos':
      case 'all':
        return loc.filterAll;
      case 'ojos':
      case 'eyes':
        return loc.filterEyes;
      case 'boca':
      case 'mouth':
        return loc.filterMouth;
      case 'cejas':
      case 'eyebrows':
        return loc.filterEyebrows;
      case 'voz':
      case 'voice':
        return loc.filterVoice;
      case 'brazos':
      case 'arms':
        return loc.filterArms;
      case 'espacio':
      case 'space':
        return loc.filterSpace;
      case 'digital':
        return loc.filterDigital;
      default:
        return part;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 30 + MediaQuery.textScalerOf(context).scale(18),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: parts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final part = parts[index];
          final isSelected = (selectedPart == part) ||
              (selectedPart.isEmpty && part == 'Todos') ||
              (selectedPart.toLowerCase() == part.toLowerCase());

          final bg = isSelected
              ? AppColors.primary
              : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9));

          final fg = isSelected
              ? Colors.white
              : (isDark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A));

          final border = isSelected
              ? AppColors.primary
              : (isDark ? const Color(0xFF475569) : const Color(0xFFCBD5E1));

          final label = localizedLabel(context, part);

          return Semantics(
            button: true,
            selected: isSelected,
            label: label,
            child: ChoiceChip(
              label: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  color: fg,
                ),
              ),
              selected: isSelected,
              selectedColor: AppColors.primary,
              backgroundColor: bg,
              showCheckmark: false,
              side: BorderSide(
                color: border,
                width: isSelected ? 1.5 : 1.2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onSelected: (_) {
                FeedbackService.lightClick();
                onSelected(part == 'Todos' ? '' : part);
              },
            ),
          );
        },
      ),
    );
  }
}
