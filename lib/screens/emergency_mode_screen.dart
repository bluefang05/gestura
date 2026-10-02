import 'package:flutter/material.dart';
import '../core/services/tts_service.dart';
import 'communication_board_screen.dart';

/// Optional steps, with the same text used on screen and for narration.
class EmergencyModeScreen extends StatefulWidget {
  const EmergencyModeScreen({super.key});

  @override
  State<EmergencyModeScreen> createState() => _EmergencyModeScreenState();
}

class _EmergencyModeScreenState extends State<EmergencyModeScreen> {
  int _selectedTab = 0;
  final Set<String> _checkedItems = {};

  static const _sections = <({
    String label,
    String title,
    String phrase,
    List<({String title, String body})> steps,
  })>[
    (
      label: 'Trabajo',
      title: 'Antes de una reunión o entrevista',
      phrase: '¿Puedes enviarme los puntos principales por escrito?',
      steps: [
        (
          title: 'Revisa lo esencial',
          body:
              'Ten a mano la hora, el lugar y lo que quieres preguntar. Puedes usar notas durante la conversación.',
        ),
        (
          title: 'Busca una postura cómoda',
          body:
              'Puedes cambiar de postura o mirar tus notas. No necesitas mantener la mirada fija ni sonreír para demostrar atención.',
        ),
        (
          title: 'Aclara el siguiente paso',
          body:
              'Al terminar, pregunta qué se ha acordado y cuándo habrá una respuesta. Puedes pedir un resumen por escrito.',
        ),
      ],
    ),
    (
      label: 'Encuentros',
      title: 'En una reunión con otras personas',
      phrase: 'Me voy a descansar. Gracias por el encuentro.',
      steps: [
        (
          title: 'Elige cómo participar',
          body:
              'Puedes hablar con una persona, escuchar o hacer una pausa. No hay una única forma correcta de participar.',
        ),
        (
          title: 'Pregunta antes de unirte',
          body:
              'Puedes decir: «¿Puedo unirme?». La posición de los cuerpos no confirma si el grupo quiere compañía.',
        ),
        (
          title: 'Despídete cuando lo necesites',
          body:
              'Puedes decir: «Me voy a descansar. Gracias por el encuentro». No necesitas inventar un motivo ni dar detalles personales.',
        ),
      ],
    ),
    (
      label: 'Me quedé en blanco',
      title: 'Si no encuentras las palabras',
      phrase: 'Necesito más tiempo para responder.',
      steps: [
        (
          title: 'Date tiempo',
          body:
              'Puedes decir: «Necesito un momento para pensar». No tienes que llenar cada silencio.',
        ),
        (
          title: 'Pide que repitan',
          body:
              'Si perdiste el hilo, prueba: «¿Puedes repetir la última pregunta?». También puedes pedir una pregunta a la vez.',
        ),
        (
          title: 'Cambia de formato',
          body:
              'Puedes escribir, mostrar una frase en la pantalla o proponer responder después.',
        ),
      ],
    ),
    (
      label: 'Mucho ruido',
      title: 'Si el entorno dificulta la conversación',
      phrase: 'Hay mucho ruido. Busquemos un lugar tranquilo.',
      steps: [
        (
          title: 'Busca otra opción',
          body:
              'Si puedes, aléjate del ruido o pregunta si hay un lugar más tranquilo. También puedes proponer continuar por escrito.',
        ),
        (
          title: 'Di lo que necesitas',
          body:
              'Por ejemplo: «Aquí me cuesta seguir la conversación. ¿Podemos cambiar de lugar?». No necesitas explicar un diagnóstico.',
        ),
        (
          title: 'Acuerda cómo seguir',
          body:
              'Puedes continuar, hacer una pausa o terminar por ahora. Pregunta también qué le sirve a la otra persona.',
        ),
      ],
    ),
    (
      label: 'Pedir una pausa',
      title: 'Puedes pausar la conversación',
      phrase: 'Necesito una pausa. Podemos hablar después.',
      steps: [
        (
          title: 'Pide una pausa',
          body:
              'Puedes decirlo, escribirlo o mostrar una frase. Por ejemplo: «Necesito una pausa. Podemos hablar después».',
        ),
        (
          title: 'Elige cuánto tiempo necesitas',
          body:
              'No hay una duración que sirva para todas las personas. Si no sabes cuánto necesitas, puedes decirlo sin prometer una hora.',
        ),
        (
          title: 'Decide si quieres retomar',
          body:
              'Cuando quieras continuar, puedes proponer otro momento o formato. También puedes decidir no seguir con esa conversación.',
        ),
      ],
    ),
  ];

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  void _selectSection(int index) {
    TtsService.stop();
    setState(() => _selectedTab = index);
  }

  @override
  Widget build(BuildContext context) {
    final section = _sections[_selectedTab];
    final speechId = 'quick_help_$_selectedTab';
    return Scaffold(
      appBar: AppBar(title: const Text('Ayuda rápida')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text('Elige una situación. Estos pasos son opcionales: '
                    'usa solo lo que te sirva.'),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (var i = 0; i < _sections.length; i++)
                      ChoiceChip(
                        label: Text(_sections[i].label),
                        selected: _selectedTab == i,
                        onSelected: (_) => _selectSection(i),
                      ),
                  ],
                ),
                const SizedBox(height: 24),
                Semantics(
                  header: true,
                  child: Text(section.title,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder<String?>(
                  valueListenable: TtsService.currentSpeakingIdNotifier,
                  builder: (context, speakingId, _) {
                    final speaking = speakingId == speechId;
                    return OutlinedButton.icon(
                      onPressed: () => speaking
                          ? TtsService.stop()
                          : TtsService.speak(
                              '${section.title}. ${section.steps.map((step) => '${step.title}. ${step.body}').join(' ')}',
                              gestureId: speechId),
                      icon: Icon(
                          speaking ? Icons.stop : Icons.volume_up_outlined),
                      label: Text(speaking
                          ? 'Detener lectura'
                          : 'Escuchar estos pasos'),
                    );
                  },
                ),
                const SizedBox(height: 12),
                for (var i = 0; i < section.steps.length; i++)
                  Card(
                    child: CheckboxListTile(
                      contentPadding: const EdgeInsets.all(12),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(section.steps[i].title),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(section.steps[i].body),
                      ),
                      value: _checkedItems.contains('${_selectedTab}_$i'),
                      onChanged: (checked) => setState(() {
                        final key = '${_selectedTab}_$i';
                        if (checked == true) {
                          _checkedItems.add(key);
                        } else {
                          _checkedItems.remove(key);
                        }
                      }),
                    ),
                  ),
                if (_checkedItems
                    .any((key) => key.startsWith('${_selectedTab}_')))
                  TextButton(
                    onPressed: () => setState(() => _checkedItems.removeWhere(
                        (key) => key.startsWith('${_selectedTab}_'))),
                    child: const Text('Desmarcar estos pasos'),
                  ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {
                    TtsService.stop();
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (_) => CommunicationMessageScreen(
                            message: section.phrase)));
                  },
                  icon: const Icon(Icons.fullscreen),
                  label: const Text('Mostrar una frase para esta situación'),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    TtsService.stop();
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (_) => const CommunicationBoardScreen()));
                  },
                  child: const Text('Ver todas las frases'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
