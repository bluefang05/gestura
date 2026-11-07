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
  final bool animateGesture;
  final bool animatePreview;
  final BorderRadius? borderRadius;
  final bool enableHoldPreview;

  const ConoVeIllustration({
    super.key,
    required this.illustrationKey,
    this.width = 120,
    this.height = 120,
    this.highlightAnatomy = false,
    this.animateGesture = false,
    this.animatePreview = false,
    this.borderRadius,
    this.enableHoldPreview = true,
  });

  static const _animatedPaths = {
    'duchenne_smile': 'assets/images/expressions/duchenne_smile_animated.gif',
    'sonrisa_genuina': 'assets/images/expressions/duchenne_smile_animated.gif',
    'eyebrow_flash': 'assets/images/expressions/eyebrow_flash_animated.gif',
    'flash_cejas': 'assets/images/expressions/eyebrow_flash_animated.gif',
    'open_posture': 'assets/images/postures/open_posture_animated.gif',
    'postura_abierta': 'assets/images/postures/open_posture_animated.gif',
    'leaning_forward':
        'assets/images/postures/leaning_forward_animated.gif',
    'inclinacion_adelante':
        'assets/images/postures/leaning_forward_animated.gif',
    'leaning_back': 'assets/images/postures/leaning_back_animated.gif',
    'inclinacion_atras':
        'assets/images/postures/leaning_back_animated.gif',
    'polite_smile': 'assets/images/expressions/polite_smile_animated.gif',
    'sonrisa_falsa': 'assets/images/expressions/polite_smile_animated.gif',
    'closed_posture': 'assets/images/postures/closed_posture_animated.gif',
    'brazos_cruzados': 'assets/images/postures/closed_posture_animated.gif',
    'hand_wringing': 'assets/images/postures/hand_wringing_animated.gif',
    'frotar_manos': 'assets/images/postures/hand_wringing_animated.gif',
    'shrug': 'assets/images/postures/shrug_animated.gif',
    'encogerse_hombros': 'assets/images/postures/shrug_animated.gif',
    'head_tilt': 'assets/images/postures/head_tilt_animated.gif',
    'cabeza_inclinada': 'assets/images/postures/head_tilt_animated.gif',
    'finger_tapping': 'assets/images/postures/finger_tapping_animated.gif',
    'tamborilear_dedos':
        'assets/images/postures/finger_tapping_animated.gif',
    'handshake_firm': 'assets/images/postures/handshake_firm_animated.gif',
    'apreton_manos': 'assets/images/postures/handshake_firm_animated.gif',
    'weight_shift': 'assets/images/postures/weight_shift_animated.gif',
    'winking_face': 'assets/images/expressions/wink_animated.gif',
    'guino': 'assets/images/expressions/wink_animated.gif',
    'closed_eyelids': 'assets/images/expressions/blink_animated.gif',
    'parpados_cerrados': 'assets/images/expressions/blink_animated.gif',
    'proxemics_social': 'assets/images/proxemics/proxemics_social_animated.gif',
    'digital_visto': 'assets/images/digital/digital_visto_animated.gif',
    'digital_ghosting': 'assets/images/digital/digital_ghosting_animated.gif',
    'digital_mayusculas':
        'assets/images/digital/digital_mayusculas_animated.gif',
    'digital_audio': 'assets/images/digital/digital_audio_animated.gif',
    'abrupt_topic_change':
        'assets/images/neuroaffirmative/abrupt_topic_change_animated.gif',
    'emoji_support':
        'assets/images/neuroaffirmative/emoji_support_animated.gif',
    'proxemics_personal':
        'assets/images/proxemics/proxemics_personal_animated.gif',
    'hands_behind_back':
        'assets/images/postures/hands_behind_back_animated.gif',
    'postural_mirroring':
        'assets/images/postures/postural_mirroring_animated.gif',
    'hand_on_chin': 'assets/images/postures/hand_on_chin_animated.gif',
    'foot_orientation':
        'assets/images/postures/foot_orientation_animated.gif',
    'self_hold_arm': 'assets/images/postures/self_hold_arm_animated.gif',
    'voice_volume_high':
        'assets/images/paralinguistics/voice_volume_high_animated.gif',
    'volumen_alto':
        'assets/images/paralinguistics/voice_volume_high_animated.gif',
    'silence_tense':
        'assets/images/paralinguistics/silence_tense_animated.gif',
    'silencio_incomodo':
        'assets/images/paralinguistics/silence_tense_animated.gif',
    'sarcastic_inflection': 'assets/images/paralinguistics/sarcastic_inflection_animated.gif',
    'tono_sarcastico': 'assets/images/paralinguistics/sarcastic_inflection_animated.gif',
    'assertive_voice': 'assets/images/paralinguistics/assertive_voice_animated.gif',
    'tono_asertivo': 'assets/images/paralinguistics/assertive_voice_animated.gif',
    'voice_prosody':
        'assets/images/paralinguistics/voice_prosody_animated.gif',
    'voice_tremor':
        'assets/images/paralinguistics/voice_tremor_animated.gif',
    'scenario_group_conversation_entry':
        'assets/images/scenarios/scenario_group_conversation_entry_animated.gif',
    'reflective_vs_tense_silence':
        'assets/images/neuroaffirmative/reflective_vs_tense_silence_animated.gif',
    'voice_speed_fast':
        'assets/images/paralinguistics/voice_speed_fast_animated.gif',
    'velocidad_rapida':
        'assets/images/paralinguistics/voice_speed_fast_animated.gif',
    'turn_taking': 'assets/images/paralinguistics/turn_taking_animated.gif',
    'tight_lips': 'assets/images/expressions/tight_lips_animated.gif',
    'labios_apretados': 'assets/images/expressions/tight_lips_animated.gif',
    'averted_gaze': 'assets/images/expressions/averted_gaze_animated.gif',
    'mirada_esquiva': 'assets/images/expressions/averted_gaze_animated.gif',
    'surprised_look': 'assets/images/expressions/surprised_look_animated.gif',
    'sorpresa': 'assets/images/expressions/surprised_look_animated.gif',
    'frowning_brow': 'assets/images/expressions/frowning_brow_animated.gif',
    'ceno_fruncido': 'assets/images/expressions/frowning_brow_animated.gif',
    'frown_eyebrows': 'assets/images/expressions/frowning_brow_animated.gif',
    'narrowed_eyes': 'assets/images/expressions/narrowed_eyes_animated.gif',
    'ojos_entrecerrados':
        'assets/images/expressions/narrowed_eyes_animated.gif',
    'smirk_contempt': 'assets/images/expressions/smirk_contempt_animated.gif',
    'desden': 'assets/images/expressions/smirk_contempt_animated.gif',
    'lip_biting': 'assets/images/expressions/lip_biting_animated.gif',
    'morder_labio': 'assets/images/expressions/lip_biting_animated.gif',
    'hands_on_hips': 'assets/images/postures/hands_on_hips_animated.gif',
    'manos_caderas': 'assets/images/postures/hands_on_hips_animated.gif',
    'hands_behind_head':
        'assets/images/postures/hands_behind_head_animated.gif',
    'manos_nuca': 'assets/images/postures/hands_behind_head_animated.gif',
    'steepling_hands': 'assets/images/postures/steepling_hands_animated.gif',
    'manos_ojiva': 'assets/images/postures/steepling_hands_animated.gif',
    'touching_neck': 'assets/images/postures/touching_neck_animated.gif',
    'tocarse_cuello': 'assets/images/postures/touching_neck_animated.gif',
    'digital_emojis': 'assets/images/digital/digital_emojis_animated.gif',
    'hands_in_pockets': 'assets/images/postures/hands_in_pockets_animated.gif',
    'manos_bolsillos': 'assets/images/postures/hands_in_pockets_animated.gif',
    'legs_crossed': 'assets/images/postures/legs_crossed_animated.gif',
    'piernas_cruzadas': 'assets/images/postures/legs_crossed_animated.gif',
    'desk_barrier': 'assets/images/environment/desk_barrier_animated.gif',
    'round_table': 'assets/images/environment/round_table_animated.gif',
    'seating_angle': 'assets/images/environment/seating_angle_animated.gif',
    'context_mirada_notas':
        'assets/images/communication/context_mirada_notas_animated.gif',
    'context_pausa_conversacion':
        'assets/images/communication/context_pausa_conversacion_animated.gif',
    'scenario_conversacion_silencio':
        'assets/images/communication/context_pausa_conversacion_animated.gif',
    'pause_before_reply':
        'assets/images/communication/context_pausa_conversacion_animated.gif',
    'silence_reflective':
        'assets/images/communication/context_pausa_conversacion_animated.gif',
    'context_revisar_documento':
        'assets/images/communication/context_revisar_documento_animated.gif',
    'context_ruido_cafeteria':
        'assets/images/communication/context_ruido_cafeteria_animated.gif',
    'context_movimiento_escucha':
        'assets/images/communication/context_movimiento_escucha_animated.gif',
    'context_chat_remoto':
        'assets/images/communication/context_chat_remoto_animated.gif',
    'context_acceso_espacio':
        'assets/images/communication/context_acceso_espacio_animated.gif',
    'context_tarea_compartida':
        'assets/images/communication/context_tarea_compartida_animated.gif',
  };

  static bool hasAnimation(String key) =>
      _animatedPaths.containsKey(key.toLowerCase().trim());

  @override
  State<ConoVeIllustration> createState() => _ConoVeIllustrationState();
}

class _ConoVeIllustrationState extends State<ConoVeIllustration> {
  OverlayEntry? _previewOverlay;
  bool _previewClosesOnRelease = false;

  static const Map<String, String> _semanticDescriptions = {
    'duchenne_smile':
        'La expresión pasa gradualmente de neutra a una sonrisa amplia. La animación muestra el movimiento de la cara; no confirma emociones ni intenciones.',
    'sonrisa_genuina':
        'La expresión pasa gradualmente de neutra a una sonrisa amplia. La animación muestra el movimiento de la cara; no confirma emociones ni intenciones.',
    'eyebrow_flash':
        'Las cejas suben brevemente y vuelven a su posición. El gesto, por sí solo, no confirma una emoción ni una intención.',
    'flash_cejas':
        'Las cejas suben brevemente y vuelven a su posición. El gesto, por sí solo, no confirma una emoción ni una intención.',
    'open_posture':
        'Los brazos se abren suavemente desde una posición relajada y vuelven al costado. La postura aislada no confirma una emoción ni una intención.',
    'postura_abierta':
        'Los brazos se abren suavemente desde una posición relajada y vuelven al costado. La postura aislada no confirma una emoción ni una intención.',
    'polite_smile':
        'La boca pasa de una expresión neutra a una sonrisa leve. El movimiento por sí solo no permite saber qué siente o piensa la persona.',
    'closed_posture':
        'Los brazos se desplazan gradualmente hasta quedar cruzados. La postura aislada no confirma una emoción ni una intención.',
    'leaning_forward':
        'El torso se inclina hacia delante y vuelve a una posición erguida. El movimiento aislado no confirma una emoción ni una intención.',
    'leaning_back':
        'El torso se inclina hacia atrás y vuelve a una posición erguida. El movimiento aislado no confirma una emoción ni una intención.',
    'finger_tapping':
        'Los dedos dan varios golpecitos sobre la superficie y se detienen. El movimiento aislado no confirma una emoción ni una intención.',
    'hand_wringing':
        'Las manos se juntan y se frotan brevemente. El movimiento aislado no confirma una emoción ni una intención.',
    'shrug':
        'Los hombros suben brevemente y vuelven a su posición. El gesto por sí solo no confirma una emoción ni una intención.',
    'head_tilt':
        'La cabeza se inclina suavemente hacia un lado y vuelve al centro. El movimiento aislado no confirma una emoción ni una intención.',
    'handshake_firm':
        'Dos personas extienden las manos, se saludan y las retiran. El apretón por sí solo no confirma una emoción ni una intención.',
    'weight_shift':
        'El peso pasa de una pierna a la otra y vuelve a repartirse. El movimiento aislado no confirma una emoción ni una intención.',
    'winking_face':
        'Un ojo se cierra brevemente mientras el otro permanece abierto y luego ambos vuelven a abrirse. El gesto aislado no confirma una intención.',
    'closed_eyelids':
        'Los párpados bajan y se levantan en un parpadeo natural.',
    'proxemics_social':
        'Una persona da un paso y cambia la distancia con la otra. La distancia por sí sola no indica comodidad, confianza ni intención.',
    'digital_visto':
        'En el chat, se escribe y envía un mensaje y después aparece el indicador de lectura. El indicador no explica por qué ni cuándo responderá alguien.',
    'scenario_group_conversation_entry':
        'Una persona se acerca a un grupo, hace una pausa y se incorpora a la conversación. La escena muestra una posibilidad, no una regla social.',
    'voice_speed_fast':
        'La forma de onda muestra un ritmo de habla que se acelera y luego vuelve a espaciarse. El ritmo por sí solo no permite deducir un estado emocional.',
    'turn_taking':
        'Dos personas alternan momentos para hablar y escuchar, con pausas entre turnos.',
    'context_aclarar_fecha':
        'Dos colegas revisan un calendario. Uno señala una casilla y la otra persona toma notas. La imagen representa un referente compartido; no indica una fecha real ni el estado emocional de quienes participan.',
    'context_mirada_notas':
        'En una conversación en una cafetería, una persona consulta sus notas mientras la otra escucha; la imagen no permite deducir por qué mira el papel.',
    'context_ruido_cafeteria':
        'Dos amistades conversan en una cafetería concurrida; el ruido del lugar forma parte de la situación.',
    'context_tarea_compartida':
        'Dos colegas revisan juntas un material en una computadora y colaboran en la misma tarea.',
    'context_chat_remoto':
        'Una persona participa en una reunión remota escribiendo un mensaje mientras mantiene apagada la cámara.',
    'context_pausa_conversacion':
        'En una cafetería, una persona se toma un momento para mirar el menú mientras su acompañante espera.',
    'context_revisar_documento':
        'Dos colegas revisan un documento compartido; la atención se centra en el material de trabajo.',
    'context_movimiento_escucha':
        'Una persona usa las manos al participar en una conversación de trabajo; moverlas no impide escuchar.',
    'context_acceso_espacio':
        'Una persona en silla de ruedas conversa con otras en una mesa; la ilustración muestra participación cotidiana.',
    'sensory_overload_supermarket':
        'Niño en un supermercado protegiendo sus oídos mientras el entorno está concurrido.',
    'ambiguous_ok_message':
        'Dos personas en un intercambio de mensajes donde una respuesta breve puede tener varios significados.',
    'social_fatigue':
        'Persona en una reunión social que podría necesitar una pausa o más espacio.',
    'pause_before_reply':
        'Una persona hace una pausa mientras su acompañante espera. La escena no permite saber por qué tarda en responder.',
    'emoji_support':
        'Persona recibe un emoji como señal breve de acompañamiento o confirmación.',
    'abrupt_topic_change':
        'Grupo conversando mientras una persona introduce con entusiasmo un tema distinto.',
    'reflective_vs_tense_silence':
        'Las escenas alternan entre una pausa con postura relajada y otra con mayor rigidez corporal. Las imágenes ilustran variaciones y no confirman emociones.',
    'scenario_assertive_boundaries_work':
        'Una persona se acerca a un escritorio mientras otra está sentada. Sus posturas no permiten saber cuál es su petición ni si existe un acuerdo.',
    'scenario_consent_decoding_fawning':
        'Dos personas conversan en un café; una gesticula y la otra mira hacia abajo con las manos juntas. La imagen no permite saber si desea aceptar la invitación.',
    'scenario_conversacion_silencio':
        'Dos personas conversan con tranquilidad durante un descanso; una de ellas toma una pausa reflexiva junto a la luz de una ventana para procesar su respuesta con calma.',
  };

  String get _semanticDescription =>
      _semanticDescriptions[widget.illustrationKey] ??
      'Ilustración visual de comunicación: ${widget.illustrationKey.replaceAll('_', ' ')}';

  String? _animatedAssetPath(String key) {
    final clean = key.toLowerCase().trim();
    if (!widget.animateGesture || MediaQuery.disableAnimationsOf(context)) {
      return null;
    }
    return ConoVeIllustration._animatedPaths[clean];
  }

  String? _resolveAssetPath(String key, [bool isLarge = false]) {
    final clean = key.toLowerCase().trim();

    if (_expandedIllustrationPaths.containsKey(clean)) {
      return _expandedIllustrationPaths[clean];
    }

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

      // voz y forma de hablar
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

      // Espacio personal
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
      'scenario_conversacion_silencio': 'scenarios',

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
      'frown_eyebrows': 'frowning_brow',
      'sonrisa_falsa': 'polite_smile',
      'sonrisa_genuina': 'duchenne_smile',
      'sorpresa': 'surprised_look',
      'labios_apretados': 'tight_lips',
      'tristeza': 'turned_down_lips',
      'guino': 'winking_face',

      // voz y forma de hablar
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

      // Espacio personal
      'espacio': 'proxemica',
      'proxemics_all': 'proxemica',

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
    final assetPath = _animatedAssetPath(widget.illustrationKey) ??
        _resolveAssetPath(widget.illustrationKey, isLarge);
    if (assetPath != null && !isHighContrast) {
      final dpr = MediaQuery.devicePixelRatioOf(context);

      return _withHoldPreview(
        Semantics(
          label: _semanticDescription,
          hint: widget.enableHoldPreview
              ? (widget.width >= 90 && widget.height >= 90
                  ? 'Toca para ampliar en pantalla completa'
                  : 'Mantén presionado para ampliar en pantalla completa')
              : null,
          image: true,
          child: ClipRRect(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
            child: Container(
              width: widget.width,
              height: widget.height,
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
              padding: const EdgeInsets.all(4),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Decode for the actual padded display area, including previews
                  // whose requested size is infinite but whose layout is bounded.
                  final displayWidth = constraints.hasBoundedWidth
                      ? constraints.maxWidth
                      : 512.0;
                  final displayHeight = constraints.hasBoundedHeight
                      ? constraints.maxHeight
                      : 512.0;
                  return Image(
                    image: ResizeImage(
                      AssetImage(assetPath),
                      width: (displayWidth * dpr).ceil().clamp(1, 1024),
                      height: (displayHeight * dpr).ceil().clamp(1, 1024),
                      policy: ResizeImagePolicy.fit,
                    ),
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) =>
                        _buildFallbackPainter(isDark, isHighContrast),
                  );
                },
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
            ? (widget.width >= 90 && widget.height >= 90
                ? 'Toca para ampliar en pantalla completa'
                : 'Mantén presionado para ampliar en pantalla completa')
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
      message: hasAffordance
          ? 'Toca para ampliar'
          : 'Mantén presionado para ampliar',
      waitDuration: const Duration(milliseconds: 600),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: hasAffordance
            ? () {
                FeedbackService.lightClick();
                _showPreview();
              }
            : null,
        onLongPressStart: (_) {
          FeedbackService.lightClick();
          _showPreview(closesOnRelease: true);
        },
        onLongPressEnd: (_) => _hidePreview(),
        onLongPressCancel: _hidePreview,
        child: content,
      ),
    );
  }

  void _showPreview({bool closesOnRelease = false}) {
    if (_previewOverlay != null) return;
    _previewClosesOnRelease = closesOnRelease;

    _previewOverlay = OverlayEntry(
      builder: (context) {
        final screenSize = MediaQuery.sizeOf(context);
        final previewSize =
            (screenSize.shortestSide * 0.84).clamp(260.0, 560.0);

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _hidePreview,
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
                      animateGesture:
                          widget.animateGesture || widget.animatePreview,
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
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.touch_app_rounded,
                            size: 16, color: Colors.white),
                        Text(
                          _previewClosesOnRelease
                              ? 'Suelta para cerrar'
                              : 'Toca para cerrar',
                          style: const TextStyle(
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
    _previewClosesOnRelease = false;
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

const Map<String, String> _expandedIllustrationPaths = {
  'context_aclarar_fecha':
      'assets/images/communication/context_aclarar_fecha.png',
  'context_mirada_notas':
      'assets/images/communication/context_mirada_notas.webp',
  'context_ruido_cafeteria':
      'assets/images/communication/context_ruido_cafeteria.webp',
  'context_tarea_compartida':
      'assets/images/communication/context_tarea_compartida.webp',
  'context_chat_remoto': 'assets/images/communication/context_chat_remoto.webp',
  'context_pausa_conversacion':
      'assets/images/communication/context_pausa_conversacion.webp',
  'context_revisar_documento':
      'assets/images/communication/context_revisar_documento.webp',
  'context_movimiento_escucha':
      'assets/images/communication/context_movimiento_escucha.webp',
  'context_acceso_espacio':
      'assets/images/communication/context_acceso_espacio.webp',
};

typedef GesturaIllustration = ConoVeIllustration;
