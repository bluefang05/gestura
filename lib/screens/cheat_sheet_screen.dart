import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../data/gesture_database.dart';
import '../models/gesture_item.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/ad_bottom_bar.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/illustrations/illustration_widget.dart';
import 'gesture_detail_screen.dart';
import '../core/services/tts_service.dart';

class CheatSheetScreen extends StatefulWidget {
  const CheatSheetScreen({super.key});

  static const List<String> priorityIds = _CheatSheetScreenState.priorityIds;

  @override
  State<CheatSheetScreen> createState() => _CheatSheetScreenState();
}

class _CheatSheetScreenState extends State<CheatSheetScreen> {
  GestureReading? _filterReading;

  static const List<String> priorityIds = [
    'sonrisa_genuina',
    'sonrisa_social',
    'postura_abierta',
    'postura_cerrada',
    'inclinacion_adelante',
    'inclinacion_atras',
    'manos_ojiva',
    'manos_caderas',
    'tocarse_cuello',
    'frotar_manos',
    'labios_apretados',
    'mirada_desden',
    'mandibula_apretada',
    'pupilas_dilatadas',
    'tono_sarcastico',
    'tono_asertivo',
    'mesa_redonda',
    'mesa_barrera',
    'angulo_noventa',
    'digital_ok_seco',
  ];

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    var items = priorityIds
        .map((id) => GestureDatabase.getById(id))
        .whereType<GestureItem>()
        .toList();

    if (_filterReading != null) {
      items = items.where((i) => i.reading == _filterReading).toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Guía de Bolsillo (Cheat Sheet)'),
      ),
      bottomNavigationBar: const AdBottomBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 640;
          final isWide = constraints.maxWidth >= 960;
          final columns = isWide ? 3 : (isTablet ? 2 : 1);

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  // Header Banner
                  AppCard(
                    color: isDark
                        ? const Color(0xFF1E293B)
                        : const Color(0xFFF1F5F9),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.bolt_rounded,
                                color: isDark
                                    ? AppColors.accentLight
                                    : AppColors.accent,
                                size: 24),
                            const SizedBox(width: 8),
                            const Expanded(
                                child: Text(
                              'Referencia Rápida de Campo',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            )),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '20 observaciones y preguntas útiles para ventas, entrevistas y negociaciones. Úsalas como guía, no como diagnóstico de lo que otra persona piensa.',
                          style: TextStyle(
                            fontSize: 12.5,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Filtros por lectura orientativa
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FilterChip(
                          label: const Text('Todos'),
                          selected: _filterReading == null,
                          onSelected: (_) {
                            FeedbackService.lightClick();
                            setState(() => _filterReading = null);
                          },
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          avatar: const Icon(Icons.circle,
                              color: AppColors.primary, size: 18),
                          label: const Text('Posible apertura'),
                          selected:
                              _filterReading == GestureReading.possibleOpenness,
                          selectedColor: AppColors.primaryContainer,
                          onSelected: (_) {
                            FeedbackService.lightClick();
                            setState(() => _filterReading =
                                GestureReading.possibleOpenness);
                          },
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          avatar: const Icon(Icons.circle,
                              color: AppColors.primary, size: 18),
                          label: const Text('Lectura ambigua'),
                          selected: _filterReading == GestureReading.ambiguous,
                          selectedColor: AppColors.primaryContainer,
                          onSelected: (_) {
                            FeedbackService.lightClick();
                            setState(() =>
                                _filterReading = GestureReading.ambiguous);
                          },
                        ),
                        const SizedBox(width: 8),
                        FilterChip(
                          avatar: const Icon(Icons.circle,
                              color: AppColors.primary, size: 18),
                          label: const Text('Posible tensión'),
                          selected:
                              _filterReading == GestureReading.possibleTension,
                          selectedColor: AppColors.primaryContainer,
                          onSelected: (_) {
                            FeedbackService.lightClick();
                            setState(() => _filterReading =
                                GestureReading.possibleTension);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Cards list / Grid
                  if (isTablet)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: isWide ? 2.4 : 2.1,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return AppCard(
                          onTap: () {
                            FeedbackService.lightClick();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      GestureDetailScreen(gestureId: item.id)),
                            );
                          },
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ConoVeIllustration(
                                illustrationKey: item.illustrationKey,
                                width: 68,
                                height: 68,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BadgePill(
                                      text: item.reading.shortState,
                                      color: item.reading.color,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 13.5),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.volume_up_rounded,
                                              size: 18,
                                              color: isDark
                                                  ? AppColors.primaryLight
                                                  : AppColors.primary),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          tooltip: 'Escuchar en voz alta',
                                          onPressed: () {
                                            FeedbackService.lightClick();
                                            TtsService.speakSpanish(
                                                '${item.name}. Posibles significados: ${item.probableMeaning}. Qué puedes hacer: ${item.whatToDo}');
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 11.5,
                                          color: isDark
                                              ? AppColors.textSecondaryDark
                                              : AppColors.textPrimaryLight,
                                          height: 1.3,
                                        ),
                                        children: [
                                          const TextSpan(
                                              text: 'Posibles significados: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: item.probableMeaning),
                                        ],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 2),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontSize: 11.5,
                                          color: AppColors.primary,
                                          height: 1.3,
                                        ),
                                        children: [
                                          const TextSpan(
                                              text: 'Acción: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: item.whatToDo),
                                        ],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  else
                    ...items.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: AppCard(
                          onTap: () {
                            FeedbackService.lightClick();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      GestureDetailScreen(gestureId: item.id)),
                            );
                          },
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ConoVeIllustration(
                                illustrationKey: item.illustrationKey,
                                width: 68,
                                height: 68,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BadgePill(
                                      text: item.reading.shortState,
                                      color: item.reading.color,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item.name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 14),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.volume_up_rounded,
                                              size: 18,
                                              color: isDark
                                                  ? AppColors.primaryLight
                                                  : AppColors.primary),
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          tooltip: 'Escuchar en voz alta',
                                          onPressed: () {
                                            FeedbackService.lightClick();
                                            TtsService.speakSpanish(
                                                '${item.name}. Posibles significados: ${item.probableMeaning}. Qué puedes hacer: ${item.whatToDo}');
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isDark
                                              ? AppColors.textSecondaryDark
                                              : AppColors.textPrimaryLight,
                                          height: 1.3,
                                        ),
                                        children: [
                                          const TextSpan(
                                              text: 'Posibles significados: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: item.probableMeaning),
                                        ],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 3),
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.primary,
                                          height: 1.3,
                                        ),
                                        children: [
                                          const TextSpan(
                                              text: 'Acción: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: item.whatToDo),
                                        ],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
