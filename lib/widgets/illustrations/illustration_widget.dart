import 'package:flutter/material.dart';
import 'facial_expression_painter.dart';
import 'body_posture_painter.dart';
import 'proxemics_painter.dart';
import 'digital_signals_painter.dart';
import 'paralinguistics_painter.dart';
import 'environment_painter.dart';
import 'scenario_painter.dart';
import 'gestura_logo_painter.dart';
import '../../core/services/feedback_service.dart';

class ConoVeIllustration extends StatefulWidget {
  final String illustrationKey;
  final double width;
  final double height;
  final bool highlightAnatomy;
  final BorderRadius? borderRadius;
  final bool enableHoldPreview;

  const ConoVeIllustration({
    super.key,
    required this.illustrationKey,
    this.width = 120,
    this.height = 120,
    this.highlightAnatomy = false,
    this.borderRadius,
    this.enableHoldPreview = true,
  });

  @override
  State<ConoVeIllustration> createState() => _ConoVeIllustrationState();
}

class _ConoVeIllustrationState extends State<ConoVeIllustration> {
  OverlayEntry? _previewOverlay;

  static const Map<String, String> _semanticDescriptions = {
    'sensory_overload_supermarket':
        'Niño en un supermercado protegiendo sus oídos mientras el entorno está concurrido.',
    'ambiguous_ok_message':
        'Dos personas en un intercambio de mensajes donde una respuesta breve puede tener varios significados.',
    'social_fatigue':
        'Persona en una reunión social que podría necesitar una pausa o más espacio.',
    'pause_before_reply':
        'Persona haciendo una pausa para procesar una pregunta antes de responder.',
    'emoji_support':
        'Persona recibe un emoji como señal breve de acompañamiento o confirmación.',
    'abrupt_topic_change':
        'Grupo conversando mientras una persona introduce con entusiasmo un tema distinto.',
    'reflective_vs_tense_silence':
        'Comparación entre una pausa reflexiva y una situación con tensión corporal y ambiental.',
    'scenario_assertive_boundaries_work':
        'Colega apoyado en el escritorio pidiendo un favor de último momento mientras la persona mantiene una postura asertiva y serena.',
    'scenario_consent_decoding_fawning':
        'Dos amigos conversando en un café; uno invita con entusiasmo mientras la otra persona muestra apaciguamiento con sonrisa forzada y orientación corporal de escape.',
  };

  String get _semanticDescription =>
      _semanticDescriptions[widget.illustrationKey] ??
      'Ilustración visual de comunicación: ${widget.illustrationKey.replaceAll('_', ' ')}';

  String? _resolveAssetPath(String key, [bool isLarge = false]) {
    final clean = key.toLowerCase().trim();

    const categoryMap = {
      // Expresiones
      'duchenne_smile': 'expressions',
      'sonrisa_genuina': 'expressions',
      'polite_smile': 'expressions',
      'sonrisa_falsa': 'expressions',
      'frowning_brow': 'expressions',
      'ceno_fruncido': 'expressions',
      'narrowed_eyes': 'expressions',
      'ojos_entrecerrados': 'expressions',
      'winking_face': 'expressions',
      'guino': 'expressions',
      'smirk_contempt': 'expressions',
      'desden': 'expressions',
      'tight_lips': 'expressions',
      'labios_apretados': 'expressions',
      'surprised_look': 'expressions',
      'sorpresa': 'expressions',
      'averted_gaze': 'expressions',
      'mirada_esquiva': 'expressions',
      'closed_eyelids': 'expressions',
      'parpados_cerrados': 'expressions',
      'jaw_clenching': 'expressions',
      'mandibula_apretada': 'expressions',
      'lip_biting': 'expressions',
      'morder_labio': 'expressions',
      'eyebrow_flash': 'expressions',
      'flash_cejas': 'expressions',
      'pupil_dilation': 'expressions',
      'pupilas_dilatadas': 'expressions',
      'nostril_flaring': 'expressions',
      'aleteo_nasal': 'expressions',
      'turned_down_lips': 'expressions',
      'tristeza': 'expressions',

      // Posturas
      'open_posture': 'postures',
      'postura_abierta': 'postures',
      'closed_posture': 'postures',
      'brazos_cruzados': 'postures',
      'leaning_forward': 'postures',
      'inclinacion_adelante': 'postures',
      'leaning_back': 'postures',
      'inclinacion_atras': 'postures',
      'hand_wringing': 'postures',
      'frotar_manos': 'postures',
      'finger_tapping': 'postures',
      'tamborilear_dedos': 'postures',
      'shrug': 'postures',
      'encogerse_hombros': 'postures',
      'hands_on_hips': 'postures',
      'manos_caderas': 'postures',
      'hands_behind_head': 'postures',
      'manos_nuca': 'postures',
      'steepling_hands': 'postures',
      'manos_ojiva': 'postures',
      'head_tilt': 'postures',
      'cabeza_inclinada': 'postures',
      'touching_neck': 'postures',
      'tocarse_cuello': 'postures',
      'hands_behind_back': 'postures',
      'brazos_espalda': 'postures',
      'hands_in_pockets': 'postures',
      'manos_bolsillos': 'postures',
      'legs_crossed': 'postures',
      'piernas_cruzadas': 'postures',
      'handshake_firm': 'postures',
      'apreton_manos': 'postures',
      'hand_on_chin': 'postures',
      'pensador': 'postures',
      'hands_clasped_front': 'postures',
      'weight_shift': 'postures',
      'foot_orientation': 'postures',
      'self_hold_arm': 'postures',
      'postural_mirroring': 'postures',

      // Paralingüística
      'voice_volume_high': 'paralinguistics',
      'volumen_alto': 'paralinguistics',
      'voice_volume_low': 'paralinguistics',
      'volumen_bajo': 'paralinguistics',
      'voice_speed_fast': 'paralinguistics',
      'velocidad_rapida': 'paralinguistics',
      'voice_monotone': 'paralinguistics',
      'tono_monotono': 'paralinguistics',
      'sarcastic_inflection': 'paralinguistics',
      'tono_sarcastico': 'paralinguistics',
      'assertive_voice': 'paralinguistics',
      'tono_asertivo': 'paralinguistics',
      'silence_tense': 'paralinguistics',
      'silencio_incomodo': 'paralinguistics',
      'silence_reflective': 'paralinguistics',
      'silencio_reflexivo': 'paralinguistics',
      'voice_prosody': 'paralinguistics',
      'voice_tremor': 'paralinguistics',
      'turn_taking': 'paralinguistics',

      // Proxémica
      'proxemics_intima': 'proxemics',
      'proxemics_personal': 'proxemics',
      'proxemics_social': 'proxemics',
      'proxemics_publica': 'proxemics',
      'proxemics_all': 'proxemics',
      'proxemica': 'proxemics',
      'espacio': 'proxemics',

      // Digital
      'digital_mayusculas': 'digital',
      'digital_visto': 'digital',
      'digital_ghosting': 'digital',
      'digital_emojis': 'digital',
      'digital_audio': 'digital',

      // Entorno
      'dress_formal': 'environment',
      'dress_casual': 'environment',
      'desk_barrier': 'environment',
      'round_table': 'environment',
      'seating_angle': 'environment',
      'lighting_atmosphere': 'environment',

      // Escenarios
      'scenario_sales_closing': 'scenarios',
      'scenario_job_interview': 'scenarios',
      'scenario_friend_coffee': 'scenarios',
      'scenario_negotiation': 'scenarios',
      'scenario_shopping_backchannel': 'scenarios',
      'scenario_meeting_seating': 'scenarios',
      'scenario_exit_strategy': 'scenarios',
      'scenario_interrupt_busy_colleague': 'scenarios',
      'scenario_group_conversation_entry': 'scenarios',
      'scenario_delay_objection_sales': 'scenarios',
      'scenario_assertive_boundaries_work': 'scenarios',
      'scenario_consent_decoding_fawning': 'scenarios',

      // Contenido neuroafirmativo
      'sensory_overload_supermarket': 'neuroaffirmative',
      'ambiguous_ok_message': 'neuroaffirmative',
      'social_fatigue': 'neuroaffirmative',
      'pause_before_reply': 'neuroaffirmative',
      'emoji_support': 'neuroaffirmative',
      'abrupt_topic_change': 'neuroaffirmative',
      'reflective_vs_tense_silence': 'neuroaffirmative',

      // Branding
      'logo': 'branding',
      'gestura_logo': 'branding',
      'conove_logo': 'branding',
    };

    const aliasMap = {
      // Expresiones
      'flash_cejas': 'eyebrow_flash',
      'ceno_fruncido': 'frowning_brow',
      'mandibula_apretada': 'jaw_clenching',
      'mirada_esquiva': 'averted_gaze',
      'morder_labio': 'lip_biting',
      'nostril_flaring': 'aleteo_nasal',
      'ojos_entrecerrados': 'narrowed_eyes',
      'parpados_cerrados': 'closed_eyelids',
      'pupilas_dilatadas': 'pupil_dilation',
      'desden': 'smirk_contempt',
      'sonrisa_falsa': 'polite_smile',
      'sonrisa_genuina': 'duchenne_smile',
      'sorpresa': 'surprised_look',
      'labios_apretados': 'tight_lips',
      'tristeza': 'turned_down_lips',
      'guino': 'winking_face',

      // Paralingüística
      'silencio_incomodo': 'silence_tense',
      'silencio_reflexivo': 'silence_reflective',
      'tono_asertivo': 'assertive_voice',
      'tono_sarcastico': 'sarcastic_inflection',
      'tono_monotono': 'voice_monotone',
      'velocidad_rapida': 'voice_speed_fast',
      'volumen_alto': 'voice_volume_high',
      'volumen_bajo': 'voice_volume_low',

      // Posturas
      'brazos_cruzados': 'closed_posture',
      'apreton_manos': 'handshake_firm',
      'brazos_espalda': 'hands_behind_back',
      'frotar_manos': 'hand_wringing',
      'cabeza_inclinada': 'head_tilt',
      'inclinacion_atras': 'leaning_back',
      'inclinacion_adelante': 'leaning_forward',
      'manos_bolsillos': 'hands_in_pockets',
      'manos_caderas': 'hands_on_hips',
      'manos_nuca': 'hands_behind_head',
      'piernas_cruzadas': 'legs_crossed',
      'postura_abierta': 'open_posture',
      'encogerse_hombros': 'shrug',
      'manos_ojiva': 'steepling_hands',
      'tamborilear_dedos': 'finger_tapping',
      'tocarse_cuello': 'touching_neck',
      'pensador': 'hand_on_chin',

      // Proxémica
      'espacio': 'proxemica',
      'proxemics_all': 'proxemica',
      'proxemics_social': 'proxemica',

      // Branding
      'logo': 'gestura_logo',
      'conove_logo': 'gestura_logo',
    };

    final canonicalKey = aliasMap[clean] ?? clean;
    if (categoryMap.containsKey(canonicalKey)) {
      final folder = categoryMap[canonicalKey]!;
      return 'assets/images/$folder/$canonicalKey.png';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isHighContrast =
        Theme.of(context).scaffoldBackgroundColor == Colors.black;

    final isLarge = widget.width >= 160 || widget.height >= 160;
    final assetPath = _resolveAssetPath(widget.illustrationKey, isLarge);
    if (assetPath != null && !isHighContrast) {
      final dpr = MediaQuery.devicePixelRatioOf(context);
      final targetWidth = widget.width.isFinite ? widget.width : 512.0;
      final targetHeight = widget.height.isFinite ? widget.height : 512.0;
      final cacheW = (targetWidth * dpr).round().clamp(100, 1024);
      final cacheH = (targetHeight * dpr).round().clamp(100, 1024);

      return _withHoldPreview(
        Semantics(
          label: _semanticDescription,
          hint: widget.enableHoldPreview
              ? 'Mantén presionado para ampliar en pantalla completa'
              : null,
          image: true,
          child: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
            child: Container(
              width: widget.width,
              height: widget.height,
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                assetPath,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.contain,
                cacheWidth: cacheW,
                cacheHeight: cacheH,
                errorBuilder: (_, __, ___) =>
                    _buildFallbackPainter(isDark, isHighContrast),
              ),
            ),
          ),
        ),
      );
    }

    final child = _buildFallbackPainter(isDark, isHighContrast);

    return _withHoldPreview(
      Semantics(
        label: _semanticDescription,
        hint: widget.enableHoldPreview
            ? 'Mantén presionado para ampliar en pantalla completa'
            : null,
        image: true,
        child: ClipRRect(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          child: SizedBox(
            width: widget.width,
            height: widget.height,
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _withHoldPreview(Widget child) {
    if (!widget.enableHoldPreview || widget.width < 56 || widget.height < 56) {
      return child;
    }

    final hasAffordance = widget.width >= 90 && widget.height >= 90;

    final content = hasAffordance
        ? Stack(
            clipBehavior: Clip.none,
            children: [
              child,
              Positioned(
                bottom: 6,
                right: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.52),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.35),
                      width: 0.8,
                    ),
                  ),
                  child: const Icon(
                    Icons.zoom_in_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        : child;

    return Tooltip(
      message: 'Mantén presionado para ampliar',
      waitDuration: const Duration(milliseconds: 600),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPressStart: (_) {
          FeedbackService.lightClick();
          _showPreview();
        },
        onLongPressEnd: (_) => _hidePreview(),
        onLongPressCancel: _hidePreview,
        child: content,
      ),
    );
  }

  void _showPreview() {
    if (_previewOverlay != null) return;

    _previewOverlay = OverlayEntry(
      builder: (context) {
        final screenSize = MediaQuery.sizeOf(context);
        final previewSize =
            (screenSize.shortestSide * 0.84).clamp(260.0, 560.0);

        return IgnorePointer(
          child: Material(
            color: Colors.black.withValues(alpha: 0.72),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: previewSize,
                    height: previewSize,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardTheme.color,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 30,
                          offset: Offset(0, 18),
                        ),
                      ],
                    ),
                    child: ConoVeIllustration(
                      illustrationKey: widget.illustrationKey,
                      width: double.infinity,
                      height: double.infinity,
                      highlightAnatomy: widget.highlightAnatomy,
                      borderRadius: BorderRadius.circular(14),
                      enableHoldPreview: false,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.65),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.touch_app_rounded,
                            size: 16, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Mantén presionado para observar • Suelta para cerrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_previewOverlay!);
  }

  void _hidePreview() {
    _previewOverlay?.remove();
    _previewOverlay = null;
  }

  @override
  void dispose() {
    _hidePreview();
    super.dispose();
  }

  Widget _buildFallbackPainter(bool isDark, bool isHighContrast) {
    final illustrationKey = widget.illustrationKey;

    if (illustrationKey == 'logo' ||
        illustrationKey == 'conove_logo' ||
        illustrationKey == 'gestura_logo') {
      return CustomPaint(
        painter:
            GesturaLogoPainter(isDark: isDark, isHighContrast: isHighContrast),
        size: Size(widget.width, widget.height),
      );
    } else if (illustrationKey.startsWith('proxemics_') ||
        illustrationKey.contains('proxemica') ||
        illustrationKey == 'espacio') {
      final zone = illustrationKey
          .replaceAll('proxemics_', '')
          .replaceAll('proxemica_', '');
      return CustomPaint(
        painter: ProxemicsPainter(
          activeZone: zone.isEmpty ? 'all' : zone,
          isDark: isDark,
          isHighContrast: isHighContrast,
        ),
        size: Size(widget.width, widget.height),
      );
    } else if (illustrationKey.startsWith('voice_') ||
        illustrationKey.startsWith('paralinguistics_') ||
        illustrationKey.startsWith('silence_') ||
        illustrationKey.contains('volumen') ||
        illustrationKey.contains('tono') ||
        illustrationKey.contains('silencio') ||
        illustrationKey.contains('voz') ||
        illustrationKey.contains('pausa') ||
        illustrationKey.contains('sarcastico')) {
      final cleanKey = illustrationKey
          .replaceAll('voice_', '')
          .replaceAll('paralinguistics_', '');
      return CustomPaint(
        painter: ParalinguisticsPainter(
          soundKey: cleanKey,
          isDark: isDark,
          isHighContrast: isHighContrast,
        ),
        size: Size(widget.width, widget.height),
      );
    } else if (illustrationKey.startsWith('env_') ||
        illustrationKey.startsWith('dress_') ||
        illustrationKey.startsWith('desk_') ||
        illustrationKey.contains('vestimenta') ||
        illustrationKey.contains('mesa') ||
        illustrationKey.contains('escritorio') ||
        illustrationKey.contains('angulo') ||
        illustrationKey.contains('iluminacion') ||
        illustrationKey.contains('apariencia') ||
        illustrationKey.contains('entorno')) {
      final cleanKey = illustrationKey.replaceAll('env_', '');
      return CustomPaint(
        painter: EnvironmentPainter(
          envKey: cleanKey,
          isDark: isDark,
          isHighContrast: isHighContrast,
        ),
        size: Size(widget.width, widget.height),
      );
    } else if (illustrationKey.startsWith('digital_') ||
        illustrationKey.contains('mayusculas') ||
        illustrationKey.contains('visto') ||
        illustrationKey.contains('ghosting') ||
        illustrationKey.contains('emoji') ||
        illustrationKey.contains('audio') ||
        illustrationKey.contains('chat')) {
      final cleanKey = illustrationKey.replaceAll('digital_', '');
      return CustomPaint(
        painter: DigitalSignalsPainter(
          digitalKey: cleanKey,
          isDark: isDark,
          isHighContrast: isHighContrast,
        ),
        size: Size(widget.width, widget.height),
      );
    } else if (illustrationKey.startsWith('posture_') ||
        illustrationKey.contains('postura') ||
        illustrationKey.contains('brazos') ||
        illustrationKey.contains('inclinacion') ||
        illustrationKey.contains('hombros') ||
        illustrationKey.contains('manos') ||
        illustrationKey.contains('dedos') ||
        illustrationKey.contains('cabeza') ||
        illustrationKey.contains('cuello') ||
        illustrationKey.contains('piernas') ||
        illustrationKey.contains('apreton') ||
        illustrationKey.contains('ojiva') ||
        illustrationKey.contains('shrug') ||
        illustrationKey.contains('hand') ||
        illustrationKey.contains('finger') ||
        illustrationKey.contains('head_') ||
        illustrationKey.contains('legs_') ||
        illustrationKey.contains('neck') ||
        illustrationKey.contains('steeple') ||
        illustrationKey.contains('leaning')) {
      final cleanKey = illustrationKey.replaceAll('posture_', '');
      return CustomPaint(
        painter: BodyPosturePainter(
          postureKey: cleanKey,
          isDark: isDark,
          isHighContrast: isHighContrast,
        ),
        size: Size(widget.width, widget.height),
      );
    } else if (illustrationKey.startsWith('scenario_') ||
        illustrationKey.contains('ventas') ||
        illustrationKey.contains('laboral') ||
        illustrationKey.contains('entrevista') ||
        illustrationKey.contains('cafe')) {
      final cleanKey = illustrationKey.replaceAll('scenario_', '');
      return CustomPaint(
        painter: ScenarioPainter(
          scenarioKey: cleanKey,
          isDark: isDark,
          isHighContrast: isHighContrast,
        ),
        size: Size(widget.width, widget.height),
      );
    } else {
      return CustomPaint(
        painter: FacialExpressionPainter(
          expressionKey: illustrationKey,
          isDark: isDark,
          isHighContrast: isHighContrast,
          highlightAnatomy: widget.highlightAnatomy,
        ),
        size: Size(widget.width, widget.height),
      );
    }
  }
}

typedef GesturaIllustration = ConoVeIllustration;
