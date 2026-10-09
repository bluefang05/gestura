import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/services/tts_service.dart';

/// A quiet, offline way to show a need without having to say it aloud.
class CommunicationBoardScreen extends StatefulWidget {
  const CommunicationBoardScreen({super.key});

  @override
  State<CommunicationBoardScreen> createState() =>
      _CommunicationBoardScreenState();
}

class _CommunicationBoardScreenState extends State<CommunicationBoardScreen> {
  final _message = TextEditingController();

  static const _phrases = <({String text, IconData icon})>[
    (text: 'Necesito una pausa.', icon: Icons.pause_circle_outline),
    (text: 'Prefiero escribir.', icon: Icons.edit_outlined),
    (text: 'Necesito más tiempo para responder.', icon: Icons.schedule),
    (
      text: 'Hay mucho ruido. Busquemos un lugar tranquilo.',
      icon: Icons.volume_off_outlined
    ),
    (
      text: 'Por favor, dime una cosa a la vez.',
      icon: Icons.format_list_numbered
    ),
    (text: '¿Puedes explicarlo con otras palabras?', icon: Icons.help_outline),
    (
      text: 'No quiero. Por favor, respeta mi decisión.',
      icon: Icons.pan_tool_outlined
    ),
    (text: 'Necesito ayuda.', icon: Icons.support_agent),
  ];

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  void _showMessage(String text, {bool isSpanish = false}) {
    FocusManager.instance.primaryFocus?.unfocus();
    TtsService.stop();
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => CommunicationMessageScreen(
          message: text.trim(), isSpanish: isSpanish),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comunicar ahora')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('Elige lo que quieres decir',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                const Text('Toca una frase para mostrarla en grande. '
                    'Solo se leerá en voz alta si pulsas «Leer en voz alta».'),
                const SizedBox(height: 20),
                LayoutBuilder(builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 560 &&
                          MediaQuery.textScalerOf(context).scale(16) <= 24
                      ? 2
                      : 1;
                  final width =
                      (constraints.maxWidth - (columns - 1) * 12) / columns;
                  return Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      for (final phrase in _phrases)
                        SizedBox(
                          width: width,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(0, 72),
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.centerLeft,
                            ),
                            onPressed: () =>
                                _showMessage(phrase.text, isSpanish: true),
                            child: Row(children: [
                              ExcludeSemantics(child: Icon(phrase.icon)),
                              const SizedBox(width: 12),
                              Expanded(child: Text(phrase.text)),
                            ]),
                          ),
                        ),
                    ],
                  );
                }),
                const SizedBox(height: 28),
                Text('También puedes escribir',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                TextField(
                  controller: _message,
                  minLines: 2,
                  maxLines: 5,
                  maxLength: 500,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Tu mensaje',
                    hintText: 'Escribe lo que necesitas comunicar',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _message,
                  builder: (context, value, _) => FilledButton.icon(
                    key: const ValueKey('show_custom_message'),
                    onPressed: value.text.trim().isEmpty
                        ? null
                        : () => _showMessage(value.text),
                    icon: const Icon(Icons.fullscreen),
                    label: const Text('Mostrar mi mensaje'),
                  ),
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

class CommunicationMessageScreen extends StatefulWidget {
  final String message;
  final bool isSpanish;

  const CommunicationMessageScreen(
      {super.key, required this.message, this.isSpanish = false});

  @override
  State<CommunicationMessageScreen> createState() =>
      _CommunicationMessageScreenState();
}

class _CommunicationMessageScreenState
    extends State<CommunicationMessageScreen> {
  static const _speechId = 'communication_message';

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  Future<void> _copy() async {
    try {
      await Clipboard.setData(ClipboardData(text: widget.message));
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Mensaje copiado')));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No se pudo copiar. Puedes seleccionar el texto.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Tu mensaje')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: (constraints.maxHeight - 48)
                          .clamp(0, double.infinity)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Semantics(
                        container: true,
                        label: widget.message,
                        excludeSemantics: true,
                        child: SelectableText(
                          widget.message,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontSize: 32,
                            height: 1.35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 36),
                      ValueListenableBuilder<String?>(
                        valueListenable: TtsService.currentSpeakingIdNotifier,
                        builder: (context, speakingId, _) {
                          final speaking = speakingId == _speechId;
                          return FilledButton.icon(
                            onPressed: () => speaking
                                ? TtsService.stop()
                                : widget.isSpanish
                                    ? TtsService.speakSpanish(widget.message,
                                        gestureId: _speechId)
                                    : TtsService.speak(widget.message,
                                        gestureId: _speechId),
                            icon: Icon(speaking
                                ? Icons.stop
                                : Icons.volume_up_outlined),
                            label: Text(speaking
                                ? 'Detener lectura'
                                : 'Leer en voz alta'),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        onPressed: _copy,
                        icon: const Icon(Icons.copy_outlined),
                        label: const Text('Copiar mensaje'),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Volver'),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
