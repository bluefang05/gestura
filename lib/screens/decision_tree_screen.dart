import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../data/gesture_database.dart';
import '../models/gesture_item.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/ad_bottom_bar.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/common/section_header.dart';
import '../widgets/illustrations/illustration_widget.dart';
import '../core/services/tts_service.dart';
import '../core/services/storage_service.dart';
import 'gesture_detail_screen.dart';

class DecisionTreeScreen extends StatefulWidget {
  const DecisionTreeScreen({super.key});

  static const List<Map<String, dynamic>> zones =
      _DecisionTreeScreenState.zones;

  @override
  State<DecisionTreeScreen> createState() => _DecisionTreeScreenState();
}

class _DecisionTreeScreenState extends State<DecisionTreeScreen> {
  String? _selectedZone;
  GestureItem? _selectedGesture;

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  static const List<Map<String, dynamic>> zones = [
    {
      'id': 'Ojos',
      'label': 'Ojos y Mirada',
      'icon': Icons.visibility_rounded,
      'color': AppColors.primary,
      'clues': [
        'sonrisa_genuina',
        'ceno_fruncido',
        'ojos_entrecerrados',
        'mirada_sorpresa',
        'mirada_esquiva',
        'parpados_cerrados',
        'pupilas_dilatadas',
        'guino',
        'flash_cejas',
      ],
    },
    {
      'id': 'Boca',
      'label': 'Boca y Labios',
      'icon': Icons.sentiment_satisfied_alt_rounded,
      'color': AppColors.coral,
      'clues': [
        'sonrisa_social',
        'labios_apretados',
        'mirada_desden',
        'mandibula_apretada',
        'morder_labio',
        'aleteo_nasal',
      ],
    },
    {
      'id': 'Brazos',
      'label': 'Brazos y Postura',
      'icon': Icons.accessibility_new_rounded,
      'color': AppColors.accent,
      'clues': [
        'postura_abierta',
        'postura_cerrada',
        'manos_ojiva',
        'manos_caderas',
        'tocarse_cuello',
        'manos_nuca',
        'brazos_espalda',
        'frotar_manos',
        'tamborilear_dedos',
        'inclinacion_adelante',
        'inclinacion_atras',
      ],
    },
    {
      'id': 'Voz',
      'label': 'Voz y Silencios',
      'icon': Icons.record_voice_over_rounded,
      'color': AppColors.purple,
      'clues': [
        'volumen_alto',
        'volumen_bajo',
        'velocidad_rapida',
        'tono_monotono',
        'tono_sarcastico',
        'tono_asertivo',
        'silencio_incomodo',
        'silencio_reflexivo',
      ],
    },
    {
      'id': 'Espacio',
      'label': 'Espacio y Mesa',
      'icon': Icons.meeting_room_rounded,
      'color': AppColors.info,
      'clues': [
        'espacio_intimo',
        'espacio_personal',
        'espacio_social',
        'mesa_redonda',
        'mesa_barrera',
        'angulo_noventa',
      ],
    },
    {
      'id': 'Digital',
      'label': 'Mensajería y Chat',
      'icon': Icons.chat_rounded,
      'color': AppColors.primaryLight,
      'clues': [
        'digital_mayusculas',
        'digital_ok_seco',
        'digital_ghosting',
        'digital_emojis',
        'digital_audio',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Árbol de Decisión Social'),
      ),
      bottomNavigationBar: const AdBottomBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 640 &&
              constraints.maxHeight >= 600 &&
              MediaQuery.textScalerOf(context).scale(14) <= 21;
          final isWide = constraints.maxWidth >= 960;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1050),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  // Header Banner
                  AppCard(
                    color: isDark
                        ? const Color(0xFF064E3B)
                        : const Color(0xFFD1FAE5),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.account_tree_rounded,
                            color: AppColors.success, size: 36),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Observo ➔ Considero el contexto ➔ Pregunto',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  color: isDark
                                      ? Colors.white
                                      : AppColors.textPrimaryLight,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Explora posibles lecturas y formas de responder.',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: isDark
                                        ? AppColors.textSecondaryDark
                                        : AppColors.textSecondaryLight),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Paso 1: Seleccionar Zona
                  const SectionHeader(
                    title: 'Paso 1: ¿Dónde viste la señal?',
                    subtitle: 'Toca la zona corporal que observaste',
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: zones.map((z) {
                      final isSelected = _selectedZone == z['id'];
                      return ChoiceChip(
                        avatar: Icon(z['icon'] as IconData,
                            size: 18,
                            color: isSelected
                                ? Colors.white
                                : z['color'] as Color),
                        label: Text(z['label'] as String),
                        selected: isSelected,
                        selectedColor:
                            (z['color'] as Color).withValues(alpha: 0.85),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : (isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight),
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                        onSelected: (val) {
                          FeedbackService.lightClick();
                          setState(() {
                            _selectedZone = val ? (z['id'] as String) : null;
                            _selectedGesture = null;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Paso 2: Seleccionar Gesto Específico
                  if (_selectedZone != null) ...[
                    const SectionHeader(
                      title: 'Paso 2: ¿Qué patrón específico viste?',
                      subtitle:
                          'Selecciona la señal que mejor describe lo ocurrido',
                    ),
                    _buildGestureOptionsList(isDark, isTablet, isWide),
                    const SizedBox(height: 24),
                  ],

                  // Paso 3: Posibles lecturas y respuestas
                  if (_selectedGesture != null) ...[
                    const SectionHeader(
                      title: 'Paso 3: Posibles lecturas y respuestas',
                      subtitle:
                          'Considera otras explicaciones antes de responder',
                    ),
                    _buildDiagnosisCard(_selectedGesture!, isDark),
                    const SizedBox(height: 20),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGestureOptionsList(bool isDark, bool isTablet, bool isWide) {
    final zoneData = zones.firstWhere((z) => z['id'] == _selectedZone);
    final clueIds = zoneData['clues'] as List<String>;
    final items = GestureDatabase.items
        .where((g) =>
            clueIds.contains(g.id) || clueIds.contains(g.illustrationKey))
        .toList();

    if (isTablet) {
      final columns = isWide ? 3 : 2;
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: isWide ? 3.0 : 2.5,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final gesture = items[index];
          final isSelected = _selectedGesture?.id == gesture.id;
          return AppCard(
            color:
                isSelected ? AppColors.primary.withValues(alpha: 0.12) : null,
            borderSide: isSelected
                ? const BorderSide(color: AppColors.primary, width: 2)
                : null,
            onTap: () {
              FeedbackService.lightClick();
              setState(() => _selectedGesture = gesture);
            },
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ConoVeIllustration(
                  illustrationKey: gesture.illustrationKey,
                  width: 44,
                  height: 44,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        gesture.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        gesture.summary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11.5,
                          color: isDark
                              ? AppColors.textMutedDark
                              : AppColors.textMutedLight,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  gesture.reading.icon,
                  color: gesture.reading.color,
                  size: 18,
                ),
              ],
            ),
          );
        },
      );
    }

    return Column(
      children: items.map((gesture) {
        final isSelected = _selectedGesture?.id == gesture.id;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AppCard(
            color:
                isSelected ? AppColors.primary.withValues(alpha: 0.12) : null,
            borderSide: isSelected
                ? const BorderSide(color: AppColors.primary, width: 2)
                : null,
            onTap: () {
              FeedbackService.lightClick();
              setState(() => _selectedGesture = gesture);
              if (StorageService.getAutoNarration()) {
                final textToSpeak =
                    '${gesture.name}. Lectura orientativa: ${gesture.reading.label}. Posible significado: ${gesture.probableMeaning}. Qué debes hacer: ${gesture.whatToDo}. En ventas: ${gesture.salesTip}';
                TtsService.speakSpanish(textToSpeak, gestureId: gesture.id);
              }
            },
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                ConoVeIllustration(
                  illustrationKey: gesture.illustrationKey,
                  width: 48,
                  height: 48,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gesture.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 13.5),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        gesture.summary,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? AppColors.textMutedDark
                              : AppColors.textMutedLight,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  gesture.reading.icon,
                  color: gesture.reading.color,
                  size: 20,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDiagnosisCard(GestureItem g, bool isDark) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ConoVeIllustration(
                illustrationKey: g.illustrationKey,
                width: 72,
                height: 72,
                borderRadius: BorderRadius.circular(14),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: BadgePill(
                            text: g.reading.label,
                            color: g.reading.color,
                          ),
                        ),
                        ValueListenableBuilder<String?>(
                          valueListenable: TtsService.currentSpeakingIdNotifier,
                          builder: (context, speakingId, _) {
                            final isSpeaking = speakingId == 'tree_${g.id}';
                            return IconButton(
                              icon: Icon(
                                isSpeaking
                                    ? Icons.stop_circle_rounded
                                    : Icons.volume_up_rounded,
                                color: isSpeaking
                                    ? (isDark
                                        ? AppColors.accentLight
                                        : AppColors.accent)
                                    : (isDark
                                        ? AppColors.primaryLight
                                        : AppColors.primary),
                                size: 22,
                              ),
                              tooltip: isSpeaking
                                  ? 'Detener audio'
                                  : 'Escuchar resumen',
                              onPressed: () {
                                FeedbackService.lightClick();
                                TtsService.speakSpanish(
                                  g.expressAudioSummary,
                                  gestureId: 'tree_${g.id}',
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      g.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),

          // Significado
          _buildActionItem(
            icon: Icons.psychology_rounded,
            iconColor: isDark ? const Color(0xFFA78BFA) : AppColors.purple,
            title: '💡 Posibles significados',
            highlight: g.quickMeaning,
            description: g.probableMeaning,
          ),
          const SizedBox(height: 14),

          // Acción Recomendada
          _buildActionItem(
            icon: Icons.check_circle_outline_rounded,
            iconColor: isDark ? const Color(0xFF34D399) : AppColors.success,
            title: '🎯 Qué puedes hacer ahora',
            highlight: g.quickAction,
            description: g.whatToDo,
          ),
          const SizedBox(height: 14),

          // Tip de Ventas / Negociación
          _buildActionItem(
            icon: Icons.trending_up_rounded,
            iconColor: isDark ? AppColors.accentLight : AppColors.accent,
            title: '💼 Una forma de responder',
            description: g.salesTip,
          ),
          const SizedBox(height: 18),

          // Botón para ver ficha completa
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.menu_book_rounded, size: 18),
              label: const Text('Ver Ficha Completa en el Manual'),
              onPressed: () {
                FeedbackService.lightClick();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => GestureDetailScreen(gestureId: g.id)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? highlight,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
              ),
              if (highlight != null) ...[
                const SizedBox(height: 3),
                Text(
                  highlight,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
              ],
              const SizedBox(height: 3),
              Text(
                description,
                style: const TextStyle(fontSize: 12, height: 1.35),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
