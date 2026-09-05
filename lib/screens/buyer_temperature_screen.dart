import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/app_colors.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/ad_bottom_bar.dart';
import '../widgets/common/section_header.dart';
import '../widgets/common/badge_pill.dart';
import '../core/services/feedback_service.dart';
import '../core/services/tts_service.dart';
import '../models/sales_phase_item.dart';
import '../data/sales_pipeline_database.dart';
import '../data/scenario_database.dart';
import 'scenario_runner_screen.dart';
import 'incongruence_detector_screen.dart';
import 'emergency_mode_screen.dart';

class BuyerSignal {
  final String id;
  final String label;
  final int score;
  final String category; // 'green', 'yellow', 'red'
  final String takeaway;
  final IconData icon;

  const BuyerSignal({
    required this.id,
    required this.label,
    required this.score,
    required this.category,
    required this.takeaway,
    required this.icon,
  });
}

class BuyerTemperatureScreen extends StatefulWidget {
  const BuyerTemperatureScreen({super.key});

  static const List<BuyerSignal> signals = [
    // --- PISTAS QUE PUEDEN ACOMPAÑAR APERTURA ---
    BuyerSignal(
      id: 'lean_forward',
      label: 'Inclinación frontal hacia la mesa',
      score: 3,
      category: 'green',
      takeaway:
          'Puede facilitar la escucha, responder al espacio o ser una postura cómoda; no confirma interés.',
      icon: Icons.airline_seat_recline_normal_rounded,
    ),
    BuyerSignal(
      id: 'duchenne',
      label: 'Sonrisa genuina (ojos achinados)',
      score: 2,
      category: 'green',
      takeaway:
          'Puede acompañar alegría, cortesía o un estilo expresivo. No confirma aprobación.',
      icon: Icons.sentiment_very_satisfied_rounded,
    ),
    BuyerSignal(
      id: 'open_hands',
      label: 'Palmas abiertas y visibles',
      score: 3,
      category: 'green',
      takeaway:
          'Puede ser comodidad, una manera de gesticular o una invitación a conversar; no revela intención.',
      icon: Icons.pan_tool_rounded,
    ),
    BuyerSignal(
      id: 'slow_nod',
      label: 'Asentimiento de cabeza rítmico y lento',
      score: 2,
      category: 'green',
      takeaway:
          'Puede marcar seguimiento, ritmo conversacional o acuerdo parcial. Confirma lo que entendió.',
      icon: Icons.check_circle_outline_rounded,
    ),
    BuyerSignal(
      id: 'steepling',
      label: 'Manos en ojiva / campanario',
      score: 2,
      category: 'green',
      takeaway:
          'Puede ser hábito, concentración o una manera de colocar las manos; no anticipa una decisión.',
      icon: Icons.change_history_rounded,
    ),

    // --- LUZ AMARILLA (EVALUACIÓN / DUDA) ---
    BuyerSignal(
      id: 'hand_chin',
      label: 'Mano en la barbilla (pensando)',
      score: 0,
      category: 'yellow',
      takeaway:
          'Puede acompañar reflexión, comodidad o hábito. Pregunta qué información sería útil.',
      icon: Icons.psychology_rounded,
    ),
    BuyerSignal(
      id: 'head_tilt',
      label: 'Inclinación lateral de la cabeza',
      score: 1,
      category: 'yellow',
      takeaway:
          'Puede relacionarse con escucha, audición, comodidad cervical o curiosidad; no confirma intención.',
      icon: Icons.hearing_rounded,
    ),
    BuyerSignal(
      id: 'glasses_adjust',
      label: 'Mirar por encima de lentes / frotar puente',
      score: -1,
      category: 'yellow',
      takeaway:
          'Puede responder a la visión, cansancio o concentración. Ofrece una pausa o claridad si hace falta.',
      icon: Icons.remove_red_eye_outlined,
    ),

    // --- PISTAS QUE PUEDEN JUSTIFICAR UNA PAUSA ---
    BuyerSignal(
      id: 'crossed_arms',
      label: 'Brazos cruzados en el pecho',
      score: -3,
      category: 'red',
      takeaway:
          'Puede deberse a temperatura, comodidad, hábito o reserva. No identifica una objeción.',
      icon: Icons.cancel_rounded,
    ),
    BuyerSignal(
      id: 'tight_lips',
      label: 'Labios apretados en línea fina',
      score: -2,
      category: 'red',
      takeaway:
          'Puede acompañar concentración, dolor o emoción. No revela una objeción sin preguntarla.',
      icon: Icons.remove_circle_outline_rounded,
    ),
    BuyerSignal(
      id: 'neck_touch',
      label: 'Mano tocando o frotando la nuca',
      score: -2,
      category: 'red',
      takeaway:
          'Puede ser alivio físico, hábito o regulación. Ofrece espacio sin asumir el motivo.',
      icon: Icons.pan_tool_alt_rounded,
    ),
    BuyerSignal(
      id: 'finger_tap',
      label: 'Tamborileo de dedos en la mesa',
      score: -2,
      category: 'red',
      takeaway:
          'Puede ser un hábito motor, regulación o prisa. Puedes comprobar si el ritmo sigue siendo adecuado.',
      icon: Icons.touch_app_outlined,
    ),
    BuyerSignal(
      id: 'lean_back_distance',
      label: 'Reclinarse hacia atrás con distancia',
      score: -3,
      category: 'red',
      takeaway:
          'Puede responder al asiento, cansancio o necesidad de espacio; no confirma desconexión.',
      icon: Icons.airline_seat_flat_rounded,
    ),
  ];

  @override
  State<BuyerTemperatureScreen> createState() => _BuyerTemperatureScreenState();
}

class _BuyerTemperatureScreenState extends State<BuyerTemperatureScreen> {
  int _selectedSalesTab = 0; // 0: Pipeline 4 Fases, 1: Termómetro en Vivo, 2: Guiones y Objeciones, 3: Simulación
  final Set<String> _selectedSignalIds = {};
  final Map<String, String> _objectionFirmness = {}; // 'soft', 'assertive', 'firm'

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  int get _totalScore {
    int total = 0;
    for (final s in BuyerTemperatureScreen.signals) {
      if (_selectedSignalIds.contains(s.id)) {
        total += s.score;
      }
    }
    return total;
  }

  // Calculate percentage: normalized between 0% and 100%
  double get _temperaturePercent {
    if (_selectedSignalIds.isEmpty) return 0.50; // Neutral baseline (50%)
    final score = _totalScore;
    // Map -8 to +8 into 0.0 to 1.0
    final raw = 0.50 + (score / 16.0);
    return raw.clamp(0.05, 1.0);
  }

  String get _temperatureVerdict {
    final pct = _temperaturePercent;
    if (_selectedSignalIds.isEmpty) {
      return 'Observa sin convertirlo en diagnóstico';
    }
    if (pct >= 0.70) {
      return '🟢 Patrón de apertura posible: confirmar con palabras';
    }
    if (pct >= 0.40) {
      return '🟡 Patrón ambiguo: pregunta y deja tiempo';
    }
    return '🔴 Patrón que invita a bajar presión y comprobar necesidades';
  }

  String get _tacticalAdvice {
    final pct = _temperaturePercent;
    if (_selectedSignalIds.isEmpty) {
      return 'Marca las pistas observables para explorar opciones de conversación. Ninguna combinación determina una intención o una decisión de compra.';
    }
    if (pct >= 0.70) {
      return 'Estas pistas no confirman una compra. Puedes preguntar: “¿Qué necesitarías para decidir si esto te sirve?” y respetar una respuesta, una pausa o un no.';
    }
    if (pct >= 0.40) {
      return 'El patrón sigue siendo ambiguo. Haz una pregunta abierta: “¿Qué aspecto te gustaría explorar o aclarar primero?” y escucha sin interrumpir.';
    }
    return 'No supongas una objeción. Baja la presión y ofrece una opción: “Podemos pausar, revisar un punto concreto o retomarlo otro día; ¿qué te vendría mejor?”.';
  }

  Color get _verdictColor {
    final pct = _temperaturePercent;
    if (_selectedSignalIds.isEmpty) return AppColors.primary;
    if (pct >= 0.70) return const Color(0xFF059669);
    if (pct >= 0.40) return const Color(0xFFD97706);
    return const Color(0xFFDC2626);
  }

  void _toggleSignal(String id) {
    FeedbackService.lightClick();
    setState(() {
      if (_selectedSignalIds.contains(id)) {
        _selectedSignalIds.remove(id);
      } else {
        _selectedSignalIds.add(id);
      }
    });
  }

  void _reset() {
    FeedbackService.lightClick();
    setState(() {
      _selectedSignalIds.clear();
    });
  }

  void _speakCurrentTab() {
    FeedbackService.lightClick();
    if (_selectedSalesTab == 0) {
      final buffer =
          StringBuffer('Pipeline de una reunión de ventas en cuatro fases. ');
      for (final p in SalesPipelineDatabase.phases) {
        buffer.write(
            'Fase ${p.phaseNumber}: ${p.title}. Momento: ${p.timing}. Objetivo: ${p.objective}. Pistas a vigilar: ${p.clientSignalsToWatch.join(", ")}. Tu lenguaje corporal: ${p.yourBodyLanguage.join(", ")}. Regla de oro: ${p.keyRule}. ');
      }
      TtsService.speak(buffer.toString(), gestureId: 'sales_tab_0');
    } else if (_selectedSalesTab == 1) {
      TtsService.speak(
          'Temperatura del cliente: $_temperatureVerdict. Táctica recomendada: $_tacticalAdvice',
          gestureId: 'sales_tab_1');
    } else if (_selectedSalesTab == 2) {
      final buffer = StringBuffer(
          'Tácticas y Guiones de Objeciones en Negociación. ');
      for (final obj in SalesPipelineDatabase.objections) {
        buffer.write(
            '${obj.title}. Objeción del cliente: "${obj.objectionPhrase}". Contexto: ${obj.context}. Respuesta asertiva recomendada: "${obj.assertiveResponse}". Lenguaje corporal: ${obj.bodyLanguage}. Trampa a evitar: ${obj.whatNotToDo}. ');
      }
      TtsService.speak(buffer.toString(), gestureId: 'sales_tab_2');
    } else {
      TtsService.speak(
          'Entrenamiento y Simulación de Negociación. Explora los escenarios interactivos y casos de incongruencia comercial seleccionando cada tarjeta.',
          gestureId: 'sales_tab_3');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pct = _temperaturePercent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ruta de Negociación y Ventas'),
        actions: [
          if (_selectedSalesTab == 1)
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              tooltip: 'Reiniciar Señales',
              onPressed: _reset,
            ),
          IconButton(
            icon: const Icon(Icons.volume_up_rounded),
            tooltip: 'Escuchar Sección',
            onPressed: _speakCurrentTab,
          ),
        ],
      ),
      bottomNavigationBar: const AdBottomBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 640;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1050),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  // Banner descriptivo general
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF1E293B)
                          : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.handshake_rounded,
                              size: 24, color: AppColors.primary),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ruta Integral de Negociación y Ventas',
                                style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Pipeline cronológico, calibración no verbal en vivo, manejo de objeciones y simulador de casos.',
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Barra de Pestañas de la Ruta de Ventas
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildNavChip(
                          index: 0,
                          label: 'Pipeline (4 Fases)',
                          icon: Icons.timeline_rounded,
                          isDark: isDark,
                        ),
                        const SizedBox(width: 8),
                        _buildNavChip(
                          index: 1,
                          label: 'Termómetro en Vivo',
                          icon: Icons.thermostat_rounded,
                          isDark: isDark,
                        ),
                        const SizedBox(width: 8),
                        _buildNavChip(
                          index: 2,
                          label: 'Guiones y Objeciones',
                          icon: Icons.forum_rounded,
                          isDark: isDark,
                        ),
                        const SizedBox(width: 8),
                        _buildNavChip(
                          index: 3,
                          label: 'Simulación y Práctica',
                          icon: Icons.sports_esports_rounded,
                          isDark: isDark,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Contenido dinámico según pestaña activa
                  if (_selectedSalesTab == 0) _buildPipelineTab(isDark, isTablet),
                  if (_selectedSalesTab == 1) _buildThermometerTab(isDark, pct),
                  if (_selectedSalesTab == 2) _buildObjectionsTab(isDark, isTablet),
                  if (_selectedSalesTab == 3) _buildPracticeTab(isDark, isTablet),

                  const SizedBox(height: 28),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavChip({
    required int index,
    required String label,
    required IconData icon,
    required bool isDark,
  }) {
    final isSelected = _selectedSalesTab == index;
    return ChoiceChip(
      avatar: Icon(icon,
          size: 18,
          color: isSelected
              ? Colors.white
              : (isDark ? AppColors.accentLight : AppColors.accent)),
      label: Text(label),
      selected: isSelected,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        color: isSelected
            ? Colors.white
            : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
        fontWeight: FontWeight.w700,
        fontSize: 12.5,
      ),
      onSelected: (_) {
        FeedbackService.lightClick();
        setState(() => _selectedSalesTab = index);
      },
    );
  }

  // ===========================================================================
  // PESTAÑA 0: PIPELINE CRONOLÓGICO DE 4 FASES DE LA REUNIÓN
  // ===========================================================================
  Widget _buildPipelineTab(bool isDark, bool isTablet) {
    final phases = SalesPipelineDatabase.phases;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final phase in phases) ...[
          AppCard(
            color: isDark ? const Color(0xFF1E293B) : Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabecera: Fase, Timing y Título
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(phase.icon, size: 22, color: AppColors.primary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'FASE ${phase.phaseNumber}',
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.primary,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              BadgePill(
                                text: phase.timing,
                                color: isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            phase.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Objetivo de la fase
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF0F172A)
                        : const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '🎯 Objetivo: ${phase.objective}',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Señales a observar en el cliente
                const Text(
                  'Pistas No Verbales a Calibrar en el Cliente:',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                for (final signal in phase.clientSignalsToWatch)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.remove_red_eye_outlined,
                            size: 16, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            signal,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.35,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 10),

                // Tu lenguaje corporal recomendado
                const Text(
                  'Tu Lenguaje Corporal Recomendado:',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                for (final tip in phase.yourBodyLanguage)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle_outline_rounded,
                            size: 16, color: AppColors.success),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            tip,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.35,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 12),

                // Regla de Oro
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF1E2638)
                        : const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.star_rounded,
                          size: 18, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          phase.keyRule,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.primaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final id = 'sales_phase_${phase.phaseNumber}';
                      final isSpeaking = speakingId == id;
                      return OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            final signals = phase.clientSignalsToWatch.join('. ');
                            final posture = phase.yourBodyLanguage.join('. ');
                            final speech =
                                'Fase ${phase.phaseNumber}: ${phase.title}. Momento: ${phase.timing}. Objetivo: ${phase.objective}. Pistas del cliente a calibrar: $signals. Tu lenguaje corporal recomendado: $posture. Regla de oro: ${phase.keyRule}';
                            TtsService.speak(speech, gestureId: id);
                          }
                        },
                        icon: Icon(
                          isSpeaking ? Icons.stop_circle_rounded : Icons.volume_up_rounded,
                          size: 15,
                          color: isSpeaking ? AppColors.coral : null,
                        ),
                        label: Text(
                          isSpeaking ? 'Detener' : 'Escuchar Fase',
                          style: const TextStyle(fontSize: 11.5),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
        ],
      ],
    );
  }

  // ===========================================================================
  // PESTAÑA 1: TERMÓMETRO EN VIVO (HERRAMIENTA EXISTENTE)
  // ===========================================================================
  Widget _buildThermometerTab(bool isDark, double pct) {
    return Column(
      children: [
        // Gauge / Meter Banner
        AppCard(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderSide: BorderSide(color: _verdictColor, width: 2.0),
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.thermostat_rounded,
                      size: 28, color: _verdictColor),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _temperatureVerdict,
                          style: TextStyle(
                            fontSize: 15.5,
                            fontWeight: FontWeight.w900,
                            color: _verdictColor,
                          ),
                        ),
                        Text(
                          '${_selectedSignalIds.length} señales observadas',
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: _verdictColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${(pct * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: _verdictColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Progress Gauge Bar
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: pct,
                  minHeight: 12,
                  backgroundColor: isDark
                      ? const Color(0xFF0F172A)
                      : const Color(0xFFE2E8F0),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(_verdictColor),
                ),
              ),
              const SizedBox(height: 14),

              // Tactical Advice Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0F172A)
                      : const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.bolt_rounded,
                        size: 20,
                        color: isDark
                            ? AppColors.accentLight
                            : AppColors.accent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _tacticalAdvice,
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.4,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Signals Selection Sections
        const SectionHeader(
          title: '🟢 Pistas que pueden acompañar apertura',
          subtitle: 'No confirman interés ni decisión',
        ),
        _buildSignalGroup(
            BuyerTemperatureScreen.signals
                .where((s) => s.category == 'green')
                .toList(),
            isDark),
        const SizedBox(height: 16),

        const SectionHeader(
          title: '🟡 Pistas ambiguas para observar con contexto',
          subtitle: 'Pregunta antes de concluir qué ocurre',
        ),
        _buildSignalGroup(
            BuyerTemperatureScreen.signals
                .where((s) => s.category == 'yellow')
                .toList(),
            isDark),
        const SizedBox(height: 16),

        const SectionHeader(
          title: '🔴 Pistas que pueden justificar una pausa',
          subtitle: 'Ofrece opciones sin atribuir resistencia o molestia',
        ),
        _buildSignalGroup(
            BuyerTemperatureScreen.signals
                .where((s) => s.category == 'red')
                .toList(),
            isDark),
      ],
    );
  }

  // ===========================================================================
  // PESTAÑA 2: GUIONES Y MANEJO DE OBJECIONES COMERCIALES
  // ===========================================================================
  Widget _buildObjectionsTab(bool isDark, bool isTablet) {
    final objections = SalesPipelineDatabase.objections;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final obj in objections) ...[
          _buildObjectionCard(obj: obj, isDark: isDark, isTablet: isTablet),
          const SizedBox(height: 14),
        ],
      ],
    );
  }

  Widget _buildObjectionCard({
    required SalesObjectionScript obj,
    required bool isDark,
    required bool isTablet,
  }) {
    final currentFirmness = _objectionFirmness[obj.id] ?? 'assertive';
    String currentResponse;
    if (currentFirmness == 'soft') {
      currentResponse = obj.softResponse;
    } else if (currentFirmness == 'firm') {
      currentResponse = obj.firmResponse;
    } else {
      currentResponse = obj.assertiveResponse;
    }

    return AppCard(
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            obj.title,
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Contexto: ${obj.context}',
            style: TextStyle(
              fontSize: 12,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 10),

          // Frase dicha por el cliente (Objeción)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF2B1C1C)
                  : const Color(0xFFFEF2F2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.error.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.record_voice_over_rounded,
                    size: 16, color: AppColors.error),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Cliente dice: "${obj.objectionPhrase}"',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? const Color(0xFFFCA5A5)
                          : const Color(0xFF991B1B),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Selector de Firmeza
          const Text(
            'Tu Respuesta Táctica:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              ChoiceChip(
                label: const Text('Suave'),
                selected: currentFirmness == 'soft',
                selectedColor: AppColors.indigo,
                labelStyle: TextStyle(
                  fontSize: 11.5,
                  fontWeight: currentFirmness == 'soft'
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: currentFirmness == 'soft'
                      ? Colors.white
                      : (isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight),
                ),
                onSelected: (selected) {
                  if (selected) {
                    FeedbackService.lightClick();
                    setState(() => _objectionFirmness[obj.id] = 'soft');
                  }
                },
              ),
              const SizedBox(width: 6),
              ChoiceChip(
                label: const Text('Asertivo (Recomendado)'),
                selected: currentFirmness == 'assertive',
                selectedColor: AppColors.primary,
                labelStyle: TextStyle(
                  fontSize: 11.5,
                  fontWeight: currentFirmness == 'assertive'
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: currentFirmness == 'assertive'
                      ? Colors.white
                      : (isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight),
                ),
                onSelected: (selected) {
                  if (selected) {
                    FeedbackService.lightClick();
                    setState(() => _objectionFirmness[obj.id] = 'assertive');
                  }
                },
              ),
              const SizedBox(width: 6),
              ChoiceChip(
                label: const Text('Firme'),
                selected: currentFirmness == 'firm',
                selectedColor: AppColors.coral,
                labelStyle: TextStyle(
                  fontSize: 11.5,
                  fontWeight: currentFirmness == 'firm'
                      ? FontWeight.w700
                      : FontWeight.w500,
                  color: currentFirmness == 'firm'
                      ? Colors.white
                      : (isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight),
                ),
                onSelected: (selected) {
                  if (selected) {
                    FeedbackService.lightClick();
                    setState(() => _objectionFirmness[obj.id] = 'firm');
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Caja de la Respuesta seleccionada
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF0F172A)
                  : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentResponse,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        FeedbackService.lightClick();
                        final firmnessLabel = switch (currentFirmness) {
                          'soft' => 'Suave',
                          'assertive' => 'Asertivo',
                          'firm' => 'Firme',
                          _ => 'Asertivo',
                        };
                        final text =
                            '${obj.title}. Objeción planteada: "${obj.objectionPhrase}". Contexto: ${obj.context}. Tu respuesta en nivel $firmnessLabel: $currentResponse. Tu lenguaje corporal recomendado: ${obj.bodyLanguage}. Error a evitar: ${obj.whatNotToDo}';
                        TtsService.speak(text,
                            gestureId: 'obj_${obj.id}');
                      },
                      icon: const Icon(Icons.volume_up_rounded, size: 15),
                      label: const Text('Escuchar',
                          style: TextStyle(fontSize: 11)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: isDark
                            ? AppColors.primary
                            : AppColors.primaryDark,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        FeedbackService.lightClick();
                        Clipboard.setData(ClipboardData(text: currentResponse));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Respuesta copiada al portapapeles'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy_rounded, size: 15),
                      label: const Text('Copiar',
                          style: TextStyle(fontSize: 11)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Pauta no verbal
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF132035)
                  : const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.accessibility_new_rounded,
                    size: 16, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Cuerpo: ${obj.bodyLanguage}',
                    style: TextStyle(
                      fontSize: 11.5,
                      height: 1.35,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),

          // Qué NO hacer
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF2D1F1A)
                  : const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_amber_rounded,
                    size: 16, color: AppColors.warning),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Evitar: ${obj.whatNotToDo}',
                    style: TextStyle(
                      fontSize: 11.5,
                      height: 1.35,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // PESTAÑA 3: SIMULACIÓN Y PRÁCTICA (ENLACE A CASOS Y ESCENARIOS)
  // ===========================================================================
  Widget _buildPracticeTab(bool isDark, bool isTablet) {
    // Tomar los 3 escenarios comerciales
    final salesScenarios = ScenarioDatabase.scenarios.where((s) {
      return s.domain == 'Ventas & Negociación' || s.domain == 'Ventas B2B';
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Simulaciones Interactivas de Negociación',
          subtitle: 'Decisiones paso a paso con consecuencias inmediatas',
        ),
        const SizedBox(height: 8),

        for (final scenario in salesScenarios) ...[
          AppCard(
            color: isDark ? const Color(0xFF1E293B) : Colors.white,
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.record_voice_over_rounded,
                      size: 22, color: AppColors.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        scenario.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        scenario.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: isDark
                              ? AppColors.primary
                              : AppColors.primaryDark,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          FeedbackService.lightClick();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ScenarioRunnerScreen(scenario: scenario),
                            ),
                          );
                        },
                        icon: const Icon(Icons.play_arrow_rounded, size: 16),
                        label: const Text('Iniciar Simulación',
                            style: TextStyle(fontSize: 11.5)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        const SizedBox(height: 16),

        const SectionHeader(
          title: 'Detector de Incongruencias Comerciales',
          subtitle: 'Distingue cuando las palabras del comprador mienten',
        ),
        const SizedBox(height: 8),

        AppCard(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.indigo.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.psychology_alt_rounded,
                        size: 22, color: AppColors.indigo),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '6 Casos Críticos de Negociación',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Objeción de precio encubierta, escudo presupuestario, etc.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.indigo,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  FeedbackService.lightClick();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IncongruenceDetectorScreen(
                        initialAudience: 'sales_focus',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                label: const Text('Abrir Casos de Negociación',
                    style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        const SectionHeader(
          title: 'Checklist de 30 Segundos Antes de Entrar',
          subtitle: 'Reseteo mental y diafragma para la reunión',
        ),
        const SizedBox(height: 8),

        AppCard(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.coral.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.flash_on_rounded,
                        size: 22, color: AppColors.coral),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modo Emergencia / Campo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Checklist rápido de 4 pasos antes de cruzar la puerta del cliente.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  FeedbackService.lightClick();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EmergencyModeScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.checklist_rounded, size: 16),
                label: const Text('Abrir Checklist Pre-Reunión',
                    style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSignalGroup(List<BuyerSignal> list, bool isDark) {
    return Column(
      children: list.map((s) {
        final isSelected = _selectedSignalIds.contains(s.id);
        final color = s.category == 'green'
            ? const Color(0xFF059669)
            : (s.category == 'yellow'
                ? const Color(0xFFD97706)
                : const Color(0xFFDC2626));

        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: AppCard(
            color: isSelected
                ? color.withValues(alpha: isDark ? 0.25 : 0.12)
                : (isDark ? const Color(0xFF1E293B) : Colors.white),
            borderSide: BorderSide(
              color: isSelected
                  ? color
                  : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
              width: isSelected ? 1.8 : 1.0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            onTap: () => _toggleSignal(s.id),
            child: Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded,
                  color: isSelected
                      ? color
                      : (isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight),
                  size: 22,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.label,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight:
                              isSelected ? FontWeight.w800 : FontWeight.w600,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        s.takeaway,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    s.score > 0 ? '+${s.score}' : '${s.score}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
