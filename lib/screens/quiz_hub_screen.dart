import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../models/category.dart';
import '../data/quiz_database.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/common/section_header.dart';
import '../core/services/feedback_service.dart';
import 'quiz_runner_screen.dart';
import 'flash_quiz_screen.dart';
import 'incongruence_detector_screen.dart';
import 'buyer_temperature_screen.dart';

class QuizHubScreen extends StatelessWidget {
  const QuizHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Zona de Práctica'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 640;
          final isWide = constraints.maxWidth >= 960;
          final catColumns = isWide ? 3 : (isTablet ? 2 : 1);

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1050),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  // Modo Destacado: Test Visual de Microexpresiones
                  AppCard(
                    padding: const EdgeInsets.all(16),
                    borderSide: BorderSide(
                      color: isDark ? AppColors.primaryLight : AppColors.primary,
                      width: 1.5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            BadgePill(
                              text: 'Entrenamiento Principal',
                              icon: Icons.auto_awesome_rounded,
                              color: isDark
                                  ? AppColors.primaryLight
                                  : AppColors.primary,
                            ),
                            const Spacer(),
                            Icon(Icons.grid_view_rounded,
                                color: isDark
                                    ? AppColors.primaryLight
                                    : AppColors.primary),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Test de Reconocimiento Visual',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Diferencia microexpresiones, posturas y señales corporales reales entre 4 opciones visuales.',
                          style: TextStyle(
                            fontSize: 13,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          height: 44,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.play_arrow_rounded, size: 22),
                            label: const Text('Iniciar Test Visual',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              FeedbackService.lightClick();
                              final imageQuestions =
                                  QuizDatabase.getImageCardQuestions();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => QuizRunnerScreen(
                                    title: 'Test Visual de Microexpresiones',
                                    questions: imageQuestions.isNotEmpty
                                        ? imageQuestions
                                        : QuizDatabase.questions,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Modos Especializados
                  const SectionHeader(
                    title: 'Entrenamientos Especializados',
                    subtitle: 'Habilidades de calibración social y respuesta rápida',
                  ),
                  const SizedBox(height: 8),

                  GridView.count(
                    crossAxisCount: isTablet ? 2 : 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: isTablet ? 2.3 : 2.7,
                    children: [
                      // Modo: Detector de Incongruencias
                      _buildPracticeModeCard(
                        context: context,
                        isDark: isDark,
                        icon: Icons.psychology_alt_rounded,
                        accentColor: AppColors.indigo,
                        title: 'Detector de Incongruencias',
                        description: 'Aprende cuándo las palabras dicen una cosa pero el cuerpo otra.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const IncongruenceDetectorScreen(),
                            ),
                          );
                        },
                      ),

                      // Modo: Termómetro de Receptividad
                      _buildPracticeModeCard(
                        context: context,
                        isDark: isDark,
                        icon: Icons.thermostat_rounded,
                        accentColor: AppColors.coral,
                        title: 'Termómetro de Receptividad',
                        description: 'Mide el nivel de apertura y detecta el momento de acuerdo.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BuyerTemperatureScreen(),
                            ),
                          );
                        },
                      ),

                      // Modo: Flash Contrarreloj
                      _buildPracticeModeCard(
                        context: context,
                        isDark: isDark,
                        icon: Icons.flash_on_rounded,
                        accentColor: AppColors.accent,
                        title: 'Modo Flash Contrarreloj',
                        description: 'Entrena reflejos rápidos: la imagen desaparece en 3 segundos.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const FlashQuizScreen(),
                            ),
                          );
                        },
                      ),

                      // Modo: Ventas y Negociación
                      _buildPracticeModeCard(
                        context: context,
                        isDark: isDark,
                        icon: Icons.business_center_rounded,
                        accentColor: AppColors.primary,
                        title: 'Ventas y Trabajo',
                        description: 'Preguntas prácticas para reuniones de trabajo y objeciones.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizRunnerScreen(
                                title: 'Ventas y Negociación',
                                questions: QuizDatabase.questions,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quizzes por Categoría
                  const SectionHeader(
                    title: 'Quizzes por Canal',
                    subtitle: 'Entrena un área anatómica específica',
                  ),
                  const SizedBox(height: 8),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: catColumns,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: isTablet ? 2.6 : 2.5,
                    ),
                    itemCount: CategoryInfo.allCategories.length,
                    itemBuilder: (context, index) {
                      final cat = CategoryInfo.allCategories[index];
                      return AppCard(
                        padding: const EdgeInsets.all(12),
                        onTap: () {
                          FeedbackService.lightClick();
                          final qList = QuizDatabase.getByCategory(cat.type);
                          final questions = qList.isNotEmpty
                              ? qList
                              : QuizDatabase.questions;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizRunnerScreen(
                                title: cat.title,
                                questions: questions,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: cat.primaryColor.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(cat.icon,
                                  color: cat.primaryColor, size: 20),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cat.title,
                                    style: const TextStyle(
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w700),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    cat.chapterReference,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: isDark
                                          ? AppColors.textMutedDark
                                          : AppColors.textMutedLight,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: isDark
                                  ? AppColors.textMutedDark
                                  : AppColors.textMutedLight,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static Widget _buildPracticeModeCard({
    required BuildContext context,
    required bool isDark,
    required IconData icon,
    required Color accentColor,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(12),
      onTap: () {
        FeedbackService.lightClick();
        onTap();
      },
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: isDark ? 0.2 : 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accentColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            size: 20,
            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
          ),
        ],
      ),
    );
  }
}
