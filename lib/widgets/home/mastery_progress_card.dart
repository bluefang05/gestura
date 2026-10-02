import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/feedback_service.dart';
import '../../data/gesture_database.dart';
import '../../data/quiz_database.dart';
import '../../data/roadmap_database.dart';
import '../../data/scenario_database.dart';
import '../../screens/progress_screen.dart';
import '../../state/progress_provider.dart';
import '../common/app_card.dart';

class MasteryProgressCard extends StatelessWidget {
  const MasteryProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ProgressProvider(),
      builder: (context, _) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final progress = ProgressProvider().progress;
        final percentage = progress.masteryPercentage;
        final ratio = progress.masteryRatio;
        final activeStep = RoadmapDatabase.getCurrentActiveStep(progress);
        final activeLevel = RoadmapDatabase.getCurrentActiveLevel(progress);

        return AppCard(
          padding: const EdgeInsets.all(16),
          onTap: () {
            FeedbackService.lightClick();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProgressScreen(initialTabIndex: 0),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fila Superior: Nivel en Curso & Porcentaje Global
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
                      Icons.alt_route_rounded,
                      size: 20,
                      color:
                          isDark ? AppColors.primaryLight : AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                'RUTA: HOW TO HUMAN',
                                style: TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.8,
                                  color: isDark
                                      ? AppColors.accentLight
                                      : AppColors.primary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 6),
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
                                'Nivel ${activeLevel.levelNumber}',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  color: isDark
                                      ? const Color(0xFF5EEAD4)
                                      : const Color(0xFF0F766E),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 1),
                        Text(
                          activeLevel.title,
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Porcentaje de Maestría
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isDark
                            ? [const Color(0xFF0F766E), const Color(0xFF0D9488)]
                            : [AppColors.primary, const Color(0xFF0284C7)],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '$percentage%',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Caja Destacada: "Tu Siguiente Paso" (Cero sobrecarga cognitiva)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF1E293B)
                      : const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? AppColors.primary.withValues(alpha: 0.35)
                        : AppColors.primary.withValues(alpha: 0.2),
                    width: 1.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.primary.withValues(alpha: 0.3)
                                : AppColors.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            activeStep.icon,
                            size: 18,
                            color: isDark
                                ? AppColors.primaryLight
                                : AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MISIÓN ACTUAL • PASO ${activeStep.stepNumber} DE 11',
                                style: TextStyle(
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.5,
                                  color: isDark
                                      ? AppColors.textSecondaryDark
                                      : AppColors.textSecondaryLight,
                                ),
                              ),
                              Text(
                                activeStep.title,
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w800,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      activeStep.subtitle,
                      style: TextStyle(
                        fontSize: 11.5,
                        color: isDark
                            ? AppColors.textMutedDark
                            : AppColors.textMutedLight,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Material(
                            color: isDark
                                ? AppColors.primaryLight
                                : AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                FeedbackService.lightClick();
                                RoadmapDatabase.navigateToDestination(
                                  context,
                                  activeStep.destination,
                                  roadmapStepId: activeStep.id,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 9, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      size: 18,
                                      color:
                                          isDark ? Colors.black : Colors.white,
                                    ),
                                    const SizedBox(width: 6),
                                    Flexible(
                                      child: Text(
                                        'Continuar Ruta',
                                        style: TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w800,
                                          color: isDark
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Material(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: isDark
                                  ? AppColors.darkBorder
                                  : AppColors.lightBorder,
                              width: 1.2,
                            ),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              FeedbackService.lightClick();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const ProgressScreen(initialTabIndex: 0),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 9, horizontal: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.map_rounded,
                                    size: 16,
                                    color: isDark
                                        ? AppColors.textSecondaryDark
                                        : AppColors.textPrimaryLight,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Itinerario',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: isDark
                                          ? AppColors.textSecondaryDark
                                          : AppColors.textPrimaryLight,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Barra de Progreso
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: ratio == 0.0 ? 0.02 : ratio,
                  minHeight: 6,
                  backgroundColor: isDark
                      ? const Color(0xFF334155)
                      : const Color(0xFFE2E8F0),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isDark ? AppColors.accentLight : AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Hitos Rápidos
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMiniPill(
                      icon: Icons.menu_book_rounded,
                      label:
                          '${progress.totalExploredGestures}/${GestureDatabase.items.length} Gestos',
                      isDark: isDark,
                    ),
                    const SizedBox(width: 6),
                    _buildMiniPill(
                      icon: Icons.movie_filter_rounded,
                      label:
                          '${progress.totalCompletedScenarios}/${ScenarioDatabase.scenarios.length} Escenarios',
                      isDark: isDark,
                    ),
                    const SizedBox(width: 6),
                    _buildMiniPill(
                      icon: Icons.quiz_rounded,
                      label:
                          '${progress.totalCompletedQuizzes}/${QuizDatabase.questions.length} Quizzes',
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
      },
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
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
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
