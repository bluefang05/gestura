import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/common/tts_app_bar_control.dart';
import '../core/services/tts_service.dart';
import '../models/social_script.dart';
import '../data/social_scripts_database.dart';
import '../data/boundary_framework_database.dart';

class UnwrittenRulesScreen extends StatefulWidget {
  final int initialTab;
  final int initialSubView;
  final SocialScriptCategory? initialCategory;

  const UnwrittenRulesScreen({
    super.key,
    this.initialTab = 0,
    this.initialSubView = 0,
    this.initialCategory,
  });

  @override
  State<UnwrittenRulesScreen> createState() => _UnwrittenRulesScreenState();
}

class _UnwrittenRulesScreenState extends State<UnwrittenRulesScreen> {
  late int _selectedTab;
  late int _boundarySubView;
  late SocialScriptCategory? _selectedScriptCategory;
  final Map<String, ScriptFirmness> _scriptFirmnessMap = {};

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
    _boundarySubView = widget.initialSubView;
    _selectedScriptCategory = widget.initialCategory;
  }

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  static const String _smallTalkSpeech =
      '¿Por qué existe el Small Talk? '
      'Para muchas personas autistas o lógicas, hablar del clima, del tráfico o del fin de semana parece una pérdida de tiempo sin valor informativo. Sin embargo, en el cerebro neurotípico tiene una función biológica crucial: '
      'El Small Talk es un ping de red no verbal. No importa el clima: es un apretón de manos sónico que comunica: "Te reconozco como humano, no soy una amenaza y el canal de comunicación está en paz". '
      'Las 3 Reglas de Oro para Navegarlo sin Agotarte: '
      'Regla 1: La Regla de los 30 Segundos. No des respuestas de enciclopedia ni conferencias técnicas. Si te preguntan "¿Qué tal el fin de semana?", responde en 1 o 2 frases simples y devuelve la pelota: "Tranquilo, descansando en casa. ¿Y tú, qué tal?". '
      'Regla 2: Preguntas Abiertas de Baja Presión. Usa preguntas universales que no comprometan su intimidad: "¿Mucho movimiento en la oficina hoy?", "¿Qué tal estuvo el tráfico para llegar?", "¿Lograste descansar el fin de semana?". '
      'Regla 3: El Cierre Amable de 1 Minuto. El small talk rara vez debe durar más de 60 a 90 segundos. Puedes cerrarlo de forma impecable diciendo: "Bueno, te dejo continuar para no quitarte tiempo. ¡Buen día!".';

  static const String _nervousLaughSpeech =
      'La Risa como Alivio de Tensión Social. '
      'En el mundo neurotípico, la risa no siempre significa diversión o felicidad. Existe la llamada risa nerviosa o risa de pacificación, que se utiliza para desactivar situaciones incómodas o mitigar malas noticias. '
      'Comparativa: '
      'Risa Genuina: Ojos entrecerrados con patas de gallo activas por el músculo orbicular. Hombros y mandíbula relajados. Exhalación sonora espontánea. '
      'Risa Nerviosa o Tensa: Boca abierta mostrando dientes pero ojos inmóviles. Cuello rígido con tendones marcados. Mirada que busca a terceros buscando auxilio social. '
      'Cómo Reaccionar: Si cometes un error social y la otra persona se ríe nerviosamente, no te burles ni asumas que le divirtió. Normaliza el momento con tranquilidad: "Disculpa si sonó raro o fuera de lugar, lo que quería decir es..." y continúa sin dramatismo.';

  static const String _pokerSarcasmSpeech =
      'Sarcasmo Real: La Voz Manda, la Cara Engaña. '
      'En los cómics y caricaturas, los personajes sonríen con malicia cuando son irónicos. En la vida real, los adultos suelen usar una cara de póker completamente seria mientras dicen una ironía. Por eso para personas literales o autistas resulta tan confuso. '
      'Las 3 Claves Auditivas para Detectar Sarcasmo: '
      'Clave 1: Alargamiento de Vocales o Drawling. Alargan deliberadamente las palabras clave: "Claaaaaro que sí...", "Qué graaaan idea...". El estiramiento de la sílaba comunica contradicción con el texto literal. '
      'Clave 2: Monotonía Exagerada o Deadpan. La frase se pronuncia en una línea plana absoluta sin emoción alguna, como si estuvieran leyendo una receta. Esa falta artificial de calidez delata el sarcasmo. '
      'Clave 3: La Pausa Asimétrica. Hay una micro-pausa de 1 segundo justo después de que dices algo, seguida de la respuesta. Esa demora indica que su cerebro evaluó si responder en serio o con una broma. '
      'Regla de Supervivencia: Si dudas si alguien fue sarcástico o literal, no te enojes ni adivines. Pregunta con tono curioso y neutro: "¿Lo dices en broma o en serio?". El 95% de la gente aclarará su intención de inmediato sin ofenderse.';

  void _speakCurrentSection() {
    String textToSpeak = '';
    if (_selectedTab == 0) {
      textToSpeak = _smallTalkSpeech;
    } else if (_selectedTab == 1) {
      final buffer = StringBuffer('Decodificador de indirectas cotidianas. ');
      for (final item in _indirectPhrases) {
        buffer.write(
            'Frase: "${item['phrase']}". Literalmente: "${item['literal']}". En realidad: "${item['realMeaning']}". Pista corporal: "${item['signal']}". Respuesta: "${item['response']}". ');
      }
      textToSpeak = buffer.toString();
    } else if (_selectedTab == 2) {
      textToSpeak = _nervousLaughSpeech;
    } else if (_selectedTab == 3) {
      textToSpeak = _pokerSarcasmSpeech;
    } else {
      if (_boundarySubView == 0) {
        textToSpeak =
            'La Ruta de los Límites y Consentimiento en cuatro fases. Fase uno: Entender los tuyos mediante el radar somático. Fase dos: Comunicarlos con la fórmula observable, impacto y acción. Fase tres: Sostenerlos ante insistencia y culpa. Fase cuatro: Decodificar el consentimiento real y el falso sí por desgaste.';
      } else {
        textToSpeak =
            'Biblioteca de Guiones Asertivos y Consentimiento. Frases prefabricadas y lenguaje corporal para marcar límites y ofrecer puertas de escape airosas sin presionar.';
      }
    }
    TtsService.speak(textToSpeak, gestureId: 'unwritten_rules_$_selectedTab');
  }

  final List<Map<String, dynamic>> _indirectPhrases = [
    {
      'phrase': 'No te preocupes, yo me encargo de hacerlo...',
      'literal': 'No tienes que hacer nada, yo lo resolveré con gusto.',
      'realMeaning':
          'Estoy abrumado/a o molesto/a por tener que hacerlo solo/a. Esperaba que te ofrecieras o que insistieras en ayudarme.',
      'signal': 'Suspiro breve, postura rígida o tono de voz plano/apagado.',
      'response':
          'Insiste amablemente una vez: "De verdad, permíteme ayudarte con una parte. Dime qué te aligera más la carga y lo hacemos juntos".',
      'category': 'Colaboración',
    },
    {
      'phrase': 'Haz lo que a ti te parezca mejor...',
      'literal': 'Tienes total libertad para elegir la opción que desees.',
      'realMeaning':
          'Tengo una preferencia clara en mente y no me gusta tu opción. Si haces lo que quieres sin consultarme, generará resentimiento.',
      'signal':
          'Contacto visual cortado rápidamente, labios comprimidos en línea fina.',
      'response':
          'Pausa y pregunta abiertamente: "Noto que no estás del todo convencido/a con esta alternativa. ¿Cuál sería tu opción ideal para que los dos estemos tranquilos?".',
      'category': 'Decisiones',
    },
    {
      'phrase': 'A ver si nos vemos pronto para tomar un café...',
      'literal': 'Vamos a agendar una fecha próxima para vernos.',
      'realMeaning':
          'Fórmula de cortesía social de despedida. Expresa simpatía momentánea, pero no implica un compromiso real de reunión.',
      'signal':
          'Se dice siempre al momento de despedirse mientras el cuerpo ya se aleja.',
      'response':
          'Responde en el mismo nivel de cortesía: "¡Claro que sí, un gusto verte!". No saques la agenda de inmediato a menos que la persona proponga un día exacto.',
      'category': 'Social',
    },
    {
      'phrase': 'Está interesante tu propuesta...',
      'literal': 'Tu idea es fascinante y despierta curiosidad.',
      'realMeaning':
          'Descarte educado o escepticismo velado. No les convence, pero no quieren herir tus sentimientos con un "no" directo.',
      'signal':
          'Ceño ligeramente ladeado, pausa antes de contestar y mirada vaga.',
      'response':
          'Desarma la cortesía: "Gracias. Con total sinceridad, ¿qué aspecto sientes que no termina de encajar con lo que necesitas?".',
      'category': 'Laboral / Ventas',
    },
    {
      'phrase': 'No me pasa nada, estoy bien.',
      'literal': 'Mi estado emocional es de tranquilidad y bienestar.',
      'realMeaning':
          'Estoy conteniendo molestia, tristeza o sobrecarga y no quiero o no puedo explicarlo ahora mismo.',
      'signal':
          'Mandíbula apretada, hombros levantados y suspiro prolongado al terminar la frase.',
      'response':
          'No interrogues ni presiones: "Entiendo. Te noto un poco cansado/a. Si quieres que lo hablemos después o si prefieres espacio y silencio, aquí estoy".',
      'category': 'Relaciones',
    },
    {
      'phrase': 'Si tú crees que es lo más adecuado...',
      'literal': 'Confío plenamente en tu criterio.',
      'realMeaning':
          'Tengo serias dudas y no estoy de acuerdo, pero no quiero asumir la responsabilidad del resultado si algo sale mal.',
      'signal':
          'Encogimiento asimétrico de un solo hombro o balanceo de cabeza.',
      'response':
          'Valida su opinión: "¿Qué riesgos ves tú que quizás yo no estoy considerando? Me interesa mucho tu punto de vista antes de decidir".',
      'category': 'Liderazgo',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('El Manual de lo No Dicho'),
        actions: [
          TtsAppBarControl(
            onPlay: _speakCurrentSection,
            activeTag: 'unwritten_rules_$_selectedTab',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 640;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                children: [
                  // Banner descriptivo
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
                        Icon(Icons.auto_stories_rounded,
                            size: 28,
                            color: isDark
                                ? AppColors.accentLight
                                : AppColors.accent),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Decodificación literal de las reglas no escritas, indirectas cotidianas y convenciones sociales que nadie enseña explícitamente.',
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.4,
                              color: isDark
                                  ? AppColors.textSecondaryDark
                                  : AppColors.textSecondaryLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Barra de pestañas de contenido
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildNavChip(
                            index: 0,
                            label: 'El Mito del Small Talk',
                            icon: Icons.chat_bubble_outline_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 1,
                            label: 'Decodificador de Indirectas',
                            icon: Icons.transform_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 2,
                            label: 'Risa Incómoda vs Real',
                            icon: Icons.sentiment_satisfied_alt_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 3,
                            label: 'Sarcasmo con Cara de Póker',
                            icon: Icons.record_voice_over_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 4,
                            label: 'Límites y Consentimiento',
                            icon: Icons.shield_outlined,
                            isDark: isDark),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Contenido dinámico según pestaña
                  if (_selectedTab == 0) _buildSmallTalkContent(isDark),
                  if (_selectedTab == 1)
                    _buildIndirectsContent(isDark, isTablet),
                  if (_selectedTab == 2) _buildNervousLaughContent(isDark),
                  if (_selectedTab == 3) _buildPokerSarcasmContent(isDark),
                  if (_selectedTab == 4)
                    _buildSocialScriptsContent(isDark, isTablet),

                  const SizedBox(height: 32),
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
    final isSelected = _selectedTab == index;
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
        fontSize: 13,
      ),
      onSelected: (_) {
        FeedbackService.lightClick();
        setState(() => _selectedTab = index);
      },
    );
  }

  // --- SECCIÓN 1: SMALL TALK ---
  Widget _buildSmallTalkContent(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.wifi_tethering_rounded,
                      size: 22,
                      color:
                          isDark ? AppColors.primaryLight : AppColors.primary),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      '¿Por qué existe el "Small Talk"?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'rules_smalltalk';
                      return IconButton(
                        icon: Icon(
                          isSpeaking
                              ? Icons.stop_circle_rounded
                              : Icons.volume_up_rounded,
                          size: 22,
                          color: isSpeaking
                              ? AppColors.coral
                              : (isDark
                                  ? AppColors.accentLight
                                  : AppColors.accent),
                        ),
                        tooltip: isSpeaking
                            ? 'Detener lectura'
                            : 'Escuchar explicación de Small Talk',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(_smallTalkSpeech,
                                gestureId: 'rules_smalltalk');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Para muchas personas autistas o lógicas, hablar del clima, del tráfico o del fin de semana parece una pérdida de tiempo sin valor informativo. Sin embargo, en el cerebro neurotípico tiene una función biológica crucial:',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0F172A)
                      : const Color(0xFFE2E8F0).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.lightbulb_rounded,
                        size: 20, color: AppColors.warning),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'El Small Talk es un "ping de red no verbal". No importa el clima: es un apretón de manos sónico que comunica: "Te reconozco como humano, no soy una amenaza y el canal de comunicación está en paz".',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: isDark
                              ? const Color(0xFFF1F5F9)
                              : const Color(0xFF1E293B),
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

        // Reglas de juego del Small Talk
        const Text(
          'Las 3 Reglas de Oro para Navegarlo sin Agotarte',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),

        _buildTipCard(
          number: '1',
          title: 'La Regla de los 30 Segundos',
          description:
              'No des respuestas de enciclopedia ni conferencias técnicas. Si te preguntan "¿Qué tal el fin de semana?", responde en 1 o 2 frases simples y devuelve la pelota: "Tranquilo, descansando en casa. ¿Y tú, qué tal?".',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildTipCard(
          number: '2',
          title: 'Preguntas Abiertas de Baja Presión',
          description:
              'Usa preguntas universales que no comprometan su intimidad: "¿Mucho movimiento en la oficina hoy?", "¿Qué tal estuvo el tráfico para llegar?", "¿Lograste descansar el fin de semana?".',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildTipCard(
          number: '3',
          title: 'El Cierre Amable de 1 Minuto',
          description:
              'El small talk rara vez debe durar más de 60-90 segundos. Puedes cerrarlo de forma impecable diciendo: "Bueno, te dejo continuar para no quitarte tiempo. ¡Buen día!".',
          isDark: isDark,
        ),
      ],
    );
  }

  // --- SECCIÓN 2: INDIRECTAS ---
  Widget _buildIndirectsContent(bool isDark, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Decodificador de Frases Cotidianas (${_indirectPhrases.length} Casos)',
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        Text(
          'Toca cada tarjeta para entender qué dicen las palabras, qué significa en realidad y cómo responder con precisión.',
          style: TextStyle(
            fontSize: 13,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 14),
        for (final item in _indirectPhrases) ...[
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BadgePill(
                      text: item['category'] as String,
                      color: AppColors.primary,
                    ),
                    const Spacer(),
                    ValueListenableBuilder<String?>(
                      valueListenable: TtsService.currentSpeakingIdNotifier,
                      builder: (context, speakingId, _) {
                        final id = 'indirect_${item['phrase']}';
                        final isSpeaking = speakingId == id;
                        return IconButton(
                          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            isSpeaking
                                ? Icons.stop_circle_rounded
                                : Icons.volume_up_rounded,
                            size: 20,
                            color: isSpeaking
                                ? AppColors.coral
                                : (isDark
                                    ? AppColors.primaryLight
                                    : AppColors.primary),
                          ),
                          tooltip: isSpeaking
                              ? 'Detener lectura'
                              : 'Escuchar decodificación completa',
                          onPressed: () {
                            FeedbackService.lightClick();
                            if (isSpeaking) {
                              TtsService.stop();
                            } else {
                              final text =
                                  'Frase indirecta: "${item['phrase']}". Lo que las palabras dicen literalmente: ${item['literal']}. Lo que en realidad significa: ${item['realMeaning']}. Pista corporal observable: ${item['signal']}. Respuesta asertiva recomendada: ${item['response']}.';
                              TtsService.speak(text, gestureId: id);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '“${item['phrase']}”',
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 8),

                // Significado literal (lo que se dice)
                if (item['literal'] != null) ...[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF0F172A)
                          : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.format_quote_rounded,
                            size: 15,
                            color: isDark
                                ? AppColors.textMutedDark
                                : AppColors.textMutedLight),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.35,
                                color: isDark
                                    ? AppColors.textMutedDark
                                    : AppColors.textSecondaryLight,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Literalmente: ',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                  text: item['literal'] as String,
                                  style: const TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],

                const Divider(height: 1),
                const SizedBox(height: 10),

                // Significado real
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.bolt_rounded,
                        size: 18, color: AppColors.coral),
                    const SizedBox(width: 6),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.35,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Subtexto o intención habitual: ',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            TextSpan(text: item['realMeaning'] as String),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Pista no verbal
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.remove_red_eye_rounded,
                        size: 18,
                        color:
                            isDark ? AppColors.accentLight : AppColors.accent),
                    const SizedBox(width: 6),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.35,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Pista corporal: ',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(text: item['signal'] as String),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Respuesta recomendada
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF064E3B).withValues(alpha: 0.3)
                        : AppColors.successContainer,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isDark
                          ? const Color(0xFF059669).withValues(alpha: 0.4)
                          : const Color(0xFFA7F3D0),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_outline_rounded,
                          size: 18, color: AppColors.success),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['response'] as String,
                          style: TextStyle(
                            fontSize: 12.5,
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? const Color(0xFFECFDF5)
                                : const Color(0xFF064E3B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }

  // --- SECCIÓN 3: RISA INCÓMODA ---
  Widget _buildNervousLaughContent(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.sentiment_neutral_rounded,
                      size: 22, color: AppColors.warning),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'La Risa como Alivio de Tensión Social',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'rules_nervous_laugh';
                      return IconButton(
                        icon: Icon(
                          isSpeaking
                              ? Icons.stop_circle_rounded
                              : Icons.volume_up_rounded,
                          size: 22,
                          color: isSpeaking
                              ? AppColors.coral
                              : (isDark
                                  ? AppColors.accentLight
                                  : AppColors.accent),
                        ),
                        tooltip: isSpeaking
                            ? 'Detener lectura'
                            : 'Escuchar explicación de la risa',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(_nervousLaughSpeech,
                                gestureId: 'rules_nervous_laugh');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'En el mundo neurotípico, la risa NO siempre significa diversión o felicidad. Existe la llamada "risa nerviosa" o "risa de pacificación", que se utiliza para desactivar situaciones incómodas o mitigar malas noticias.',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 16),

              // Comparativa visual
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF064E3B).withValues(alpha: 0.3)
                            : AppColors.successContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '😄 Risa Genuina',
                            style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.success),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '• Ojos entrecerrados con patas de gallo activas (músculo orbicular).\n• Hombros y mandíbula relajados.\n• Exhalación sonora espontánea.',
                            style: TextStyle(
                              fontSize: 12.5,
                              height: 1.35,
                              color: isDark
                                  ? const Color(0xFFECFDF5)
                                  : const Color(0xFF064E3B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF78350F).withValues(alpha: 0.3)
                            : AppColors.warningContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '😬 Risa Nerviosa / Tensa',
                            style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.warning),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '• Boca abierta mostrando dientes pero ojos inmóviles.\n• Cuello rígido con tendones marcados.\n• Mirada que busca a terceros buscando auxilio social.',
                            style: TextStyle(
                              fontSize: 12.5,
                              height: 1.35,
                              color: isDark
                                  ? const Color(0xFFFEF3C7)
                                  : const Color(0xFF78350F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Cómo Reaccionar:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              Text(
                'Si cometes un error social y la otra persona se ríe nerviosamente, no te burles ni asumas que le divirtió. Normaliza el momento con tranquilidad: "Disculpa si sonó raro o fuera de lugar, lo que quería decir es..." y continúa sin dramatismo.',
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
      ],
    );
  }

  // --- SECCIÓN 4: SARCASMO CON CARA DE PÓKER ---
  Widget _buildPokerSarcasmContent(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.face_retouching_natural_rounded,
                      size: 22, color: AppColors.indigo),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Sarcasmo Real: La Voz Manda, la Cara Engaña',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'rules_poker_sarcasm';
                      return IconButton(
                        icon: Icon(
                          isSpeaking
                              ? Icons.stop_circle_rounded
                              : Icons.volume_up_rounded,
                          size: 22,
                          color: isSpeaking
                              ? AppColors.coral
                              : (isDark
                                  ? AppColors.accentLight
                                  : AppColors.accent),
                        ),
                        tooltip: isSpeaking
                            ? 'Detener lectura'
                            : 'Escuchar explicación de sarcasmo',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(_pokerSarcasmSpeech,
                                gestureId: 'rules_poker_sarcasm');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'En los cómics y caricaturas, los personajes sonríen con malicia cuando son irónicos. En la vida real, los adultos suelen usar una "cara de póker" completamente seria mientras dicen una ironía. Por eso para personas literales o autistas resulta tan confuso.',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Las 3 Claves Auditivas para Detectar Sarcasmo:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              _buildAuditoryClue(
                icon: Icons.graphic_eq_rounded,
                title: 'Alargamiento de Vocales (Drawling)',
                description:
                    'Alargan deliberadamente las palabras clave: "Claaaaaro que sí...", "Qué graaaan idea...". El estiramiento de la sílaba comunica contradicción con el texto literal.',
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildAuditoryClue(
                icon: Icons.horizontal_rule_rounded,
                title: 'Monotonía Exagerada (Deadpan)',
                description:
                    'La frase se pronuncia en una línea plana absoluta sin emoción alguna, como si estuvieran leyendo una receta. Esa falta artificial de calidez delata el sarcasmo.',
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildAuditoryClue(
                icon: Icons.hourglass_bottom_rounded,
                title: 'La Pausa Asimétrica',
                description:
                    'Hay una micro-pausa de 1 segundo justo después de que dices algo, seguida de la respuesta. Esa demora indica que su cerebro evaluó si responder en serio o con una broma.',
                isDark: isDark,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF1E1B4B)
                      : const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? const Color(0xFF4338CA)
                        : const Color(0xFFC7D2FE),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.shield_rounded,
                        size: 20, color: AppColors.indigo),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Regla de Supervivencia: Si dudas si alguien fue sarcástico o literal, no te enojes ni adivines. Pregunta con tono curioso y neutro: "¿Lo dices en broma o en serio?". El 95% de la gente aclarará su intención de inmediato sin ofenderse.',
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? const Color(0xFFE0E7FF)
                              : const Color(0xFF312E81),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTipCard({
    required String number,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isDark ? AppColors.primary : AppColors.primary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12.5,
                    height: 1.35,
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

  Widget _buildAuditoryClue({
    required IconData icon,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon,
            size: 20, color: isDark ? AppColors.accentLight : AppColors.accent),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 13.5, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.35,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // PESTAÑA 4: LÍMITES Y DECIR "NO" (GUIONES SOCIALES Y ASERTIVIDAD)
  // ===========================================================================
  Widget _buildSocialScriptsContent(bool isDark, bool isTablet) {
    final allScripts = SocialScriptsDatabase.scripts;
    final filteredScripts = _selectedScriptCategory == null
        ? allScripts
        : SocialScriptsDatabase.getByCategory(_selectedScriptCategory!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner introductorio
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
                      color: AppColors.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.shield_rounded,
                        color: AppColors.primary, size: 24),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Límites y Consentimiento Real',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Aprende a marcar tus propios límites sin culpa y a decodificar cuándo el otro cede por presión.',
                          style: TextStyle(fontSize: 12.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0F172A)
                      : const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline_rounded,
                        size: 18,
                        color: isDark
                            ? AppColors.accentLight
                            : AppColors.accent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Regla de oro: Si tuviste que insistir para que dijeran que sí, te dijeron que no antes. El consentimiento debe ser libre y espontáneo; la insistencia genera complacencia forzada.',
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
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
        const SizedBox(height: 16),

        // Selector de Modo: La Ruta en 3 Fases vs Biblioteca de Guiones
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFE2E8F0),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Expanded(
                child: _buildSubTabButton(
                  title: 'La Ruta en 3 Fases',
                  icon: Icons.alt_route_rounded,
                  isSelected: _boundarySubView == 0,
                  isDark: isDark,
                  onTap: () {
                    FeedbackService.lightClick();
                    setState(() => _boundarySubView = 0);
                  },
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: _buildSubTabButton(
                  title: 'Biblioteca de Guiones (${allScripts.length})',
                  icon: Icons.menu_book_rounded,
                  isSelected: _boundarySubView == 1,
                  isDark: isDark,
                  onTap: () {
                    FeedbackService.lightClick();
                    setState(() => _boundarySubView = 1);
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        if (_boundarySubView == 0)
          _buildBoundaryFrameworkContent(isDark, isTablet)
        else
          _buildScriptsLibraryContent(
              filteredScripts, allScripts.length, isDark, isTablet),
      ],
    );
  }

  Widget _buildSubTabButton({
    required String title,
    required IconData icon,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? AppColors.primary : Colors.white)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: isDark ? 0.3 : 0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 17,
              color: isSelected
                  ? (isDark ? Colors.white : AppColors.primary)
                  : (isDark
                      ? AppColors.textMutedDark
                      : AppColors.textMutedLight),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  color: isSelected
                      ? (isDark ? Colors.white : AppColors.primaryDark)
                      : (isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // SUB-VISTA: LA RUTA EN 3 FASES (ENTENDERLOS, HACERLOS, SOSTENERLOS)
  // ===========================================================================
  Widget _buildBoundaryFrameworkContent(bool isDark, bool isTablet) {
    final phases = BoundaryFrameworkDatabase.phases;

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
                // Cabecera: Fase y Título
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(phase.icon,
                          size: 22, color: AppColors.primary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          const SizedBox(height: 2),
                          Text(
                            phase.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            phase.subtitle,
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
                const SizedBox(height: 12),

                // Principio Rector
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF0F172A)
                        : const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isDark
                          ? AppColors.darkBorder
                          : AppColors.lightBorder,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.format_quote_rounded,
                          size: 20,
                          color: isDark
                              ? AppColors.accentLight
                              : AppColors.accent),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          phase.corePrinciple,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontStyle: FontStyle.italic,
                            height: 1.35,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),

                // Conceptos Clave
                const Text(
                  'Claves y Mecanismos de la Fase:',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                for (final item in phase.conceptItems) ...[
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: isDark
                          ? const Color(0xFF132035)
                          : const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(item.icon,
                                size: 16, color: AppColors.primary),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            if (item.badge != null)
                              BadgePill(
                                text: item.badge!,
                                color: AppColors.primary,
                              ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item.description,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.35,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 8),

                // Protocolo Práctico / Regla de Oro
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF1E2638)
                        : const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.35),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_outline_rounded,
                          size: 18, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          phase.practicalProtocol,
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

                // Botón de Escucha TTS para la Fase
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      FeedbackService.lightClick();
                      final conceptsBuffer = StringBuffer();
                      for (final concept in phase.conceptItems) {
                        conceptsBuffer.write('${concept.title}: ${concept.description}. ');
                      }
                      TtsService.speak(
                        '${phase.title}. ${phase.subtitle}. Principio rector: ${phase.corePrinciple}. Claves y mecanismos: $conceptsBuffer Protocolo práctico: ${phase.practicalProtocol}',
                        gestureId: 'boundary_phase_${phase.phaseNumber}',
                      );
                    },
                    icon: const Icon(Icons.volume_up_rounded, size: 16),
                    label: const Text('Escuchar Fase',
                        style: TextStyle(fontSize: 11.5)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
        ],

        // Tarjeta de Transición a la Biblioteca
        AppCard(
          color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                '¿Listo para poner en práctica la teoría?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 4),
              Text(
                'Consulta los 14 guiones reales clasificados con selector de firmeza.',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? AppColors.primary
                      : AppColors.primaryDark,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  FeedbackService.lightClick();
                  setState(() => _boundarySubView = 1);
                },
                icon: const Icon(Icons.menu_book_rounded, size: 16),
                label: const Text('Abrir Biblioteca de Guiones',
                    style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // SUB-VISTA: BIBLIOTECA DE GUIONES SOCIALES
  // ===========================================================================
  Widget _buildScriptsLibraryContent(List<SocialScript> filteredScripts,
      int totalScriptsCount, bool isDark, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filtros de categoría de guiones
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildCategoryChip(
                label: 'Todos ($totalScriptsCount)',
                icon: Icons.all_inclusive_rounded,
                isSelected: _selectedScriptCategory == null,
                isDark: isDark,
                onSelected: () {
                  FeedbackService.lightClick();
                  setState(() => _selectedScriptCategory = null);
                },
              ),
              const SizedBox(width: 8),
              for (final cat in SocialScriptCategory.values) ...[
                _buildCategoryChip(
                  label:
                      '${cat.label} (${SocialScriptsDatabase.getByCategory(cat).length})',
                  icon: cat.icon,
                  isSelected: _selectedScriptCategory == cat,
                  isDark: isDark,
                  onSelected: () {
                    FeedbackService.lightClick();
                    setState(() => _selectedScriptCategory = cat);
                  },
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Lista de tarjetas de guiones
        for (final script in filteredScripts) ...[
          _buildScriptCard(script: script, isDark: isDark, isTablet: isTablet),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _buildCategoryChip({
    required String label,
    required IconData icon,
    required bool isSelected,
    required bool isDark,
    required VoidCallback onSelected,
  }) {
    return ChoiceChip(
      avatar: Icon(icon,
          size: 16,
          color: isSelected
              ? Colors.white
              : (isDark ? AppColors.accentLight : AppColors.accent)),
      label: Text(label),
      selected: isSelected,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
        color: isSelected
            ? Colors.white
            : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
      ),
      onSelected: (_) => onSelected(),
    );
  }

  Widget _buildScriptCard({
    required SocialScript script,
    required bool isDark,
    required bool isTablet,
  }) {
    final currentFirmness =
        _scriptFirmnessMap[script.id] ?? ScriptFirmness.assertive;
    final currentPhrase = script.getPhraseByFirmness(currentFirmness);

    return AppCard(
      color: isDark ? const Color(0xFF1E293B) : Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabecera: Título y Categoría
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(script.category.icon,
                    size: 18, color: AppColors.primary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      script.title,
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    BadgePill(
                      text: script.category.label,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Contexto / Cuándo ocurre
          Text(
            script.contextDescription,
            style: TextStyle(
              fontSize: 12.5,
              height: 1.35,
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 14),

          // Selector de Nivel de Firmeza
          const Text(
            'Nivel de Firmeza:',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final f in ScriptFirmness.values)
                ChoiceChip(
                  avatar: Icon(f.icon,
                      size: 14,
                      color: currentFirmness == f
                          ? Colors.white
                          : (isDark
                              ? AppColors.textMutedDark
                              : AppColors.textMutedLight)),
                  label: Text(f.label),
                  selected: currentFirmness == f,
                  selectedColor: f == ScriptFirmness.firm
                      ? AppColors.coral
                      : (f == ScriptFirmness.assertive
                          ? AppColors.primary
                          : AppColors.indigo),
                  labelStyle: TextStyle(
                    fontSize: 11.5,
                    fontWeight: currentFirmness == f
                        ? FontWeight.w700
                        : FontWeight.w500,
                    color: currentFirmness == f
                        ? Colors.white
                        : (isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight),
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      FeedbackService.lightClick();
                      setState(() {
                        _scriptFirmnessMap[script.id] = f;
                      });
                    }
                  },
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Caja de la Frase Activa
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF0F172A)
                  : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: currentFirmness == ScriptFirmness.firm
                    ? AppColors.coral.withValues(alpha: 0.5)
                    : (currentFirmness == ScriptFirmness.assertive
                        ? AppColors.primary.withValues(alpha: 0.5)
                        : (isDark
                            ? AppColors.darkBorder
                            : AppColors.lightBorder)),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.format_quote_rounded,
                        size: 20,
                        color: isDark
                            ? AppColors.accentLight
                            : AppColors.accent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        currentPhrase,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 1.4,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Acciones de Frase: TTS y Copiar
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        FeedbackService.lightClick();
                        final text =
                            '${script.title}. Situación: ${script.contextDescription}. Frase en nivel ${currentFirmness.label}: $currentPhrase. Lenguaje corporal recomendado: ${script.bodyLanguage}. Trampa o error a evitar: ${script.whatNotToDo}';
                        TtsService.speak(text,
                            gestureId: 'script_${script.id}');
                      },
                      icon: const Icon(Icons.volume_up_rounded, size: 16),
                      label: const Text('Escuchar',
                          style: TextStyle(fontSize: 11.5)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: isDark
                            ? AppColors.primary
                            : AppColors.primaryDark,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        FeedbackService.lightClick();
                        Clipboard.setData(ClipboardData(text: currentPhrase));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                const Icon(Icons.check_circle_rounded,
                                    color: Colors.white, size: 18),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text('Frase copiada al portapapeles'),
                                ),
                              ],
                            ),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy_rounded, size: 16),
                      label: const Text('Copiar',
                          style: TextStyle(fontSize: 11.5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Pauta de Lenguaje Corporal
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF132035)
                  : const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.25),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.accessibility_new_rounded,
                    size: 18, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Lenguaje Corporal Recomendado:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        script.bodyLanguage,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.35,
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
          const SizedBox(height: 8),

          // Trampa a Evitar (Qué NO debes hacer)
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF2D1F1A)
                  : const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.35),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_amber_rounded,
                    size: 18, color: AppColors.warning),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Qué NO debes hacer (Trampa común):',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.warning,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        script.whatNotToDo,
                        style: TextStyle(
                          fontSize: 12,
                          height: 1.35,
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
        ],
      ),
    );
  }
}
