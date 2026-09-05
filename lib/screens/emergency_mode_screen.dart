import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../core/services/tts_service.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/tts_app_bar_control.dart';

class EmergencyModeScreen extends StatefulWidget {
  const EmergencyModeScreen({super.key});

  @override
  State<EmergencyModeScreen> createState() => _EmergencyModeScreenState();
}

class _EmergencyModeScreenState extends State<EmergencyModeScreen> {
  int _selectedTab =
      0; // 0: Entrevista/Ventas, 1: Social/Fiesta, 2: Bloqueo Mental, 3: Sobrecarga Sensorial

  final Set<String> _checkedItems = {};

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  static const String _workChecklistSpeech =
      'Checklist de 30 Segundos: Antes de Entrar por la Puerta. '
      'Paso 1: Reseteo Físico y Diafragma. Inhala hondo por la nariz en 4 segundos y suelta en 6. Baja conscientemente los hombros que suelen estar tensos cerca de las orejas. '
      'Paso 2: Manos a la Vista, generador de confianza. Saca las manos de los bolsillos del pantalón o abrigo. El cerebro humano primitivo desconfía de las manos ocultas. '
      'Paso 3: La Regla de los 2 Segundos de Saludo. Al estrechar la mano o saludar, mantén la mirada fija en sus ojos durante exactamente 2 segundos acompañado de una leve sonrisa cálida. '
      'Paso 4: Postura de Asiento Estable. Apoya la espalda en el respaldo y ambos pies planos en el suelo. Evita sentarte en la orilla de la silla, pues comunica deseo de huir.';

  static const String _socialChecklistSpeech =
      'Checklist de Entrada a una Reunión o Evento Social. '
      'Paso 1: Escanear Círculos en U Abierta. Busca grupos donde los cuerpos formen un ángulo abierto hacia el salón. Nunca intentes entrar a un círculo cerrado en O, hombro con hombro. '
      'Paso 2: No Usar el Teléfono como Escudo Defensivo. Mirar el smartphone continuamente comunica que no quieres que nadie te hable. Si tienes ansiedad en las manos, toma un vaso de agua o servilleta. '
      'Paso 3: Vaso a la Altura de la Cintura. Sostén tu vaso o copa a la altura del ombligo, no pegado al pecho o al cuello como una barrera torácica defensiva. '
      'Paso 4: Frase de Entrada de Baja Fricción. Aproxímate con una sonrisa cordial a metro y medio diciendo: Hola, con permiso, me pareció muy interesante lo que decían sobre...';

  static const String _blankMindSpeech =
      '3 Técnicas de Rescate si te Quedas en Blanco. '
      'Técnica 1: La Pausa de Poder, Silence Framing. Si olvidas lo que ibas a decir, no digas ehhh ni te disculpes con pánico. Respira hondo, asiente con la cabeza y mantén la calma durante 2 segundos. La contraparte pensará que estás meditando una respuesta sabia y reflexiva. '
      'Técnica 2: El Rebote de Pregunta Abierta. Si el flujo conversacional muere, devuelve el protagonismo a la otra persona: Oye, y en tu caso, ¿cómo sueles manejar tú ese tipo de situaciones? A la inmensa mayoría de las personas les encanta hablar de sus propias experiencias. '
      'Técnica 3: El Espejo de las Últimas 3 Palabras. Toma las últimas 2 o 3 palabras que dijo la otra persona y repítelas en tono reflexivo o de suave pregunta. Esto hace que la otra persona amplíe la información automáticamente mientras tú recuperas el hilo.';

  static const String _sensoryEscapeSpeech =
      'Fórmulas de Salida Digna por Sobrecarga o Fatiga Social. No necesitas dar explicaciones íntimas ni pedir disculpas excesivas para cuidar tu batería social. '
      'Pausa Táctica de 5 Minutos para Recomponerte. Frase: "Disculpen un momento, voy por un vaso de agua y a tomar un poco de aire fresco afuera, con permiso". Por qué funciona: Es una necesidad biológica universal que nadie cuestionará; te da tiempo para ir a regularte en silencio. '
      'Retirada Definitiva de una Fiesta o Reunión. Frase: "Amigos, fue un placer enorme saludarlos. Tuve una semana bastante pesada y me retiro a descansar para arrancar temprano mañana. ¡Que sigan disfrutando mucho!". Por qué funciona: Enmarca la salida en tu descanso productivo, agradece el encuentro y se marcha sin dar lugar a insistencias pesadas. '
      'Límite en la Oficina por Sobrecarga Sensorial. Frase: "Me pongo auriculares un par de horas porque necesito máxima concentración para cerrar una entrega urgente. Cualquier cosa urgente me dejan un mensaje por chat". Por qué funciona: Legitima el aislamiento acústico como productividad profesional, no como desdén social.';

  static const String _neurobiologySpeech =
      'Neurobiología del Secuestro Emocional y Bloqueo. Comprender la base fisiológica elimina la culpa: quedarse en blanco no es torpeza personal ni falta de voluntad, sino una respuesta biológica de protección. '
      'Punto 1: El Atajo Tálamo-Amígdala de 12 milisegundos. El neurocientífico Joseph LeDoux descubrió que la señal sensorial viaja del tálamo a la amígdala en aproximadamente 12 milisegundos, mientras que a la corteza pensante le toma el doble de tiempo o más. En situaciones de sobrecarga o tensión, tu sistema de alarma cerebral reacciona y dispara una respuesta neuroquímica antes de que tu mente consciente haya evaluado la situación. Pauta neuroafirmativa: El sobresalto es un reflejo biológico no consciente; no intentes reprimirlo con autoexigencia. '
      'Punto 2: El Secuestro de la Memoria de Trabajo. Cuando la amígdala detecta alarma o saturación sensorial, libera catecolaminas, adrenalina y noradrenalina, que desvían el flujo cerebral. Esto inhibe temporalmente la corteza prefrontal, el área encargada de la memoria de trabajo, la flexibilidad cognitiva y la selección de palabras. Quedarse en blanco es una consecuencia electroquímica directa: tu cerebro prioriza la protección y no la retórica social. '
      'Punto 3: La Regla de los 20 Minutos de Dolf Zillmann. Las investigaciones fisiológicas demuestran que el cuerpo humano necesita entre 15 y 20 minutos de enfriamiento somático para metabolizar la adrenalina y permitir que el ritmo cardíaco vuelva a niveles basales. Intentar resolver un conflicto social o forzarte a hablar durante esos minutos es biológicamente ineficaz. La prioridad es el enfriamiento somático.';

  void _speakCurrentSection() {
    String textToSpeak = '';
    if (_selectedTab == 0) {
      textToSpeak = _workChecklistSpeech;
    } else if (_selectedTab == 1) {
      textToSpeak = _socialChecklistSpeech;
    } else if (_selectedTab == 2) {
      textToSpeak = _blankMindSpeech;
    } else if (_selectedTab == 3) {
      textToSpeak = _sensoryEscapeSpeech;
    } else {
      textToSpeak = _neurobiologySpeech;
    }
    TtsService.speak(textToSpeak, gestureId: 'emergency_mode_$_selectedTab');
  }

  void _toggleCheck(String key) {
    FeedbackService.lightClick();
    setState(() {
      if (_checkedItems.contains(key)) {
        _checkedItems.remove(key);
      } else {
        _checkedItems.add(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Modo Emergencia / Campo'),
        actions: [
          TtsAppBarControl(
            onPlay: _speakCurrentSection,
            activeTag: 'emergency_mode_$_selectedTab',
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
                  // Banner destacado estilo alerta tranquila
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
                        const Icon(Icons.flash_on_rounded,
                            size: 28, color: AppColors.coral),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Protocolos de campo en 30 segundos para antes de entrar a reuniones, eventos sociales o situaciones de sobrecarga.',
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

                  // Barra de navegación de protocolos
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildNavChip(
                            index: 0,
                            label: 'Entrevista / Ventas',
                            icon: Icons.work_outline_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 1,
                            label: 'Evento Social / Fiesta',
                            icon: Icons.celebration_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 2,
                            label: 'Si te Quedas en Blanco',
                            icon: Icons.psychology_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 3,
                            label: 'Escape por Sobrecarga',
                            icon: Icons.logout_rounded,
                            isDark: isDark),
                        const SizedBox(width: 8),
                        _buildNavChip(
                            index: 4,
                            label: 'Neurobiología del Bloqueo',
                            icon: Icons.biotech_rounded,
                            isDark: isDark),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  if (_selectedTab == 0) _buildWorkChecklist(isDark),
                  if (_selectedTab == 1) _buildSocialChecklist(isDark),
                  if (_selectedTab == 2) _buildBlankMindRescue(isDark),
                  if (_selectedTab == 3) _buildSensoryEscape(isDark),
                  if (_selectedTab == 4) _buildNeurobiologySection(isDark),

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

  // --- SECCIÓN 1: ENTREVISTA / VENTAS ---
  Widget _buildWorkChecklist(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Checklist de 30 Segundos: Antes de Entrar por la Puerta',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        _buildCheckItem(
          id: 'work_1',
          title: 'Reseteo Físico y Diafragma',
          description:
              'Inhala hondo por la nariz en 4 segundos y suelta en 6. Baja conscientemente los hombros que suelen estar tensos cerca de las orejas.',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildCheckItem(
          id: 'work_2',
          title: 'Manos a la Vista (Generador de Confianza)',
          description:
              'Saca las manos de los bolsillos del pantalón o abrigo. El cerebro humano primitivo desconfía de las manos ocultas.',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildCheckItem(
          id: 'work_3',
          title: 'La Regla de los 2 Segundos de Saludo',
          description:
              'Al estrechar la mano o saludar, mantén la mirada fija en sus ojos durante exactamente 2 segundos acompañado de una leve sonrisa cálida.',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildCheckItem(
          id: 'work_4',
          title: 'Postura de Asiento Estable',
          description:
              'Apoya la espalda en el respaldo y ambos pies planos en el suelo. Evita sentarte en la orilla de la silla, pues comunica deseo de huir.',
          isDark: isDark,
        ),
      ],
    );
  }

  // --- SECCIÓN 2: EVENTO SOCIAL ---
  Widget _buildSocialChecklist(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Checklist de Entrada a una Reunión o Evento Social',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        _buildCheckItem(
          id: 'soc_1',
          title: 'Escanear Círculos en "U" Abierta',
          description:
              'Busca grupos donde los cuerpos formen un ángulo abierto hacia el salón. Nunca intentes entrar a un círculo cerrado en "O" (hombro con hombro).',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildCheckItem(
          id: 'soc_2',
          title: 'No Usar el Teléfono como Escudo Defensivo',
          description:
              'Mirar el smartphone continuamente comunica "no quiero que nadie me hable". Si tienes ansiedad en las manos, toma un vaso de agua o servilleta.',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildCheckItem(
          id: 'soc_3',
          title: 'Vaso a la Altura de la Cintura',
          description:
              'Sostén tu vaso o copa a la altura del ombligo, no pegado al pecho o al cuello como una barrera torácica defensiva.',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildCheckItem(
          id: 'soc_4',
          title: 'Frase de Entrada de Baja Fricción',
          description:
              'Aproxímate con una sonrisa cordial a 1.5 metros: "Hola, con permiso, me pareció muy interesante lo que decían sobre...".',
          isDark: isDark,
        ),
      ],
    );
  }

  // --- SECCIÓN 3: SI TE QUEDAS EN BLANCO ---
  Widget _buildBlankMindRescue(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                '3 Técnicas de Rescate si te Quedas en Blanco',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
            ValueListenableBuilder<String?>(
              valueListenable: TtsService.currentSpeakingIdNotifier,
              builder: (context, speakingId, _) {
                final isSpeaking = speakingId == 'rescue_all';
                return IconButton(
                  icon: Icon(
                    isSpeaking
                        ? Icons.stop_circle_rounded
                        : Icons.volume_up_rounded,
                    size: 22,
                    color: isSpeaking
                        ? AppColors.coral
                        : (isDark ? AppColors.accentLight : AppColors.accent),
                  ),
                  tooltip:
                      isSpeaking ? 'Detener lectura' : 'Escuchar las 3 técnicas',
                  onPressed: () {
                    FeedbackService.lightClick();
                    if (isSpeaking) {
                      TtsService.stop();
                    } else {
                      TtsService.speak(_blankMindSpeech,
                          gestureId: 'rescue_all');
                    }
                  },
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.pause_circle_rounded,
                      size: 22, color: AppColors.primary),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      '1. La Pausa de Poder (Silence Framing)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'rescue_1';
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
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 28, minHeight: 28),
                        tooltip: isSpeaking ? 'Detener lectura' : 'Escuchar técnica',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(
                                'La Pausa de Poder. Silence Framing. Si olvidas lo que ibas a decir, no digas ehhh ni te disculpes con pánico. Respira hondo, asiente con la cabeza y mantén la calma durante 2 segundos. La contraparte pensará que estás meditando una respuesta sabia y reflexiva.',
                                gestureId: 'rescue_1');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Si olvidas lo que ibas a decir, NO digas "ehhh..." ni te disculpes con pánico. Respira hondo, asiente con la cabeza y mantén la calma durante 2 segundos. La contraparte pensará que estás meditando una respuesta sabia y reflexiva.',
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
        const SizedBox(height: 12),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.cached_rounded,
                      size: 22, color: AppColors.success),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      '2. El Rebote de Pregunta Abierta',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'rescue_2';
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
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 28, minHeight: 28),
                        tooltip: isSpeaking ? 'Detener lectura' : 'Escuchar técnica',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(
                                'El Rebote de Pregunta Abierta. Si el flujo conversacional muere, devuelve el protagonismo a la otra persona: "Oye, y en tu caso, ¿cómo sueles manejar tú ese tipo de situaciones?". A la inmensa mayoría de las personas les encanta hablar de sus propias experiencias.',
                                gestureId: 'rescue_2');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Si el flujo conversacional muere, devuelve el protagonismo a la otra persona: "Oye, y en tu caso, ¿cómo sueles manejar tú ese tipo de situaciones?". A la inmensa mayoría de las personas les encanta hablar de sus propias experiencias.',
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
        const SizedBox(height: 12),
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.repeat_rounded,
                      size: 22, color: AppColors.indigo),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      '3. El Espejo de las Últimas 3 Palabras',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'rescue_3';
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
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 28, minHeight: 28),
                        tooltip: isSpeaking ? 'Detener lectura' : 'Escuchar técnica',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(
                                'El Espejo de las Últimas 3 Palabras. Toma las últimas 2 o 3 palabras que dijo la otra persona y repítelas en tono reflexivo o de suave pregunta. Esto hace que la otra persona amplíe la información automáticamente mientras tú recuperas el hilo.',
                                gestureId: 'rescue_3');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Toma las últimas 2 o 3 palabras que dijo la otra persona y repítelas en tono reflexivo o de suave pregunta. Ejemplo: "¿...con los proveedores?". Esto hace que la otra persona amplíe la información automáticamente mientras tú recuperas el hilo.',
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

  // --- SECCIÓN 4: ESCAPE POR SOBRECARGA ---
  Widget _buildSensoryEscape(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fórmulas de Salida Digna por Sobrecarga o Fatiga Social',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        Text(
          'No necesitas dar explicaciones íntimas ni pedir disculpas excesivas para cuidar tu batería social.',
          style: TextStyle(
            fontSize: 13,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 14),
        _buildEscapeScript(
          title: 'Pausa Táctica de 5 Minutos (Para Recomponerte)',
          script:
              '“Disculpen un momento, voy por un vaso de agua y a tomar un poco de aire fresco afuera, con permiso”.',
          whyItWorks:
              'Es una necesidad biológica universal que nadie cuestionará. Te da tiempo para ir al baño o a un lugar silencioso a regularte.',
          isDark: isDark,
        ),
        const SizedBox(height: 12),
        _buildEscapeScript(
          title: 'Retirada Definitiva de una Fiesta o Reunión',
          script:
              '“Amigos, fue un placer enorme saludarlos. Tuve una semana bastante pesada y me retiro a descansar para arrancar temprano mañana. ¡Que sigan disfrutando mucho!”.',
          whyItWorks:
              'Enmarca la salida en tu descanso productivo, agradece el encuentro y se marcha sin dar lugar a insistencias pesadas.',
          isDark: isDark,
        ),
        const SizedBox(height: 12),
        _buildEscapeScript(
          title: 'Límite en la Oficina por Sobrecarga Sensorial',
          script:
              '“Me pongo auriculares un par de horas porque necesito máxima concentración para cerrar una entrega urgente. Cualquier cosa urgente me dejan un mensaje por Slack/Teams”.',
          whyItWorks:
              'Legitima el aislamiento acústico como un compromiso de productividad profesional, no como desdén social.',
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildCheckItem({
    required String id,
    required String title,
    required String description,
    required bool isDark,
  }) {
    final isChecked = _checkedItems.contains(id);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => _toggleCheck(id),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isChecked
              ? (isDark
                  ? const Color(0xFF064E3B).withValues(alpha: 0.3)
                  : AppColors.successContainer)
              : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC)),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isChecked
                ? AppColors.success
                : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
            width: isChecked ? 1.6 : 1.0,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isChecked
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              size: 22,
              color: isChecked
                  ? AppColors.success
                  : (isDark
                      ? AppColors.textMutedDark
                      : AppColors.textMutedLight),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            decoration:
                                isChecked ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                      ValueListenableBuilder<String?>(
                        valueListenable: TtsService.currentSpeakingIdNotifier,
                        builder: (context, speakingId, _) {
                          final isSpeaking = speakingId == 'check_$id';
                          return IconButton(
                            icon: Icon(
                              isSpeaking
                                  ? Icons.stop_circle_rounded
                                  : Icons.volume_up_rounded,
                              size: 18,
                              color: isSpeaking
                                  ? AppColors.coral
                                  : (isDark
                                      ? AppColors.accentLight
                                      : AppColors.accent),
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(
                                minWidth: 28, minHeight: 28),
                            tooltip:
                                isSpeaking ? 'Detener lectura' : 'Escuchar pauta',
                            onPressed: () {
                              FeedbackService.lightClick();
                              if (isSpeaking) {
                                TtsService.stop();
                              } else {
                                TtsService.speak('$title. $description',
                                    gestureId: 'check_$id');
                              }
                            },
                          );
                        },
                      ),
                    ],
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
      ),
    );
  }

  Widget _buildEscapeScript({
    required String title,
    required String script,
    required String whyItWorks,
    required bool isDark,
  }) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14.5, fontWeight: FontWeight.w800),
                ),
              ),
              ValueListenableBuilder<String?>(
                valueListenable: TtsService.currentSpeakingIdNotifier,
                builder: (context, speakingId, _) {
                  final id = 'escape_${title.hashCode}';
                  final isSpeaking = speakingId == id;
                  return IconButton(
                    icon: Icon(
                      isSpeaking
                          ? Icons.stop_circle_rounded
                          : Icons.volume_up_rounded,
                      size: 20,
                      color: isSpeaking
                          ? AppColors.coral
                          : (isDark ? AppColors.accentLight : AppColors.accent),
                    ),
                    padding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 28, minHeight: 28),
                    tooltip: isSpeaking ? 'Detener lectura' : 'Escuchar guion',
                    onPressed: () {
                      FeedbackService.lightClick();
                      if (isSpeaking) {
                        TtsService.stop();
                      } else {
                        TtsService.speak(
                            '$title. Frase de salida: "$script". Por qué funciona: $whyItWorks',
                            gestureId: id);
                      }
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF0F172A)
                  : const Color(0xFFE2E8F0).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.format_quote_rounded,
                    size: 20, color: AppColors.accent),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    script,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Por qué funciona: $whyItWorks',
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
    );
  }

  // --- SECCIÓN 5: NEUROBIOLOGÍA DEL BLOQUEO (GOLEMAN / LEDOUX) ---
  Widget _buildNeurobiologySection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Neurobiología del Secuestro Emocional y Bloqueo',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ),
            ValueListenableBuilder<String?>(
              valueListenable: TtsService.currentSpeakingIdNotifier,
              builder: (context, speakingId, _) {
                final isSpeaking = speakingId == 'neuro_all';
                return IconButton(
                  icon: Icon(
                    isSpeaking
                        ? Icons.stop_circle_rounded
                        : Icons.volume_up_rounded,
                    size: 22,
                    color: isSpeaking
                        ? AppColors.coral
                        : (isDark ? AppColors.accentLight : AppColors.accent),
                  ),
                  tooltip:
                      isSpeaking ? 'Detener lectura' : 'Escuchar explicación completa',
                  onPressed: () {
                    FeedbackService.lightClick();
                    if (isSpeaking) {
                      TtsService.stop();
                    } else {
                      TtsService.speak(_neurobiologySpeech,
                          gestureId: 'neuro_all');
                    }
                  },
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          'Comprender la base fisiológica elimina la culpa: quedarse en blanco no es torpeza personal ni falta de voluntad, sino una respuesta biológica de protección.',
          style: TextStyle(
            fontSize: 13,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 14),

        // Tarjeta 1: Atajo Tálamo-Amígdala
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.coral.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.flash_on_rounded,
                        size: 22, color: AppColors.coral),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      '1. El Atajo Tálamo-Amígdala (12 ms)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'neuro_1';
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
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 28, minHeight: 28),
                        tooltip: isSpeaking ? 'Detener lectura' : 'Escuchar punto 1',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(
                                'El Atajo Tálamo-Amígdala de 12 milisegundos. El neurocientífico Joseph LeDoux descubrió que la señal sensorial viaja del tálamo a la amígdala en aproximadamente 12 milisegundos, mientras que a la corteza pensante le toma el doble de tiempo o más. En situaciones de sobrecarga o tensión, tu sistema de alarma cerebral reacciona y dispara una respuesta neuroquímica antes de que tu mente consciente haya tenido tiempo de evaluar la situación. Pauta neuroafirmativa: El sobresalto o aceleración inicial es un reflejo biológico no consciente; no intentes reprimirlo con autoexigencia.',
                                gestureId: 'neuro_1');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'El neurocientífico Joseph LeDoux descubrió que la señal sensorial viaja del tálamo a la amígdala en aproximadamente 12 milisegundos, mientras que a la corteza pensante le toma el doble de tiempo o más. En situaciones de sobrecarga o tensión, tu sistema de alarma cerebral reacciona y dispara una respuesta neuroquímica antes de que tu mente consciente haya tenido tiempo de evaluar la situación.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.4,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0F172A)
                      : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.verified_user_rounded,
                        size: 18, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Pauta neuroafirmativa: El sobresalto o aceleración inicial es un reflejo biológico no consciente. No intentes reprimirlo con autoexigencia.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
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
        const SizedBox(height: 12),

        // Tarjeta 2: Secuestro de la Memoria de Trabajo
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.indigo.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.psychology_rounded,
                        size: 22, color: AppColors.indigo),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      '2. El Secuestro de la Memoria de Trabajo',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'neuro_2';
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
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 28, minHeight: 28),
                        tooltip: isSpeaking ? 'Detener lectura' : 'Escuchar punto 2',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(
                                'El Secuestro de la Memoria de Trabajo. Cuando la amígdala detecta alarma o saturación sensorial, libera catecolaminas, adrenalina y noradrenalina, que desvían el flujo cerebral. Esto inhibe temporalmente la corteza prefrontal, el área encargada de la memoria de trabajo, la flexibilidad cognitiva y la selección de palabras. Quedarse en blanco es una consecuencia electroquímica directa: tu cerebro está priorizando la protección y no la retórica social.',
                                gestureId: 'neuro_2');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Cuando la amígdala detecta alarma o saturación sensorial, libera catecolaminas (adrenalina y noradrenalina) que desvían el flujo cerebral. Esto inhibe temporalmente la corteza prefrontal, el área encargada de la memoria de trabajo, la flexibilidad cognitiva y la selección de palabras. Quedarse en blanco es una consecuencia electroquímica directa: tu cerebro está priorizando la protección y no la retórica social.',
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
        const SizedBox(height: 12),

        // Tarjeta 3: Ventana de Enfriamiento de 20 Minutos
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.timer_outlined,
                        size: 22, color: AppColors.warning),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      '3. La Regla de los 20 Minutos (Dolf Zillmann)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: TtsService.currentSpeakingIdNotifier,
                    builder: (context, speakingId, _) {
                      final isSpeaking = speakingId == 'neuro_3';
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
                        padding: EdgeInsets.zero,
                        constraints:
                            const BoxConstraints(minWidth: 28, minHeight: 28),
                        tooltip: isSpeaking ? 'Detener lectura' : 'Escuchar punto 3',
                        onPressed: () {
                          FeedbackService.lightClick();
                          if (isSpeaking) {
                            TtsService.stop();
                          } else {
                            TtsService.speak(
                                'La Regla de los 20 Minutos de Dolf Zillmann. Las investigaciones fisiológicas demuestran que el cuerpo humano necesita entre 15 y 20 minutos de enfriamiento somático para metabolizar la adrenalina y permitir que el ritmo cardíaco vuelva a niveles basales. Intentar resolver un conflicto social o forzarte a hablar durante esos minutos es biológicamente ineficaz. La prioridad es el enfriamiento somático.',
                                gestureId: 'neuro_3');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Las investigaciones fisiológicas demuestran que el cuerpo humano necesita entre 15 y 20 minutos de enfriamiento somático para metabolizar la adrenalina y permitir que el ritmo cardíaco vuelva a niveles basales. Intentar resolver un conflicto social o forzarte a hablar durante esos minutos es biológicamente ineficaz.',
                style: TextStyle(
                  fontSize: 13,
                  height: 1.4,
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0F172A)
                      : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.shield_outlined,
                        size: 18, color: AppColors.warning),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Estrategia: En lugar de perseverar en la conversación, retírate 20 minutos con una excusa funcional ("necesito ir al baño / tomar aire fresco").',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
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
        const SizedBox(height: 12),

        // Tarjeta 4: Protocolo Semáforo / SOCS
        AppCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.emerald.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.traffic_rounded,
                        size: 22, color: AppColors.emerald),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      '4. Protocolo SOCS / Semáforo de Regulación',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Luz Roja
              _buildTrafficStep(
                color: AppColors.coral,
                step: 'ROJO: Alto Somático (Stop)',
                detail:
                    'Monitorea pulso y mandíbula. Si hay tensión alta o bloqueo, detén la interacción y pide tiempo fuera.',
                isDark: isDark,
              ),
              const SizedBox(height: 10),

              // Luz Amarilla
              _buildTrafficStep(
                color: AppColors.warning,
                step: 'AMARILLO: Contextualizar y Alternativas (Think)',
                detail:
                    'Desactiva la lectura mental de hostilidad. Plantea 2 hipótesis alternativas objetivas antes de juzgar la intención de la otra persona.',
                isDark: isDark,
              ),
              const SizedBox(height: 10),

              // Luz Verde
              _buildTrafficStep(
                color: AppColors.success,
                step: 'VERDE: Acción Calibrada (Go)',
                detail:
                    'Con pulso sereno, comunica tu posición de forma asertiva, breve y sin necesidad de sobreexplicarte.',
                isDark: isDark,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrafficStep({
    required Color color,
    required String step,
    required String detail,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 14,
          height: 14,
          margin: const EdgeInsets.only(top: 3, right: 10),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                detail,
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

