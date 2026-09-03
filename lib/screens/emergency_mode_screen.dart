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
  int _selectedTab = 0; // 0: Entrevista/Ventas, 1: Social/Fiesta, 2: Bloqueo Mental, 3: Sobrecarga Sensorial

  final Set<String> _checkedItems = {};

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  void _speakCurrentSection() {
    String textToSpeak = '';
    if (_selectedTab == 0) {
      textToSpeak =
          'Protocolo antes de entrar a una entrevista o negociación. Hombros abajo y columna erguida. Manos visibles fuera de los bolsillos. Contacto visual inicial de dos segundos con sonrisa tranquila. Pies planos sobre el suelo.';
    } else if (_selectedTab == 1) {
      textToSpeak =
          'Protocolo al entrar a un evento social. Busca grupos en formación de herradura abierta. Mantén una distancia de metro y medio. No te escondas en el teléfono móvil. Sostén una bebida a la altura de la cintura.';
    } else if (_selectedTab == 2) {
      textToSpeak =
          'Salvavidas si te quedas en blanco. Haz una pausa de poder respirando hondo. Aplica el rebote con una pregunta abierta. O parafrasea las últimas palabras de la otra persona con tono reflexivo.';
    } else {
      textToSpeak =
          'Salida digna por sobrecarga sensorial. Para una pausa breve di: voy por un vaso de agua, con permiso. Para retirarte di: tuve un día largo y me retiro para descansar, que disfruten mucho la velada.';
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  if (_selectedTab == 0) _buildWorkChecklist(isDark),
                  if (_selectedTab == 1) _buildSocialChecklist(isDark),
                  if (_selectedTab == 2) _buildBlankMindRescue(isDark),
                  if (_selectedTab == 3) _buildSensoryEscape(isDark),

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
        const Text(
          '3 Técnicas de Rescate si te Quedas en Blanco',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
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
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                    ),
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
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      decoration:
                          isChecked ? TextDecoration.lineThrough : null,
                    ),
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
          Text(
            title,
            style: const TextStyle(
                fontSize: 14.5, fontWeight: FontWeight.w800),
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
}
