import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/common/tts_app_bar_control.dart';

import '../core/services/tts_service.dart';

class UnwrittenRulesScreen extends StatefulWidget {
  const UnwrittenRulesScreen({super.key});

  @override
  State<UnwrittenRulesScreen> createState() => _UnwrittenRulesScreenState();
}

class _UnwrittenRulesScreenState extends State<UnwrittenRulesScreen> {
  int _selectedTab = 0; // 0: Small Talk, 1: Indirectas, 2: Risa, 3: Sarcasmo

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  void _speakCurrentSection() {
    String textToSpeak = '';
    if (_selectedTab == 0) {
      textToSpeak =
          'El Mito del Small Talk. El Small Talk es un ping de red no verbal. No importa el clima: es un apretón de manos sónico que comunica que el canal está en paz. Regla uno: responde en menos de 30 segundos. Regla dos: haz preguntas abiertas de baja presión. Regla tres: cierra la charla en un minuto.';
    } else if (_selectedTab == 1) {
      textToSpeak =
          'Decodificador de indirectas cotidianas. Primera: no te preocupes yo me encargo, significa que están abrumados y esperan que insistas en ayudar. Segunda: haz lo que te parezca mejor, significa que tienen una preferencia clara y prefieren que preguntes. Tercera: a ver si nos vemos pronto para un café, suele ser cortesía de despedida.';
    } else if (_selectedTab == 2) {
      textToSpeak =
          'La risa incómoda versus la risa genuina. En el mundo neurotípico, la risa no siempre es felicidad; se usa con frecuencia como pacificación para desactivar momentos tensos.';
    } else {
      textToSpeak =
          'Sarcasmo con cara de póker. La voz manda, la cara engaña. El sarcasmo se detecta por alargamiento de vocales, monotonía exagerada o una pausa asimétrica.';
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Contenido dinámico según pestaña
                  if (_selectedTab == 0) _buildSmallTalkContent(isDark),
                  if (_selectedTab == 1) _buildIndirectsContent(isDark, isTablet),
                  if (_selectedTab == 2) _buildNervousLaughContent(isDark),
                  if (_selectedTab == 3) _buildPokerSarcasmContent(isDark),

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
            : (isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight),
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
                      color: isDark ? AppColors.primaryLight : AppColors.primary),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      '¿Por qué existe el "Small Talk"?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
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
                    Icon(Icons.g_translate_rounded,
                        size: 18,
                        color: isDark
                            ? AppColors.textMutedDark
                            : AppColors.textMutedLight),
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
                const SizedBox(height: 10),
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
                              text: 'Lo que realmente significa: ',
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
                        color: isDark
                            ? AppColors.accentLight
                            : AppColors.accent),
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
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
            size: 20,
            color: isDark ? AppColors.accentLight : AppColors.accent),
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
}
