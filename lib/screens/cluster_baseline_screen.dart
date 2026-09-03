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
  int _selectedTab = 0; // 0: Regla de los Clusters, 1: Línea Base, 2: Casos Prácticos
  int? _selectedCaseAnswer;
  int _currentCaseIndex = 0;
  bool _showFeedback = false;

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  void _speakCurrentSection() {
    String textToSpeak = '';
    if (_selectedTab == 0) {
      textToSpeak =
          'La regla de los conglomerados o clusters. Nunca juzgues un gesto aislado. Un solo gesto es una hipótesis suelta. Dos señales son motivo de atención. Tres señales concurrentes en la misma dirección confirman la actitud emocional de la persona.';
    } else if (_selectedTab == 1) {
      textToSpeak =
          'Cómo calibrar la línea base. Durante los primeros dos minutos de conversación relajada, observa el pestañeo natural, el tono de voz y el movimiento de manos habitual. Solo cuando la persona se desvíe de esa norma frente a una pregunta difícil, tendrás una señal válida.';
    } else {
      textToSpeak =
          'Entrenador interactivo de conglomerados. Evalúa si el conjunto de señales representa un estado emocional real o si es un falso positivo.';
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
      'question': '¿Qué indica este conglomerado de señales corporales?',
      'options': [
        'Rechazo total y desacuerdo con tu propuesta de trabajo.',
        'Frío ambiental físico. El frotamiento de brazos y encogimiento buscan calor corporal.',
        'La persona es tímida y tiene miedo de hablar.',
      ],
      'correctOption': 1,
      'explanation':
          '¡Correcto! Cruzar los brazos mientras se frotan los bíceps y se encoge el torso en una sala fría es un mecanismo puramente termorregulador. Asumir que está a la defensiva sería un error grave de lectura contextual.',
    },
    {
      'title': 'Caso 2: ¿Deshonestidad o su Línea Base?',
      'context':
          'Entrevistas a un candidato técnico que desde que entró a la sala habla en tono muy bajo, pestañea rápido y mira al suelo al decir su nombre.',
      'signals': [
        'Mirada baja que evita el contacto directo continuo',
        'Pestañeo frecuente y voz suave',
        'Manos entrelazadas en el regazo',
      ],
      'question':
          'Al preguntarle sobre su experiencia previa, responde con esas mismas señales. ¿Está mintiendo?',
      'options':
          [
        'Sí, la falta de contacto visual es prueba definitiva de engaño.',
        'No necesariamente. Esas señales son su Línea Base natural desde el minuto 1; indican timidez o introversión, no mentira.',
        'Significa que no tiene interés en el puesto.',
      ],
      'correctOption': 1,
      'explanation':
          '¡Exacto! La mentira o la incomodidad se detectan por DESVIACIONES de la línea base. Si la persona se comporta así desde que dijo "hola", ese es su estado basal neutro. Buscar mentiras sin conocer la línea base genera falsos juicios.',
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
      'question':
          '¿Cómo debes interpretar este cambio repentino de 3 señales?',
      'options': [
        'Es solo casualidad, sigue presentando las siguientes 10 diapositivas.',
        'Un Conglomerado Crítico de Resistencia: 3 señales de rechazo que se desvían de su línea base inmediatamente tras el estímulo del precio.',
        'El cliente tiene frío y cansancio visual.',
      ],
      'correctOption': 1,
      'explanation':
          '¡Brillante! Se cumple la regla de oro: estímulo directo (precio) ➔ desviación abrupta de la línea base ➔ 3 señales en la misma dirección (brazos + labios + torso atrás). Debes frenar la presentación de inmediato y explorar su preocupación.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conglomerados y Línea Base'),
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
                            'El principio maestro del análisis no verbal: nunca juzgues un gesto aislado. Aprende a buscar grupos de 3 señales y a medir la línea base.',
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
                            label: 'Regla de las 3 Señales',
                            icon: Icons.filter_3_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 1,
                            label: 'Calibrar la Línea Base',
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
                      'Por Qué un Gesto Aislado es una Trampa',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'El error más destructivo en la lectura no verbal es sacar conclusiones por un solo detalle: "tocó su nariz, seguro miente" o "cruzó los brazos, está cerrado". Las palabras son como palabras sueltas en una frase: una sola palabra no hace una oración completa.',
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
                title: '1 Señal Aislada = Una Hipótesis Suelta',
                description:
                    'Puede deberse a picazón física, temperatura de la sala, cansancio o un hábito individual sin carga emocional.',
                color: AppColors.textMutedLight,
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildFormulaStep(
                number: '2',
                title: '2 Señales Coincidentes = Motivo de Atención',
                description:
                    'Ejemplo: Toca su cuello y baja el volumen de su voz. Tu radar debe activarse, pero todavía no emitas un juicio definitivo.',
                color: AppColors.warning,
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildFormulaStep(
                number: '3',
                title: '3 o Más Señales en la Misma Dirección = CONGLOMERADO',
                description:
                    'Ejemplo: Cuello tocado + cuerpo reclinado hacia atrás + labios comprimidos en línea delgada. El conjunto confirma con alta certeza tensión y desacuerdo.',
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
                      'La Técnica de los Primeros 2 Minutos',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'La Línea Base es el comportamiento normal, relajado y habitual de una persona cuando no está bajo presión. Sin conocer la línea base, es imposible saber si un gesto es significativo o si la persona simplemente es así de forma natural.',
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
                'Los 4 Canales Basales a Calibrar:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),

              _buildBaselineChannel(
                icon: Icons.remove_red_eye_rounded,
                title: '1. Mirada y Pestañeo',
                description:
                    '¿Te mira fijamente o suele mirar a los lados mientras piensa? ¿Pestañea lento (15/min) o es naturalmente rápido (30/min)?',
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildBaselineChannel(
                icon: Icons.record_voice_over_rounded,
                title: '2. Velocidad y Tono de Voz',
                description:
                    '¿Habla a ritmo acelerado o pausado? ¿Su volumen habitual es alto o tímido y suave?',
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildBaselineChannel(
                icon: Icons.front_hand_rounded,
                title: '3. Gesticulación Manual',
                description:
                    '¿Mueve mucho las manos al hablar (expresivo) o las mantiene quietas sobre la mesa?',
                isDark: isDark,
              ),
              const SizedBox(height: 10),
              _buildBaselineChannel(
                icon: Icons.airline_seat_recline_normal_rounded,
                title: '4. Postura de Reposo',
                description:
                    '¿Se sienta encorvado por costumbre anatómica o mantiene la espalda recta en su postura base?',
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
                        'Regla de Oro: Solo cuando una persona cambia súbitamente su comportamiento basal justo después de una pregunta o propuesta, tienes una señal con verdadero significado.',
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
              text: 'Caso ${_currentCaseIndex + 1} de ${_interactiveCases.length}',
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
              Text(
                item['title'] as String,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w800),
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
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
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
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w800),
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
                            setState(() {
                              _selectedCaseAnswer = i;
                              _showFeedback = true;
                            });
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
            size: 20,
            color: isDark ? AppColors.indigo : AppColors.indigo),
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
