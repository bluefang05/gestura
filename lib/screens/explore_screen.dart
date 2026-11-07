import 'tools_screen.dart';
import 'concepts_screen.dart';
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../models/category.dart';
import '../data/gesture_database.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/adaptive_card_grid.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/common/section_header.dart';
import '../core/services/feedback_service.dart';
import 'gesture_detail_screen.dart';
import '../widgets/illustrations/illustration_widget.dart';
import '../core/services/tts_service.dart';

class ExploreScreen extends StatelessWidget {
  final ValueChanged<int> onNavigateToTab;
  final ValueChanged<CategoryType> onOpenCategory;
  const ExploreScreen(
      {super.key, required this.onNavigateToTab, required this.onOpenCategory});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Explorar')),
      body: LayoutBuilder(builder: (context, constraints) {
        final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
        final compact = constraints.maxWidth < 380 || textScale > 1.3;
        final categoryColumns = compact
            ? 1
            : (constraints.maxWidth >= 960
                ? 4
                : (constraints.maxWidth >= 640 ? 3 : 2));
        return Center(
            child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: ListView(padding: const EdgeInsets.all(16), children: [
            Card(
                child: ListTile(
              leading: const Icon(Icons.menu_book_outlined),
              title: const Text('Conceptos'),
              subtitle:
                  const Text('Consulta términos y ejemplos de la práctica.'),
              onTap: () {
                TtsService.stop();
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (_) => const ConceptsScreen()));
              },
            )),
            const SizedBox(height: 12),
            Builder(
              builder: (context) {
                final dayOfYear = DateTime.now()
                    .difference(DateTime(DateTime.now().year, 1, 1))
                    .inDays;
                final dailyGesture = GestureDatabase
                    .items[dayOfYear.abs() % GestureDatabase.items.length];
                final catInfo = CategoryInfo.getInfo(dailyGesture.category);

                return AppCard(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                              child: Container(
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
                                Flexible(
                                    child: Text(
                                  'Gesto del Día',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w800,
                                    color: isDark
                                        ? AppColors.accentLight
                                        : AppColors.accent,
                                  ),
                                )),
                              ],
                            ),
                          )),
                          const Spacer(),
                          ValueListenableBuilder<String?>(
                            valueListenable:
                                TtsService.currentSpeakingIdNotifier,
                            builder: (context, speakingId, _) {
                              final isSpeaking =
                                  speakingId == 'daily_${dailyGesture.id}';
                              return IconButton(
                                constraints: const BoxConstraints(
                                    minWidth: 48, minHeight: 48),
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
                                    : 'Escuchar resumen',
                                onPressed: () {
                                  FeedbackService.lightClick();
                                  if (isSpeaking) {
                                    TtsService.stop();
                                  } else {
                                    TtsService.speakSpanish(
                                      dailyGesture.expressAudioSummary,
                                      gestureId: 'daily_${dailyGesture.id}',
                                    );
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dailyGesture.name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.2),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('💡 ',
                                        style: TextStyle(fontSize: 11)),
                                    Expanded(
                                      child: Text(
                                        dailyGesture.quickMeaning,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: isDark
                                              ? AppColors.textPrimaryDark
                                              : AppColors.textPrimaryLight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('👁️ ',
                                        style: TextStyle(fontSize: 11)),
                                    Expanded(
                                      child: Text(
                                        dailyGesture.quickVisualClue,
                                        style: TextStyle(
                                          fontSize: 11.5,
                                          color: isDark
                                              ? AppColors.textSecondaryDark
                                              : AppColors.textSecondaryLight,
                                        ),
                                      ),
                                    ),
                                  ],
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
                          Wrap(
                            spacing: 6,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 2.5),
                                decoration: BoxDecoration(
                                  color: dailyGesture.reading.color
                                      .withValues(alpha: isDark ? 0.2 : 0.12),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: dailyGesture.reading.color
                                        .withValues(alpha: isDark ? 0.45 : 0.3),
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      dailyGesture.reading.icon,
                                      size: 13,
                                      color: dailyGesture.reading.color,
                                    ),
                                    const SizedBox(width: 4),
                                    Flexible(
                                        child: Text(
                                      dailyGesture.reading.shortState,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                        color: dailyGesture.reading.color,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              BadgePill(
                                text: dailyGesture.bodyPart,
                                color: catInfo.primaryColor,
                              ),
                            ],
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

            ListTile(
              leading: const Icon(Icons.widgets_outlined),
              title: const Text('Todas las herramientas'),
              subtitle: const Text(
                  'Comparar gestos, preparar conversaciones y consultar ejemplos'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                TtsService.stop();
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const ToolsScreen(),
                    ));
              },
            ),
            const SizedBox(height: 20),
            // Browse the complete catalog without interrupting the guided route.
            SectionHeader(
              title: 'Manual de Canales',
              subtitle: 'Señales visibles y situaciones cotidianas',
              trailing: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onNavigateToTab(1);
                },
                child: const Text('Ver Todo'),
              ),
            ),
            const SizedBox(height: 8),

            AdaptiveCardGrid(
              columns: categoryColumns,
              children:
                  List.generate(CategoryInfo.allCategories.length, (index) {
                final cat = CategoryInfo.allCategories[index];
                final count = GestureDatabase.getByCategory(cat.type).length;

                return AppCard(
                  padding: EdgeInsets.all(compact ? 10 : 12),
                  onTap: () {
                    FeedbackService.lightClick();
                    Navigator.pop(context);
                    onOpenCategory(cat.type);
                  },
                  child: compact
                      ? Row(
                          children: [
                            _buildCategoryIcon(cat),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cat.title,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
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
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 20,
                              color: isDark
                                  ? AppColors.textMutedDark
                                  : AppColors.textMutedLight,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildCategoryIcon(cat),
                            const SizedBox(height: 12),
                            Text(
                              cat.title,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                height: 1.2,
                              ),
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
              }),
            ),
            const SizedBox(height: 24),
          ]),
        ));
      }),
    );
  }

  static Widget _buildCategoryIcon(CategoryInfo category) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: category.primaryColor.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(category.icon, color: category.primaryColor, size: 20),
    );
  }
}
