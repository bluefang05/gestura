import 'package:flutter/material.dart';
import '../../core/services/screen_text_service.dart';
import '../../core/services/tts_service.dart';

/// Outside Navigator so the same controls remain available above dialogs too.
class ScreenSpeechReader extends StatefulWidget {
  final Widget child;
  final Listenable? navigationChanges;
  const ScreenSpeechReader(
      {super.key, required this.child, this.navigationChanges});

  @override
  State<ScreenSpeechReader> createState() => _ScreenSpeechReaderState();
}

class _ScreenSpeechReaderState extends State<ScreenSpeechReader>
    with WidgetsBindingObserver {
  final _contentKey = GlobalKey();
  List<ScreenText>? _selection;
  int _readRequest = 0;

  List<ScreenText> _texts() =>
      ScreenTextService.collect(_contentKey.currentContext!);

  Future<void> _readScreen() async {
    final request = ++_readRequest;
    setState(() => _selection = null);
    await TtsService.stop();
    if (!mounted || request != _readRequest) return;
    final text = _texts().map((item) => item.text).join('\n\n');
    TtsService.speakSpanish(
        text.isEmpty ? 'No hay texto visible para leer.' : text,
        gestureId: 'screen_reader');
  }

  void _onNavigationChanged() {
    _readRequest++;
    _selection = null;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    widget.navigationChanges?.addListener(_onNavigationChanged);
  }

  @override
  void didChangeMetrics() {
    if (_selection == null) return;
    _readRequest++;
    TtsService.stop();
    setState(() => _selection = null);
  }

  @override
  void didUpdateWidget(ScreenSpeechReader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.navigationChanges != widget.navigationChanges) {
      oldWidget.navigationChanges?.removeListener(_onNavigationChanged);
      widget.navigationChanges?.addListener(_onNavigationChanged);
    }
  }

  void _chooseText() {
    _readRequest++;
    TtsService.stop();
    if (_selection != null) {
      setState(() => _selection = null);
      return;
    }
    final request = _readRequest;
    setState(() => _selection = []);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _selection != null && request == _readRequest) {
        // The toolbar can change height with enlarged text in this mode.
        _selection = _texts();
      }
    });
    TtsService.speakSpanish('Toca el texto que quieres escuchar.',
        gestureId: 'screen_reader_prompt');
  }

  void _readAt(TapDownDetails details) {
    _readRequest++;
    final matches = _selection!
        .where(
            (item) => item.bounds.inflate(6).contains(details.globalPosition))
        .toList();
    setState(() => _selection = null);
    if (matches.isEmpty) {
      TtsService.speakSpanish(
          'No se encontró texto en ese punto. Puedes elegir otro texto.');
      return;
    }
    // Prefer the most specific text when a label overlaps another region.
    matches.sort((a, b) => (a.bounds.width * a.bounds.height)
        .compareTo(b.bounds.width * b.bounds.height));
    TtsService.speakSpanish(matches.first.text,
        gestureId: 'screen_reader_text');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _readRequest++;
    widget.navigationChanges?.removeListener(_onNavigationChanged);
    TtsService.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Overlay.wrap(
          child: Column(
        children: [
          Material(
            color: Theme.of(context).colorScheme.surface,
            child: SafeArea(
              bottom: false,
              child: Row(children: [
                Expanded(
                  child: Tooltip(
                    message: _selection == null
                        ? 'Leer los textos visibles'
                        : 'Cancelar selección de texto',
                    child: TextButton.icon(
                      onPressed: _selection == null ? _readScreen : _chooseText,
                      icon: Icon(_selection == null
                          ? Icons.volume_up_outlined
                          : Icons.close),
                      label: Text(_selection == null
                          ? 'Escuchar pantalla'
                          : 'Cancelar selección'),
                    ),
                  ),
                ),
                if (_selection == null)
                  IconButton(
                    tooltip: 'Elegir un texto para escuchar',
                    onPressed: _chooseText,
                    icon: const Icon(Icons.touch_app_outlined),
                  ),
                IconButton(
                  tooltip: 'Detener toda la lectura',
                  onPressed: () {
                    _readRequest++;
                    setState(() => _selection = null);
                    TtsService.stop();
                  },
                  icon: const Icon(Icons.stop_circle_outlined),
                ),
              ]),
            ),
          ),
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Stack(children: [
                Positioned.fill(
                  child: RepaintBoundary(
                    key: _contentKey,
                    child: NotificationListener<ScrollStartNotification>(
                      onNotification: (_) {
                        if (TtsService.currentSpeakingIdNotifier.value
                                ?.startsWith('screen_reader') ==
                            true) {
                          _readRequest++;
                          TtsService.stop();
                        }
                        return false;
                      },
                      child: widget.child,
                    ),
                  ),
                ),
                if (_selection != null)
                  Positioned.fill(
                    child: Semantics(
                      label:
                          'Toca el texto que quieres escuchar. Para salir, usa Cancelar selección de texto.',
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTapDown: _readAt,
                        child: ColoredBox(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withValues(alpha: 0.04)),
                      ),
                    ),
                  ),
              ]),
            ),
          ),
        ],
      ));
}
