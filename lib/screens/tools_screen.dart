import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../data/quiz_database.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/adaptive_card_grid.dart';
import '../widgets/common/section_header.dart';
import 'quiz_runner_screen.dart';
import 'compare_screen.dart';
import 'decision_tree_screen.dart';
import 'cheat_sheet_screen.dart';
import 'incongruence_detector_screen.dart';
import 'buyer_temperature_screen.dart';
import 'unwritten_rules_screen.dart';
import 'cluster_baseline_screen.dart';
import 'emergency_mode_screen.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.sizeOf(context).width;
    final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
    final toolColumns =
        width < 380 || textScale > 1.3 ? 1 : (width >= 640 ? 3 : 2);
    return Scaffold(
      appBar: AppBar(title: const Text('Herramientas')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 3. Herramientas Prácticas (En Grid ordenado y calmado, sin arcoíris chillón)
              const SectionHeader(
                title: 'Herramientas Prácticas',
                subtitle: 'Observación y toma de decisiones paso a paso',
              ),
              const SizedBox(height: 8),

              AdaptiveCardGrid(
                columns: toolColumns,
                children: [
                  // Herramienta 1: Test Visual
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.psychology_rounded,
                    accentColor: AppColors.primary,
                    title: 'Test Visual',
                    description: 'Reconoce gestos de cara, brazos y manos',
                    onTap: () {
                      final imageQuestions =
                          QuizDatabase.getImageCardQuestions();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizRunnerScreen(
                            title: 'Test Visual',
                            questions: imageQuestions.isNotEmpty
                                ? imageQuestions
                                : QuizDatabase.questions,
                          ),
                        ),
                      );
                    },
                  ),

                  // Herramienta 2: Detector de Incongruencias
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.psychology_alt_rounded,
                    accentColor: AppColors.indigo,
                    title: 'Palabras y gestos',
                    description:
                        'Explora qué preguntar cuando parecen distintos',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const IncongruenceDetectorScreen()),
                      );
                    },
                  ),

                  // Herramienta 3: Árbol de Decisión
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.account_tree_rounded,
                    accentColor: AppColors.success,
                    title: 'Árbol de Decisión',
                    description:
                        'Busca una señal y consulta posibles respuestas',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DecisionTreeScreen()),
                      );
                    },
                  ),

                  // Herramienta 4: Ruta de Ventas y Negociación
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.handshake_rounded,
                    accentColor: AppColors.coral,
                    title: 'Ruta de Ventas',
                    description: 'Pasos de una venta y respuestas a dudas',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const BuyerTemperatureScreen()),
                      );
                    },
                  ),

                  // Herramienta 5: Comparador Visual A/B
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.compare_arrows_rounded,
                    accentColor: AppColors.purple,
                    title: 'Comparador Visual A/B',
                    description: 'Contrasta gestos parecidos',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CompareScreen()),
                      );
                    },
                  ),

                  // Herramienta 6: Guía Rápida de Bolsillo
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.bolt_rounded,
                    accentColor: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                    title: 'Guía de Bolsillo',
                    description: 'Consulta señales y ejemplos de un vistazo',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CheatSheetScreen()),
                      );
                    },
                  ),

                  // Herramienta 7: Reglas No Escritas
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.auto_stories_rounded,
                    accentColor:
                        isDark ? AppColors.accentLight : AppColors.accent,
                    title: 'Reglas No Escritas',
                    description: 'Manual de lo no dicho',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const UnwrittenRulesScreen()),
                      );
                    },
                  ),

                  // Herramienta 8: Gestos y forma habitual de expresarse
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.hub_rounded,
                    accentColor: AppColors.indigo,
                    title: 'Observar señales y preguntar',
                    description: 'Mira la situación completa',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ClusterBaselineScreen()),
                      );
                    },
                  ),

                  // Herramienta 9: Modo Emergencia / Campo
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.flash_on_rounded,
                    accentColor: AppColors.coral,
                    title: 'Ayuda rápida',
                    description: 'Pasos para una situación difícil',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const EmergencyModeScreen()),
                      );
                    },
                  ),

                  // Herramienta 10: Límites y Consentimiento
                  _buildToolCard(
                    context: context,
                    isDark: isDark,
                    icon: Icons.shield_rounded,
                    accentColor: AppColors.coral,
                    title: 'Límites & Consentimiento',
                    description: 'Poner límites y pedir permiso con claridad',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UnwrittenRulesScreen(
                            initialTab: 4,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildToolCard({
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: isDark ? 0.2 : 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: accentColor, size: 22),
          ),
          const SizedBox(width: 10),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
