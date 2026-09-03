import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/feedback_service.dart';
import '../../core/services/storage_service.dart';
import '../../screens/progress_screen.dart';
import '../common/app_card.dart';

class MasteryProgressCard extends StatelessWidget {
  const MasteryProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final progress = StorageService.loadProgress();
    final percentage = progress.masteryPercentage;
    final ratio = progress.masteryRatio;

    return AppCard(
      padding: const EdgeInsets.all(16),
      onTap: () {
        FeedbackService.lightClick();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProgressScreen()),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fila Superior: Nivel y Porcentaje
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.primary.withValues(alpha: 0.25)
                      : AppColors.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.military_tech_rounded,
                  size: 22,
                  color: isDark ? AppColors.primaryLight : AppColors.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6,
                      runSpacing: 2,
                      children: [
                        const Text(
                          'Dominio de Gestura',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 1.5),
                          decoration: BoxDecoration(
                            color: isDark
                                ? const Color(0xFF134E4A)
                                : const Color(0xFFCCFBF1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            progress.masteryLevelTitle,
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w800,
                              color: isDark
                                  ? const Color(0xFF5EEAD4)
                                  : const Color(0xFF0F766E),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      progress.motivationalMessage,
                      style: TextStyle(
                        fontSize: 11.5,
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),

              // Badge con el Gran Porcentaje
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDark
                        ? [const Color(0xFF0F766E), const Color(0xFF0D9488)]
                        : [AppColors.primary, const Color(0xFF0284C7)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '$percentage%',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Barra de Progreso Fluida
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: ratio == 0.0 ? 0.02 : ratio, // Muestra al menos un borde para saber que existe
              minHeight: 8,
              backgroundColor: isDark
                  ? const Color(0xFF334155)
                  : const Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation<Color>(
                isDark ? AppColors.accentLight : AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Desglose de Hitos en Chips Accesibles
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildMiniPill(
                  icon: Icons.menu_book_rounded,
                  label: '${progress.totalExploredGestures}/66 Gestos',
                  isDark: isDark,
                ),
                const SizedBox(width: 6),
                _buildMiniPill(
                  icon: Icons.movie_filter_rounded,
                  label: '${progress.totalCompletedScenarios}/13 Escenarios',
                  isDark: isDark,
                ),
                const SizedBox(width: 6),
                _buildMiniPill(
                  icon: Icons.quiz_rounded,
                  label: '${progress.totalCompletedQuizzes}/45 Quizzes',
                  isDark: isDark,
                ),
                if (progress.currentStreak > 0) ...[
                  const SizedBox(width: 6),
                  _buildMiniPill(
                    icon: Icons.local_fire_department_rounded,
                    label: '${progress.currentStreak}d racha',
                    iconColor: AppColors.accent,
                    isDark: isDark,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniPill({
    required IconData icon,
    required String label,
    required bool isDark,
    Color? iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1E293B)
            : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: iconColor ??
                (isDark ? AppColors.textSecondaryDark : AppColors.primary),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textPrimaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
