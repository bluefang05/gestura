import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/gesture_database.dart';
import '../widgets/common/ad_bottom_bar.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/illustrations/illustration_widget.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../core/services/storage_service.dart';
import '../core/services/tts_service.dart';
import '../state/progress_provider.dart';
import '../widgets/common/tts_app_bar_control.dart';
import '../models/gesture_item.dart';

class GestureDetailScreen extends StatefulWidget {
  final String gestureId;

  const GestureDetailScreen({super.key, required this.gestureId});

  @override
  State<GestureDetailScreen> createState() => _GestureDetailScreenState();
}

class _GestureDetailScreenState extends State<GestureDetailScreen> {
  bool _highlightAnatomy = false;
  bool _showDeepDive = false;
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isBookmarked = StorageService.isBookmarked(widget.gestureId);
    _registerExplored();
  }

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  void _registerExplored() {
    ProgressProvider().markGestureExplored(widget.gestureId);
  }

  void _toggleBookmark() async {
    await ProgressProvider().toggleBookmark(widget.gestureId);
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
    FeedbackService.bookmark();
  }

  void _toggleTts(GestureItem item) {
    final speech =
        '${item.name}. ${item.difficultyLabel}. ${item.signalType.label}. ${item.summary}. Qué puedes observar: ${item.physiologicalDetails}. Significado principal: ${item.probableMeaning}. Otras explicaciones a considerar: ${item.alternativeMeanings.join(", ")}. Guía según el contexto: ${item.contextGuidance}. Qué debes hacer o responder: ${item.whatToDo}. Consejo para ventas y negociación: ${item.salesTip}';
    TtsService.speak(speech, gestureId: item.id);
  }

  void _toggleExpressTts(GestureItem item) {
    FeedbackService.lightClick();
    TtsService.speak(item.expressAudioSummary, gestureId: 'express_${item.id}');
  }

  @override
  Widget build(BuildContext context) {
    final item = GestureDatabase.getById(widget.gestureId);
    if (item == null) {
      return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: const AdBottomBar(),
        body: const Center(child: Text('Señal no encontrada')),
      );
    }

    final catInfo = CategoryInfo.getInfo(item.category);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(catInfo.shortTitle),
        actions: [
          TtsAppBarControl(
            onPlay: () => _toggleTts(item),
            onStop: () => TtsService.stop(),
          ),
          IconButton(
            icon: Icon(
              _isBookmarked
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_outline_rounded,
              color: _isBookmarked ? catInfo.primaryColor : null,
            ),
            tooltip: 'Guardar para repaso',
            onPressed: _toggleBookmark,
          ),
        ],
      ),
      bottomNavigationBar: const AdBottomBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 720;

          final detailCards = [
            // Card 1: Qué puedes observar
            AppCard(
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
              borderSide: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                width: 1.0,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.visibility_rounded,
                          size: 20,
                          color: isDark
                              ? AppColors.primaryLight
                              : AppColors.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Qué puedes observar',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.physiologicalDetails,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.4,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Card 1.5: Variabilidad Humana en el Mundo Real (Anti-estereotipo)
            AppCard(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
              borderSide: BorderSide(
                color:
                    isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1),
                width: 1.2,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people_alt_rounded,
                          size: 20,
                          color: isDark
                              ? AppColors.primaryLight
                              : AppColors.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Variabilidad en la Vida Real',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'En la vida diaria, las personas reales no son caricaturas ni adoptan siempre la misma postura fija. Observa el conjunto corporal completo y el entorno: la intensidad de la señal varía según la persona, su complexión física, su cansancio y sus hábitos individuales.',
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Card 2: Contextual readings (Green)
            AppCard(
              color: isDark
                  ? const Color(0xFF064E3B).withValues(alpha: 0.35)
                  : AppColors.successContainer,
              borderSide: BorderSide(
                color: isDark
                    ? const Color(0xFF059669).withValues(alpha: 0.5)
                    : const Color(0xFFA7F3D0),
                width: 1.2,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_rounded,
                          size: 20,
                          color: isDark
                              ? const Color(0xFF34D399)
                              : AppColors.success),
                      const SizedBox(width: 8),
                      Text(
                        'Lecturas posibles según el contexto',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? const Color(0xFF6EE7B7)
                              : const Color(0xFF065F46),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.probableMeaning,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.4,
                      color: isDark
                          ? const Color(0xFFECFDF5)
                          : const Color(0xFF064E3B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Card 3: Alternative explanations (Amber)
            AppCard(
              color: isDark
                  ? const Color(0xFF78350F).withValues(alpha: 0.35)
                  : AppColors.warningContainer,
              borderSide: BorderSide(
                color: isDark
                    ? const Color(0xFFD97706).withValues(alpha: 0.5)
                    : const Color(0xFFFDE68A),
                width: 1.2,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning_amber_rounded,
                          size: 20,
                          color: isDark
                              ? const Color(0xFFFBBF24)
                              : AppColors.warning),
                      const SizedBox(width: 8),
                      Text(
                        'Otras explicaciones a considerar',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? const Color(0xFFFDE68A)
                              : const Color(0xFF92400E),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  for (final alt in item.alternativeMeanings)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '• ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? const Color(0xFFFBBF24)
                                  : const Color(0xFF92400E),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              alt,
                              style: TextStyle(
                                fontSize: 13,
                                color: isDark
                                    ? const Color(0xFFFFFBEB)
                                    : const Color(0xFF78350F),
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Card 4: Guía por Contexto (Indigo/Slate)
            AppCard(
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC),
              borderSide: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                width: 1.0,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.map_rounded,
                          size: 20,
                          color: isDark
                              ? const Color(0xFF818CF8)
                              : AppColors.indigo),
                      const SizedBox(width: 8),
                      Text(
                        'Guía según el Contexto',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.contextGuidance,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.4,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Card 5: ¿Qué Hacer o Responder? (Indigo)
            AppCard(
              color: isDark
                  ? const Color(0xFF312E81).withValues(alpha: 0.35)
                  : const Color(0xFFE0E7FF),
              borderSide: BorderSide(
                color: isDark
                    ? const Color(0xFF6366F1).withValues(alpha: 0.5)
                    : const Color(0xFFC7D2FE),
                width: 1.2,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.chat_rounded,
                          size: 20,
                          color: isDark
                              ? const Color(0xFF818CF8)
                              : AppColors.indigo),
                      const SizedBox(width: 8),
                      Text(
                        '¿Cómo Responder o Reaccionar?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? const Color(0xFFC7D2FE)
                              : const Color(0xFF3730A3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.whatToDo,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.4,
                      color: isDark
                          ? const Color(0xFFEEF2FF)
                          : const Color(0xFF312E81),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Card 6: Consejo de Ventas & Negociación (Purple)
            AppCard(
              color: isDark
                  ? const Color(0xFF581C87).withValues(alpha: 0.35)
                  : const Color(0xFFF3E8FF),
              borderSide: BorderSide(
                color: isDark
                    ? const Color(0xFFA855F7).withValues(alpha: 0.5)
                    : const Color(0xFFE9D5FF),
                width: 1.2,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.business_center_rounded,
                          size: 20,
                          color: isDark
                              ? const Color(0xFFC084FC)
                              : AppColors.purple),
                      const SizedBox(width: 8),
                      Text(
                        'Consejo para Ventas y Negociación',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: isDark
                              ? const Color(0xFFE9D5FF)
                              : const Color(0xFF6B21A8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.salesTip,
                    style: TextStyle(
                      fontSize: 13.5,
                      height: 1.4,
                      color: isDark
                          ? const Color(0xFFFAF5FF)
                          : const Color(0xFF581C87),
                    ),
                  ),
                ],
              ),
            ),
          ];

          if (isTablet) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column (Illustration & Express Audio & Header)
                    SizedBox(
                      width: 380,
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          Center(
                            child: Hero(
                              tag: 'gesture_illustration_${item.id}',
                              child: ConoVeIllustration(
                                illustrationKey: item.illustrationKey,
                                width: 260,
                                height: 260,
                                highlightAnatomy: _highlightAnatomy,
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 8,
                            runSpacing: 6,
                            children: [
                              FilterChip(
                                avatar: Icon(
                                  _highlightAnatomy
                                      ? Icons.remove_red_eye_rounded
                                      : Icons.remove_red_eye_outlined,
                                  size: 18,
                                  color: _highlightAnatomy
                                      ? Colors.white
                                      : AppColors.primary,
                                ),
                                label: Text(_highlightAnatomy
                                    ? 'Pistas On'
                                    : 'Pistas Off'),
                                selected: _highlightAnatomy,
                                selectedColor: AppColors.primary,
                                backgroundColor:
                                    Theme.of(context).cardTheme.color,
                                onSelected: (val) {
                                  FeedbackService.lightClick();
                                  setState(() => _highlightAnatomy = val);
                                },
                              ),
                              ValueListenableBuilder<String?>(
                                valueListenable:
                                    TtsService.currentSpeakingIdNotifier,
                                builder: (context, speakingId, _) {
                                  final isSpeaking = speakingId == item.id;
                                  return ActionChip(
                                    avatar: Icon(
                                      isSpeaking
                                          ? Icons.stop_circle_rounded
                                          : Icons.volume_up_rounded,
                                      size: 18,
                                      color: isSpeaking
                                          ? Colors.white
                                          : AppColors.accent,
                                    ),
                                    label: Text(
                                      isSpeaking ? 'Detener' : 'Audio Completo',
                                      style: TextStyle(
                                          color:
                                              isSpeaking ? Colors.white : null,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: isSpeaking
                                        ? AppColors.accent
                                        : Theme.of(context).cardTheme.color,
                                    onPressed: () {
                                      FeedbackService.lightClick();
                                      _toggleTts(item);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // Botón Hero "Escuchar sin leer" (10s)
                          _buildExpressAudioHero(item, isDark),
                          const SizedBox(height: 16),

                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            children: [
                              BadgePill(
                                  text: item.bodyPart,
                                  color: catInfo.primaryColor),
                              BadgePill(
                                  text: item.signalType.label,
                                  color: item.signalType.color),
                              BadgePill(
                                  text: item.difficultyLabel,
                                  color: item.difficultyColor),
                              BadgePill(
                                  text: catInfo.chapterReference,
                                  color: isDark
                                      ? AppColors.textMutedDark
                                      : AppColors.textMutedLight),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.name,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.4),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.summary,
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const VerticalDivider(width: 1, thickness: 1),
                    // Right Column (At-A-Glance Card & Deep Dive)
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          _buildAtAGlanceCard(item, isDark),
                          const SizedBox(height: 16),
                          _buildDeepDiveSection(detailCards, isDark),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // Mobile 1-Column Layout
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              Center(
                child: Hero(
                  tag: 'gesture_illustration_${item.id}',
                  child: ConoVeIllustration(
                    illustrationKey: item.illustrationKey,
                    width: 220,
                    height: 220,
                    highlightAnatomy: _highlightAnatomy,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 6,
                children: [
                  FilterChip(
                    avatar: Icon(
                      _highlightAnatomy
                          ? Icons.remove_red_eye_rounded
                          : Icons.remove_red_eye_outlined,
                      size: 18,
                      color:
                          _highlightAnatomy ? Colors.white : AppColors.primary,
                    ),
                    label: Text(_highlightAnatomy ? 'Pistas On' : 'Pistas Off'),
                    selected: _highlightAnatomy,
                    selectedColor: AppColors.primary,
                    backgroundColor: Theme.of(context).cardTheme.color,
                    onSelected: (val) {
                      FeedbackService.lightClick();
                      setState(() => _highlightAnatomy = val);
                    },
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == item.id;
                      return ActionChip(
                        avatar: Icon(
                          isSpeaking
                              ? Icons.stop_circle_rounded
                              : Icons.volume_up_rounded,
                          size: 18,
                          color: isSpeaking ? Colors.white : AppColors.accent,
                        ),
                        label: Text(
                          isSpeaking ? 'Detener' : 'Audio Completo',
                          style: TextStyle(
                              color: isSpeaking ? Colors.white : null,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: isSpeaking
                            ? AppColors.accent
                            : Theme.of(context).cardTheme.color,
                        onPressed: () {
                          FeedbackService.lightClick();
                          _toggleTts(item);
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Botón Hero "Escuchar sin leer" (10s)
              _buildExpressAudioHero(item, isDark),
              const SizedBox(height: 16),

              Wrap(
                spacing: 8,
                runSpacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  BadgePill(text: item.bodyPart, color: catInfo.primaryColor),
                  BadgePill(
                      text: item.signalType.label,
                      color: item.signalType.color),
                  BadgePill(
                      text: item.difficultyLabel, color: item.difficultyColor),
                  BadgePill(
                      text: catInfo.chapterReference,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                item.name,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.4),
              ),
              const SizedBox(height: 6),
              Text(
                item.summary,
                style: TextStyle(
                  fontSize: 14.5,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 16),

              // Tarjeta Resumen 3 Segundos (Visual-First)
              _buildAtAGlanceCard(item, isDark),
              const SizedBox(height: 16),

              // Desglose profundo opcional
              _buildDeepDiveSection(detailCards, isDark),
              const SizedBox(height: 24),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAtAGlanceCard(GestureItem item, bool isDark) {
    final lightColor = item.signalType.color;
    final lightBg = isDark
        ? lightColor.withValues(alpha: 0.16)
        : lightColor.withValues(alpha: 0.08);
    final lightBorder = lightColor.withValues(alpha: 0.45);

    return AppCard(
      color: lightBg,
      borderSide: BorderSide(color: lightBorder, width: 1.6),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Semáforo Header Bar
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: lightColor.withValues(alpha: 0.22),
                  shape: BoxShape.circle,
                ),
                child: Icon(item.signalType.icon, color: lightColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.signalType.label.toUpperCase(),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: lightColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.signalType.actionAdvice,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white12
                      : Colors.black.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.bolt_rounded, size: 14, color: lightColor),
                    const SizedBox(width: 3),
                    Text(
                      '3 Segundos',
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Divider(
            height: 1,
            thickness: 0.8,
            color: lightColor.withValues(alpha: 0.25),
          ),
          const SizedBox(height: 12),

          // 3 Micro-píldoras visuales
          _buildGlanceRow(
            icon: Icons.visibility_rounded,
            iconColor:
                isDark ? const Color(0xFF60A5FA) : const Color(0xFF2563EB),
            title: 'Qué mirar:',
            content: item.quickVisualClue,
            isDark: isDark,
          ),
          const SizedBox(height: 10),
          _buildGlanceRow(
            icon: Icons.lightbulb_rounded,
            iconColor:
                isDark ? const Color(0xFFFBBF24) : const Color(0xFFD97706),
            title: 'Significado:',
            content: item.quickMeaning,
            isDark: isDark,
          ),
          const SizedBox(height: 10),
          _buildGlanceRow(
            icon: Icons.play_arrow_rounded,
            iconColor:
                isDark ? const Color(0xFF34D399) : const Color(0xFF059669),
            title: 'Acción táctica:',
            content: item.quickAction,
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildGlanceRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String content,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: 14, color: iconColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 13.5,
                height: 1.35,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
              children: [
                TextSpan(
                  text: '$title ',
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                TextSpan(
                  text: content,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpressAudioHero(GestureItem item, bool isDark) {
    return ValueListenableBuilder<String?>(
      valueListenable: TtsService.currentSpeakingIdNotifier,
      builder: (context, speakingId, _) {
        final isSpeaking = speakingId == 'express_${item.id}';
        return Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _toggleExpressTts(item),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: isSpeaking
                    ? (isDark
                        ? const Color(0xFF7F1D1D)
                        : const Color(0xFFFEE2E2))
                    : (isDark
                        ? const Color(0xFF1E293B)
                        : const Color(0xFFEEF2FF)),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSpeaking
                      ? (isDark ? Colors.redAccent : Colors.red)
                      : (isDark
                          ? AppColors.primary.withValues(alpha: 0.5)
                          : const Color(0xFFC7D2FE)),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: isSpeaking
                          ? (isDark
                              ? Colors.red.withValues(alpha: 0.3)
                              : Colors.red.withValues(alpha: 0.2))
                          : (isDark
                              ? AppColors.primary.withValues(alpha: 0.25)
                              : AppColors.primary.withValues(alpha: 0.15)),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isSpeaking
                          ? Icons.stop_circle_rounded
                          : Icons.headphones_rounded,
                      color: isSpeaking
                          ? (isDark ? Colors.white : Colors.red)
                          : (isDark
                              ? AppColors.primaryLight
                              : AppColors.primary),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isSpeaking
                              ? 'Reproduciendo síntesis express...'
                              : '🎧 Escuchar sin leer (10s)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: isSpeaking
                                ? (isDark
                                    ? Colors.white
                                    : const Color(0xFF991B1B))
                                : (isDark
                                    ? AppColors.textPrimaryDark
                                    : AppColors.textPrimaryLight),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isSpeaking
                              ? 'Toca para pausar la lectura'
                              : 'Qué mirar, significado y respuesta táctica al instante',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: isSpeaking
                                ? (isDark
                                    ? Colors.white70
                                    : const Color(0xFFB91C1C))
                                : (isDark
                                    ? AppColors.textMutedDark
                                    : AppColors.textMutedLight),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isSpeaking
                        ? Icons.graphic_eq_rounded
                        : Icons.play_arrow_rounded,
                    color: isSpeaking
                        ? (isDark ? Colors.white : Colors.red)
                        : (isDark ? AppColors.primaryLight : AppColors.primary),
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDeepDiveSection(List<Widget> detailCards, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            FeedbackService.lightClick();
            setState(() {
              _showDeepDive = !_showDeepDive;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                width: 1.2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _showDeepDive
                      ? Icons.menu_book_rounded
                      : Icons.menu_book_outlined,
                  size: 20,
                  color: isDark ? AppColors.primaryLight : AppColors.primary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _showDeepDive
                            ? 'Ocultar análisis detallado'
                            : '📖 Ver análisis profundo y contexto (Opcional)',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                      Text(
                        'Señales visibles, diferencias entre personas y contexto',
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
                  _showDeepDive
                      ? Icons.expand_less_rounded
                      : Icons.expand_more_rounded,
                  color: isDark
                      ? AppColors.textMutedDark
                      : AppColors.textMutedLight,
                ),
              ],
            ),
          ),
        ),
        if (_showDeepDive) ...[
          const SizedBox(height: 14),
          ...detailCards,
        ],
      ],
    );
  }
}
