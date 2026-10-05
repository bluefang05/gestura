import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../core/services/tts_service.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/badge_pill.dart';
import '../widgets/common/tts_app_bar_control.dart';

class ClusterBaselineScreen extends StatefulWidget {
  const ClusterBaselineScreen({super.key});

  @override
  State<ClusterBaselineScreen> createState() => _ClusterBaselineScreenState();
}

class _ClusterBaselineScreenState extends State<ClusterBaselineScreen> {
  int _selectedTab =
      0; // 0: Observar y preguntar, 1: Forma habitual, 2: Casos prácticos
  int? _selectedCaseAnswer;
  int _currentCaseIndex = 0;
  bool _showFeedback = false;

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  static const String _clustersTheorySpeech =
      'Un gesto no revela por sí solo lo que alguien piensa o siente. '
      'Cruzar los brazos, mirar hacia otro lado o tocarse el cuello puede tener muchas causas. '
      'Observa la situación completa, escucha las palabras y pregunta con respeto si necesitas saber algo.';

  static const String _baselineTheorySpeech =
      'Cada persona tiene su forma habitual de hablar, mirar y moverse. '
      'Si observas un cambio, puede servir para hacer una pregunta amable. '
      'El cambio no explica su causa ni demuestra que alguien mienta.';

  void _speakCurrentSection() {
    String textToSpeak = '';
    if (_selectedTab == 0) {
      textToSpeak =
          'Un gesto aislado no explica lo que alguien piensa. Describe lo que ves y escucha lo que dice. Si algo importa, pregunta en vez de adivinar. $_clustersTheorySpeech';
    } else if (_selectedTab == 1) {
      textToSpeak = _baselineTheorySpeech;
    } else {
      final item = _interactiveCases[_currentCaseIndex];
      final signals = (item['signals'] as List<String>).join('. ');
      final options = (item['options'] as List<String>)
          .asMap()
          .entries
          .map((e) => 'Opción ${e.key + 1}: ${e.value}')
          .join('. ');
      textToSpeak =
          'Práctica para observar varias señales. Caso ${_currentCaseIndex + 1} de ${_interactiveCases.length}. ${item['title']}. Contexto: ${item['context']}. Señales observadas: $signals. Pregunta: ${item['question']}. $options';
    }
    TtsService.speak(textToSpeak, gestureId: 'cluster_baseline_$_selectedTab');
  }

  final List<Map<String, dynamic>> _interactiveCases = [
    {
      'title': 'Caso 1: ¿Frío Ambiental o Rechazo?',
      'context':
          'Estás en una sala de reuniones con aire acondicionado a 18 °C presentando una idea.',
      'signals': [
        'Brazos fuertemente cruzados pegados al pecho',
        'Frotamiento rápido de manos sobre los bíceps',
        'Hombros encogidos hacia adentro y pies pegados al piso',
      ],
      'question':
          'Hace frío en la sala. ¿Qué explicación conviene considerar? ',
      'options': [
        'Rechazo total y desacuerdo con tu propuesta de trabajo.',
        'Puede tener frío. También podrías preguntarle si desea ajustar el aire.',
        'La persona es tímida y tiene miedo de hablar.',
      ],
      'correctOption': 1,
      'explanation':
          'El frío es una explicación posible en esa situación. Los brazos cruzados por sí solos no permiten saber qué piensa la persona.',
    },
    {
      'title': 'Caso 2: ¿Miente o así suele expresarse?',
      'context':
          'Entrevistas a un candidato técnico que desde que entró a la sala habla en tono muy bajo, pestañea rápido y mira al suelo al decir su nombre.',
      'signals': [
        'Mirada baja que evita el contacto directo continuo',
        'Pestañeo frecuente y voz suave',
        'Manos entrelazadas en el regazo',
      ],
      'question':
          'Al preguntarle sobre su experiencia previa, responde con esas mismas señales. ¿Está mintiendo?',
      'options': [
        'Sí, la falta de contacto visual es prueba definitiva de engaño.',
        'No se puede saber si miente por mirar al suelo o hablar bajito. Puede ser su forma habitual de expresarse.',
        'Significa que no tiene interés en el puesto.',
      ],
      'correctOption': 1,
      'explanation':
          'No puedes identificar una mentira por estos gestos. Observa qué dijo y comprueba los datos sin juzgar cómo se expresa.',
    },
    {
      'title': 'Caso 3: La Desviación en Plena Negociación',
      'context':
          'Tu cliente estuvo 15 minutos relajado, con brazos sobre la mesa y sonrisa abierta. En cuanto mencionas el precio:',
      'signals': [
        'Cruza los brazos de golpe y recuesta el torso hacia atrás',
        'Aprieta los labios formando una línea delgada y tensa',
        'Baja la cabeza y mira de reojo hacia la puerta',
      ],
      'question': '¿Qué puedes concluir de este cambio?',
      'options': [
        'Es solo casualidad, sigue presentando las siguientes 10 diapositivas.',
        'Varias señales cambiaron después de hablar del precio. No sabemos por qué; pregunta qué piensa antes de continuar.',
        'El cliente tiene frío y cansancio visual.',
      ],
      'correctOption': 1,
      'explanation':
          'Varias señales cambiaron después de hablar del precio. No demuestran rechazo. Haz una pausa y pregunta si quiere comentar algo o escuchar más.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestos y forma habitual de expresarse'),
        actions: [
          TtsAppBarControl(
            onPlay: _speakCurrentSection,
            activeTag: 'cluster_baseline_$_selectedTab',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                children: [
                  // Banner explicativo
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
                        Icon(Icons.hub_rounded,
                            size: 28,
                            color: isDark
                                ? AppColors.accentLight
                                : AppColors.accent),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Un gesto aislado no explica lo que alguien piensa. Describe lo que ves y escucha lo que dice. Si algo importa, pregunta en vez de adivinar.',
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

                  // Barra de navegación por pestañas
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildNavChip(
                            index: 0,
                            label: 'Observar y preguntar',
                            icon: Icons.filter_3_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 1,
                            label: 'Forma habitual de expresarse',
                            icon: Icons.timeline_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 2,
                            label: 'Entrenador de Casos',
                            icon: Icons.model_training_rounded,
                            isDark: isDark),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  if (_selectedTab == 0) _buildClustersContent(isDark),
                  if (_selectedTab == 1) _buildBaselineContent(isDark),
                  if (_selectedTab == 2) _buildCasesTrainerContent(isDark),

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

  // --- SECCIÓN 1: REGLA DE LAS 3 SEÑALES ---
  Widget _buildClustersContent(bool isDark) {
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
                  const Icon(Icons.rule_folder_rounded,
                      size: 22, color: AppColors.primary),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Un gesto por sí solo no basta',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'cluster_rule_3';
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
                            : 'Escuchar explicación completa',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(_clustersTheorySpeech,
                                gestureId: 'cluster_rule_3');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Cruzar los brazos, tocarse el cuello o mirar hacia otro lado no explica por sí solo lo que alguien piensa. Hay muchas razones posibles. Escucha las palabras y, si importa, pregunta.',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 16),

              // La pirámide de la certeza
              _buildFormulaStep(
                number: '1',
                title: 'Una señal: describe lo que ves',
                description:
                    'Puede deberse a picazón física, temperatura de la sala, cansancio o un hábito individual sin carga emocional.',
                color: AppColors.textMutedLight,
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildFormulaStep(
                number: '2',
                title: 'Varias señales: observa la situación',
                description:
                    'Por ejemplo: se toca el cuello y baja la voz. Aun así, no sabemos por qué. Puedes preguntar si necesita algo.',
                color: AppColors.warning,
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildFormulaStep(
                number: '3',
                title: 'Varias señales no confirman una intención',
                description:
                    'Por ejemplo, una persona puede tocarse el cuello y echarse hacia atrás. Eso describe lo que ves, pero no explica por qué. Considera el contexto y pregunta si necesitas saber más.',
                color: AppColors.success,
                isDark: isDark,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- SECCIÓN 2: LÍNEA BASE ---
  Widget _buildBaselineContent(bool isDark) {
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
                  const Icon(Icons.analytics_rounded,
                      size: 22, color: AppColors.indigo),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Cómo suele expresarse cada persona',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'baseline_2min';
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
                            : 'Escuchar técnica completa',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(_baselineTheorySpeech,
                                gestureId: 'baseline_2min');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'La forma habitual de hablar y moverse de cada persona es distinta. Observa cómo se expresa en situaciones parecidas; un cambio puede tener muchas causas y no prueba que mienta.',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Puedes fijarte en cosas sencillas:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              _buildBaselineChannel(
                icon: Icons.remove_red_eye_rounded,
                title: '1. Mirada y Pestañeo',
                description:
                    '¿Suele mirar a los ojos o a otros lugares? No necesita mirarte para escucharte.',
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildBaselineChannel(
                icon: Icons.record_voice_over_rounded,
                title: '2. Velocidad y Tono de Voz',
                description:
                    '¿Suele hablar rápido o despacio? ¿En voz alta o baja?',
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildBaselineChannel(
                icon: Icons.front_hand_rounded,
                title: '3. Gesticulación Manual',
                description:
                    '¿Mueve las manos cuando habla o las mantiene quietas?',
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildBaselineChannel(
                icon: Icons.airline_seat_recline_normal_rounded,
                title: '4. Postura de Reposo',
                description: '¿Cómo suele sentarse cuando está cómodo?',
                isDark: isDark,
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF064E3B).withValues(alpha: 0.3)
                      : AppColors.successContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? const Color(0xFF059669).withValues(alpha: 0.4)
                        : const Color(0xFFA7F3D0),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.verified_rounded,
                        size: 20, color: AppColors.success),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Una diferencia puede ser una razón para preguntar con amabilidad. No demuestra por sí sola cómo se siente la persona.',
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
      ],
    );
  }

  // --- SECCIÓN 3: ENTRENADOR DE CASOS ---
  Widget _buildCasesTrainerContent(bool isDark) {
    final item = _interactiveCases[_currentCaseIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BadgePill(
              text:
                  'Caso ${_currentCaseIndex + 1} de ${_interactiveCases.length}',
              color: AppColors.primary,
            ),
            const Spacer(),
            if (_currentCaseIndex < _interactiveCases.length - 1)
              TextButton.icon(
                icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                label: const Text('Siguiente Caso'),
                onPressed: () {
                  FeedbackService.lightClick();
                  setState(() {
                    _currentCaseIndex++;
                    _selectedCaseAnswer = null;
                    _showFeedback = false;
                  });
                },
              )
            else
              TextButton.icon(
                icon: const Icon(Icons.replay_rounded, size: 18),
                label: const Text('Reiniciar Casos'),
                onPressed: () {
                  FeedbackService.lightClick();
                  setState(() {
                    _currentCaseIndex = 0;
                    _selectedCaseAnswer = null;
                    _showFeedback = false;
                  });
                },
              ),
          ],
        ),
        const SizedBox(height: 10),
        AppCard(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item['title'] as String,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final id = 'case_${item['title']}';
                      final isSpeaking = speakingId == id;
                      return IconButton(
                        icon: Icon(
                          isSpeaking
                              ? Icons.stop_circle_rounded
                              : Icons.volume_up_rounded,
                          size: 20,
                          color: isSpeaking
                              ? AppColors.coral
                              : (isDark
                                  ? AppColors.accentLight
                                  : AppColors.accent),
                        ),
                        tooltip: isSpeaking
                            ? 'Detener lectura'
                            : 'Escuchar caso interactivo',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            final signals =
                                (item['signals'] as List<String>).join('. ');
                            final options = (item['options'] as List<String>)
                                .asMap()
                                .entries
                                .map((e) => 'Opción ${e.key + 1}: ${e.value}')
                                .join('. ');
                            final speech =
                                '${item['title']}. Contexto: ${item['context']}. Señales observadas: $signals. Pregunta: ${item['question']}. $options';
                            TtsService.speak(speech, gestureId: id);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                item['context'] as String,
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.4,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0F172A)
                      : const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Señales observadas:',
                      style: TextStyle(
                          fontSize: 12.5, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 6),
                    for (final sig in (item['signals'] as List<String>))
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.visibility_rounded,
                                size: 18, color: AppColors.accent),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                sig,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Text(
                item['question'] as String,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),

              // Opciones
              for (int i = 0; i < (item['options'] as List<String>).length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: _showFeedback
                        ? null
                        : () {
                            FeedbackService.lightClick();
                            final isCorrect = i == item['correctOption'];
                            setState(() {
                              _selectedCaseAnswer = i;
                              _showFeedback = true;
                            });
                            TtsService.speak(
                              '${isCorrect ? "¡Correcto!" : "Opción incorrecta."} ${item['explanation']}',
                              gestureId: 'case_fb_${item['title']}',
                            );
                          },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _selectedCaseAnswer == i
                            ? (i == item['correctOption']
                                ? (isDark
                                    ? const Color(0xFF064E3B)
                                    : AppColors.successContainer)
                                : (isDark
                                    ? const Color(0xFF7F1D1D)
                                    : const Color(0xFFFFE4E6)))
                            : (isDark
                                ? const Color(0xFF1E293B)
                                : const Color(0xFFF1F5F9)),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _selectedCaseAnswer == i
                              ? (i == item['correctOption']
                                  ? AppColors.success
                                  : AppColors.error)
                              : (isDark
                                  ? AppColors.darkBorder
                                  : AppColors.lightBorder),
                          width: _selectedCaseAnswer == i ? 1.8 : 1.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _selectedCaseAnswer == i
                                ? (i == item['correctOption']
                                    ? Icons.check_circle_rounded
                                    : Icons.cancel_rounded)
                                : Icons.radio_button_unchecked_rounded,
                            size: 18,
                            color: _selectedCaseAnswer == i
                                ? (i == item['correctOption']
                                    ? AppColors.success
                                    : AppColors.error)
                                : (isDark
                                    ? AppColors.textMutedDark
                                    : AppColors.textMutedLight),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              (item['options'] as List<String>)[i],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: _selectedCaseAnswer == i
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              if (_showFeedback) ...[
                const SizedBox(height: 12),
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
                      const Icon(Icons.lightbulb_rounded,
                          size: 18, color: AppColors.success),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['explanation'] as String,
                          style: TextStyle(
                            fontSize: 13,
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormulaStep({
    required String number,
    required String title,
    required String description,
    required Color color,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: color,
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

  Widget _buildBaselineChannel({
    required IconData icon,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon,
            size: 20, color: isDark ? AppColors.indigo : AppColors.indigo),
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
