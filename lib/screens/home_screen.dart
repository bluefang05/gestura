import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../models/category.dart';
import '../data/gesture_database.dart';
import '../data/quiz_database.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/common/section_header.dart';
import '../widgets/illustrations/conove_logo_painter.dart';
import '../core/services/feedback_service.dart';
import '../core/localization/app_localizations.dart';
import 'decoder_screen.dart';
import 'quiz_runner_screen.dart';
import 'progress_screen.dart';
import 'compare_screen.dart';
import 'decision_tree_screen.dart';
import 'cheat_sheet_screen.dart';
import 'incongruence_detector_screen.dart';
import 'buyer_temperature_screen.dart';
import 'gesture_detail_screen.dart';
import 'unwritten_rules_screen.dart';
import 'cluster_baseline_screen.dart';
import 'emergency_mode_screen.dart';
import '../widgets/home/mastery_progress_card.dart';
import '../widgets/illustrations/illustration_widget.dart';
import '../core/services/tts_service.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<int> onNavigateToTab;
  final ValueChanged<CategoryType> onOpenCategory;

  const HomeScreen({
    super.key,
    required this.onNavigateToTab,
    required this.onOpenCategory,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const GesturaLogoWidget(size: 34),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    loc.appName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w900),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    loc.appSubtitle,
                    style: TextStyle(
                      fontSize: 10.5,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.insights_rounded),
            tooltip: 'Mi Progreso',
            onPressed: () {
              FeedbackService.lightClick();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProgressScreen()),
              );
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 640;
          final isWide = constraints.maxWidth >= 960;
          final categoryColumns = isWide ? 4 : (isTablet ? 3 : 2);
          final toolColumns = isTablet ? 3 : 2;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1050),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                children: [
                  // 1. Buscador Rápido y Limpio (Sustituye la tarjeta gigante saturada)
                  InkWell(
                    onTap: () {
                      FeedbackService.lightClick();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DecoderScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.darkSurface : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                          width: 1.2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search_rounded,
                              color: isDark
                                  ? AppColors.primaryLight
                                  : AppColors.primary,
                              size: 22),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              '¿Qué señal o gesto observas? Buscar...',
                              style: TextStyle(
                                fontSize: 13.5,
                                color: isDark
                                    ? AppColors.textMutedDark
                                    : AppColors.textMutedLight,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9, vertical: 4),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.primary.withValues(alpha: 0.2)
                                  : AppColors.primaryContainer
                                      .withValues(alpha: 0.35),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Decodificar',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? AppColors.primaryLight
                                    : AppColors.primaryDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 2. Indicador Motivacional de Dominio y Porcentaje Global
                  const MasteryProgressCard(),
                  const SizedBox(height: 16),

                  // 3. Señal del Día (Tarjeta Limpia y Sobria)
                  Builder(
                    builder: (context) {
                      final dayOfYear = DateTime.now()
                          .difference(DateTime(DateTime.now().year, 1, 1))
                          .inDays;
                      final dailyGesture = GestureDatabase
                          .items[dayOfYear % GestureDatabase.items.length];
                      final catInfo =
                          CategoryInfo.getInfo(dailyGesture.category);

                      return AppCard(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 9, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: (isDark
                                            ? AppColors.accentLight
                                            : AppColors.accent)
                                        .withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.auto_awesome_rounded,
                                          color: isDark
                                              ? AppColors.accentLight
                                              : AppColors.accent,
                                          size: 18),
                                      const SizedBox(width: 6),
                                      Text(
                                        'Gesto del Día',
                                        style: TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w800,
                                          color: isDark
                                              ? AppColors.accentLight
                                              : AppColors.accent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                ValueListenableBuilder<String?>(
                                  valueListenable:
                                      TtsService.currentSpeakingIdNotifier,
                                  builder: (context, speakingId, _) {
                                    final isSpeaking = speakingId ==
                                        'daily_${dailyGesture.id}';
                                    return IconButton(
                                      constraints: const BoxConstraints(
                                          minWidth: 32, minHeight: 32),
                                      padding: EdgeInsets.zero,
                                      iconSize: 20,
                                      icon: Icon(
                                        isSpeaking
                                            ? Icons.stop_circle_rounded
                                            : Icons.volume_up_outlined,
                                        color: isSpeaking
                                            ? (isDark
                                                ? const Color(0xFFFCA5A5)
                                                : const Color(0xFFDC2626))
                                            : (isDark
                                                ? AppColors.textMutedDark
                                                : AppColors.textMutedLight),
                                      ),
                                      tooltip: isSpeaking
                                          ? 'Detener audio'
                                          : 'Escuchar Señal del Día',
                                      onPressed: () {
                                        FeedbackService.lightClick();
                                        if (isSpeaking) {
                                          TtsService.stop();
                                        } else {
                                          final speech =
                                              'Señal del día: ${dailyGesture.name}. ${dailyGesture.summary}. Pistas físicas: ${dailyGesture.physiologicalDetails}.';
                                          TtsService.speak(speech,
                                              gestureId:
                                                  'daily_${dailyGesture.id}');
                                        }
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ConoVeIllustration(
                                  illustrationKey: dailyGesture.illustrationKey,
                                  width: 68,
                                  height: 68,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dailyGesture.name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: -0.2),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        dailyGesture.summary,
                                        style: TextStyle(
                                          fontSize: 12.5,
                                          color: isDark
                                              ? AppColors.textSecondaryDark
                                              : AppColors.textSecondaryLight,
                                          height: 1.35,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                BadgePill(
                                  text: dailyGesture.bodyPart,
                                  color: catInfo.primaryColor,
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    FeedbackService.lightClick();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => GestureDetailScreen(
                                            gestureId: dailyGesture.id),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_forward_rounded,
                                      size: 18),
                                  label: const Text('Ver Detalle'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  // 3. Herramientas Prácticas (En Grid ordenado y calmado, sin arcoíris chillón)
                  const SectionHeader(
                    title: 'Herramientas Prácticas',
                    subtitle: 'Observación y toma de decisiones paso a paso',
                  ),
                  const SizedBox(height: 8),

                  GridView.count(
                    crossAxisCount: toolColumns,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: isTablet ? 2.4 : 1.95,
                    children: [
                      // Herramienta 1: Test Visual
                      _buildToolCard(
                        context: context,
                        isDark: isDark,
                        icon: Icons.psychology_rounded,
                        accentColor: AppColors.primary,
                        title: 'Test Visual',
                        description: 'Diferencia microexpresiones',
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
                        title: 'Incongruencias',
                        description: 'Palabras vs cuerpo real',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const IncongruenceDetectorScreen()),
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
                        description: 'Regla: Veo X ➔ Hago Z',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DecisionTreeScreen()),
                          );
                        },
                      ),

                      // Herramienta 4: Termómetro de Receptividad
                      _buildToolCard(
                        context: context,
                        isDark: isDark,
                        icon: Icons.thermostat_rounded,
                        accentColor: AppColors.coral,
                        title: 'Termómetro',
                        description: 'Calibra receptividad social',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const BuyerTemperatureScreen()),
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
                        description: '20 señales clave en 30s',
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
                        accentColor: isDark
                            ? AppColors.accentLight
                            : AppColors.accent,
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

                      // Herramienta 8: Conglomerados y Línea Base
                      _buildToolCard(
                        context: context,
                        isDark: isDark,
                        icon: Icons.hub_rounded,
                        accentColor: AppColors.indigo,
                        title: 'Clusters & Línea Base',
                        description: 'Regla de las 3 señales',
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
                        title: 'Modo Emergencia',
                        description: 'Checklists en 30s de campo',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const EmergencyModeScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 4. Explorar por Categoría
                  SectionHeader(
                    title: 'Manual de Canales',
                    subtitle: 'Clasificación anatómica y contextual',
                    trailing: TextButton(
                      onPressed: () => onNavigateToTab(1),
                      child: const Text('Ver Todo'),
                    ),
                  ),
                  const SizedBox(height: 8),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: categoryColumns,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: isTablet ? 1.4 : 1.25,
                    ),
                    itemCount: CategoryInfo.allCategories.length,
                    itemBuilder: (context, index) {
                      final cat = CategoryInfo.allCategories[index];
                      final count =
                          GestureDatabase.getByCategory(cat.type).length;

                      return AppCard(
                        padding: const EdgeInsets.all(12),
                        onTap: () {
                          FeedbackService.lightClick();
                          onOpenCategory(cat.type);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: cat.primaryColor.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(cat.icon,
                                  color: cat.primaryColor, size: 20),
                            ),
                            const Spacer(),
                            Text(
                              cat.title,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 3),
                            Text(
                              '$count señales',
                              style: TextStyle(
                                fontSize: 11,
                                color: isDark
                                    ? AppColors.textMutedDark
                                    : AppColors.textMutedLight,
                              ),
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

  /// Tarjeta de herramienta neutral y descansada para la vista
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
