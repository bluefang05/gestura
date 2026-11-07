import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/navigation/app_route_observer.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/core/services/tts_service.dart';
import 'package:gestura/widgets/common/screen_speech_reader.dart';
import 'package:gestura/screens/dictionary_screen.dart';
import 'package:gestura/screens/decoder_screen.dart';
import 'package:gestura/screens/progress_screen.dart';
import 'package:gestura/screens/tools_screen.dart';
import 'package:gestura/screens/quiz_hub_screen.dart';
import 'package:gestura/screens/scenarios_screen.dart';
import 'package:gestura/screens/settings_screen.dart';
import 'package:gestura/state/settings_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final spoken = <String>[];
  const channel = MethodChannel('flutter_tts');
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    SettingsProvider().loadSettings();
    await SettingsProvider().setSoundEffectsEnabled(false);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'speak') spoken.add(call.arguments.toString());
      if (call.method == 'getLanguages') return ['es-MX'];
      return 1;
    });
    await TtsService.stop();
    spoken.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/google_mobile_ads'),
            (_) async => null);
  });

  Widget app(Widget body) => MaterialApp(
        navigatorObservers: [SpeechRouteObserver()],
        builder: (_, child) => ScreenSpeechReader(child: child!),
        home: Scaffold(body: body),
      );

  Future<void> read(WidgetTester tester) async {
    spoken.clear();
    await tester.tap(find.text('Escuchar pantalla'));
    await tester.pumpAndSettle();
  }

  testWidgets(
      'Reads full actual copy, rich text, disabled actions and icon labels without hidden answers',
      (tester) async {
    await tester.pumpWidget(app(Column(children: [
      const Text(
          'Esta instrucción completa se escucha aunque aparezca cortada.',
          maxLines: 1,
          overflow: TextOverflow.ellipsis),
      const Text.rich(TextSpan(children: [
        TextSpan(text: 'Una frase '),
        TextSpan(text: 'con énfasis.')
      ])),
      const FilledButton(onPressed: null, child: Text('Comprobar respuesta')),
      IconButton(
          tooltip: 'Limpiar búsqueda',
          onPressed: () {},
          icon: const Icon(Icons.clear)),
      const Offstage(child: Text('Respuesta correcta oculta')),
      const IndexedStack(
          index: 0,
          children: [Text('Pestaña actual'), Text('Otra pestaña oculta')]),
      Semantics(
          image: true,
          label: 'Gráfico: rostro 25 por ciento',
          child: const SizedBox(width: 100, height: 40)),
      Semantics(toggled: true, child: const SizedBox(width: 48, height: 48)),
    ])));
    await read(tester);
    final text = spoken.join();
    expect(
        text,
        contains(
            'Esta instrucción completa se escucha aunque aparezca cortada.'));
    expect(text, contains('Una frase con énfasis.'));
    expect(text, contains('Comprobar respuesta'));
    expect(text, contains('Limpiar búsqueda'));
    expect(text, contains('Pestaña actual'));
    expect(text, contains('Gráfico: rostro 25 por ciento'));
    expect(text, contains('Activado'));
    expect(text, isNot(contains('oculta')));
    expect(text.split('Una frase con énfasis.').length, 2);
  });

  testWidgets(
      'Only current dialog is read and the reader remains usable above it',
      (tester) async {
    await tester.pumpWidget(app(Builder(
        builder: (context) => TextButton(
              child: const Text('Abrir aviso del fondo'),
              onPressed: () => showDialog<void>(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Aviso actual'),
                        content: const Text(
                            'Esta es toda la explicación del aviso.'),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cerrar aviso'))
                        ],
                      )),
            ))));
    await tester.tap(find.text('Abrir aviso del fondo'));
    await tester.pumpAndSettle();
    await read(tester);
    expect(spoken.join(), contains('Esta es toda la explicación del aviso.'));
    expect(spoken.join(), contains('Cerrar aviso'));
    expect(spoken.join(), isNot(contains('Abrir aviso del fondo')));
    await tester.tap(find.byTooltip('Detener toda la lectura'));
    await tester.pump();
    expect(TtsService.isSpeakingNotifier.value, isFalse);
  });

  testWidgets(
      'Newly scrolled list text can be read without reading clipped or hidden entries',
      (tester) async {
    await tester.pumpWidget(app(ListView.builder(
        itemCount: 40,
        itemBuilder: (_, i) =>
            SizedBox(height: 150, child: Text('Entrada número $i')))));
    await read(tester);
    expect(spoken.join(), contains('Entrada número 0'));
    expect(spoken.join(), isNot(contains('Entrada número 39')));
    await tester.scrollUntilVisible(find.text('Entrada número 39'), 400,
        scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    await read(tester);
    expect(spoken.join(), contains('Entrada número 39'));
    expect(spoken.join(), isNot(contains('Entrada número 0')));
  });

  testWidgets(
      'Choose-text mode reads a button label without triggering its action',
      (tester) async {
    var pressed = false;
    await tester.pumpWidget(app(Center(
        child: FilledButton(
            onPressed: () => pressed = true,
            child: const Text('Acción de ejemplo')))));
    await tester.tap(find.byTooltip('Elegir un texto para escuchar'));
    await tester.pumpAndSettle();
    spoken.clear();
    await tester.tapAt(tester.getCenter(find.text('Acción de ejemplo')));
    await tester.pumpAndSettle();
    expect(spoken.single, 'Acción de ejemplo');
    expect(pressed, isFalse);
    await tester.tap(find.text('Acción de ejemplo'));
    expect(pressed, isTrue);
  });

  testWidgets('Selectable copy and field labels and values are readable',
      (tester) async {
    await tester.pumpWidget(app(const Column(children: [
      SelectableText('Texto seleccionable completo'),
      TextField(
          decoration: InputDecoration(
              labelText: 'Buscar una señal', hintText: 'Escribe aquí')),
    ])));
    await tester.enterText(find.byType(TextField), 'brazos cruzados');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
    await read(tester);
    expect(spoken.join(), contains('Texto seleccionable completo'));
    expect(spoken.join(), contains('Buscar una señal'));
    expect(spoken.join(), contains('brazos cruzados'));
  });

  test('Long speech preserves all copy and emoji across native-size chunks',
      () async {
    final text =
        List.filled(600, 'Una explicación completa con emoji 👐. ').join();
    final chunks = TtsService.splitForSpeech(text);
    expect(chunks.join(), text);
    expect(chunks.every((chunk) => chunk.length <= 1800), isTrue);
    await TtsService.speakSpanish(text);
    expect(spoken.join(), text);
    final emoji = '${List.filled(1799, 'a').join()}👐fin';
    expect(TtsService.splitForSpeech(emoji).join(), emoji);
  });

  test('Stop cancels remaining chunks while a native speech call is running',
      () async {
    final started = Completer<void>();
    final finish = Completer<int>();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'speak') {
        spoken.add(call.arguments.toString());
        started.complete();
        return finish.future;
      }
      return 1;
    });
    final reading =
        TtsService.speakSpanish(List.filled(1000, 'Texto largo. ').join());
    await started.future;
    await TtsService.stop();
    finish.complete(1);
    await reading;
    expect(spoken.length, 1);
    expect(TtsService.isSpeakingNotifier.value, isFalse);
  });

  for (final size in [const Size(320, 640), const Size(844, 390)]) {
    testWidgets('Reader controls fit at large text on $size', (tester) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(MaterialApp(
          builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(2.8)),
                child: ScreenSpeechReader(child: child!),
              ),
          home: const Scaffold(
              body:
                  SingleChildScrollView(child: Text('Contenido accesible')))));
      await tester.pumpAndSettle();
      expect(find.byTooltip('Detener toda la lectura').hitTestable(),
          findsOneWidget);
      await read(tester);
      expect(spoken.join(), contains('Contenido accesible'));
      expect(tester.takeException(), isNull);
    });
  }

  final screens = <Widget, String>{
    const DictionaryScreen(): 'Manual de Señales',
    const DecoderScreen(): 'Diccionario de Gestos',
    const ProgressScreen(): 'Mi progreso',
    const ToolsScreen(): 'Herramientas',
    const QuizHubScreen(): 'Zona de Práctica',
    const ScenariosScreen(): 'Simulador de Escenarios',
    const SettingsScreen(): 'Ajustes',
  };
  for (final entry in screens.entries) {
    testWidgets('Universal reader covers ${entry.key.runtimeType}',
        (tester) async {
      await tester.pumpWidget(app(entry.key));
      await tester.pumpAndSettle();
      await read(tester);
      expect(spoken.join(), contains(entry.value));
      await tester.tap(find.byTooltip('Detener toda la lectura'));
      await tester.pumpAndSettle();
      expect(TtsService.isSpeakingNotifier.value, isFalse);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('Navigation cancels speech and clears pending text selection',
      (tester) async {
    final navigator = GlobalKey<NavigatorState>();
    final observer = SpeechRouteObserver();
    await tester.pumpWidget(MaterialApp(
      navigatorKey: navigator,
      navigatorObservers: [observer],
      builder: (_, child) => ScreenSpeechReader(
          navigationChanges: observer.changes, child: child!),
      home: const Scaffold(body: Text('Pantalla anterior')),
    ));
    await tester.tap(find.byTooltip('Elegir un texto para escuchar'));
    await tester.pumpAndSettle();
    navigator.currentState!.push(MaterialPageRoute<void>(
        builder: (_) => const Scaffold(body: Text('Pantalla siguiente'))));
    await tester.pumpAndSettle();
    expect(TtsService.isSpeakingNotifier.value, isFalse);
    expect(find.byTooltip('Elegir un texto para escuchar'), findsOneWidget);
    await read(tester);
    expect(spoken.join(), contains('Pantalla siguiente'));
    expect(spoken.join(), isNot(contains('Pantalla anterior')));
  });

  testWidgets('Stop also cancels a screen reading that has not started yet',
      (tester) async {
    await tester
        .pumpWidget(app(const Text('No debe sonar después de detener.')));
    await tester.pumpAndSettle();
    final release = Completer<int>();
    var pendingStop = true;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'stop' && pendingStop) {
        pendingStop = false;
        return release.future;
      }
      if (call.method == 'speak') spoken.add(call.arguments.toString());
      return 1;
    });
    await tester.tap(find.text('Escuchar pantalla'));
    await tester.pump();
    await tester.tap(find.byTooltip('Detener toda la lectura'));
    release.complete(1);
    await tester.pumpAndSettle();
    expect(spoken, isEmpty);
  });

  testWidgets(
      'Text selection has a visible cancel action and resets on rotation',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(app(const Text('Un texto para escuchar')));
    await tester.tap(find.byTooltip('Elegir un texto para escuchar'));
    await tester.pumpAndSettle();
    expect(find.text('Cancelar selección').hitTestable(), findsOneWidget);
    await tester.tap(find.text('Cancelar selección'));
    await tester.pumpAndSettle();
    expect(find.text('Escuchar pantalla'), findsOneWidget);
    await tester.tap(find.byTooltip('Elegir un texto para escuchar'));
    await tester.pumpAndSettle();
    tester.view.physicalSize = const Size(844, 390);
    await tester.pumpAndSettle();
    expect(find.text('Escuchar pantalla'), findsOneWidget);
    expect(find.byTooltip('Elegir un texto para escuchar'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
