import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/navigation/app_route_observer.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/core/services/tts_service.dart';
import 'package:gestura/data/quiz_database.dart';
import 'package:gestura/models/category.dart';
import 'package:gestura/models/quiz_question.dart';
import 'package:gestura/models/scenario.dart';
import 'package:gestura/models/user_progress.dart';
import 'package:gestura/screens/main_navigation_screen.dart';
import 'package:gestura/screens/flash_quiz_screen.dart';
import 'package:gestura/screens/quiz_runner_screen.dart';
import 'package:gestura/screens/scenario_runner_screen.dart';
import 'package:gestura/state/progress_provider.dart';
import 'package:gestura/state/settings_provider.dart';
import 'package:gestura/widgets/illustrations/illustration_widget.dart';
import 'package:gestura/widgets/quiz/quiz_feedback_sheet.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final spoken = <String>[];
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    SettingsProvider().loadSettings();
    ProgressProvider().loadProgress();
    await SettingsProvider().setSoundEffectsEnabled(false);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter_tts'),
            (call) async {
      if (call.method == 'speak') spoken.add(call.arguments.toString());
      if (call.method == 'getLanguages') return ['es-MX'];
      return 1;
    });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('plugins.flutter.io/google_mobile_ads'),
            (_) async => null);
    await TtsService.stop();
    spoken.clear();
  });

  void phone(WidgetTester tester, [Size size = const Size(430, 1200)]) {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  Future<void> startFlash(WidgetTester tester) async {
    phone(tester);
    await tester.pumpWidget(MaterialApp(
        navigatorObservers: [appRouteObserver, SpeechRouteObserver()],
        home: const FlashQuizScreen()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Empezar preguntas'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 150));
  }

  testWidgets(
      'Automatic feedback starts after the modal route opens and keeps playing',
      (tester) async {
    await StorageService.setAutoNarration(true);
    const question = QuizQuestion(
        id: 'audit',
        category: CategoryType.lenguajeCorporal,
        prompt: 'Elige una respuesta de prueba.',
        options: [
          QuizOption(id: 'yes', text: 'Respuesta comprobada', isCorrect: true),
          QuizOption(id: 'no', text: 'Otra respuesta', isCorrect: false),
        ],
        explanation: 'Explicación que debe escucharse completa.',
        keyVisualClue: 'Observa el contexto.');
    await tester.pumpWidget(MaterialApp(
        navigatorObservers: [SpeechRouteObserver()],
        home: const QuizRunnerScreen(title: 'Prueba', questions: [question])));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('Respuesta comprobada'));
    await tester.pump();
    await tester.tap(find.text('Comprobar Respuesta'));
    await tester.pumpAndSettle();
    expect(spoken.last, contains(question.explanation));
    expect(TtsService.currentSpeakingIdNotifier.value, 'quiz_feedback');
    expect(TtsService.isSpeakingNotifier.value, isTrue);
    await tester.tap(find.text('Continuar'));
    await tester.pumpAndSettle();
    expect(find.text('¡Práctica completada!'), findsOneWidget);
  });

  testWidgets(
      'Feedback Continue stays visible with long explanations and enlarged text',
      (tester) async {
    phone(tester, const Size(320, 640));
    await tester.pumpWidget(MaterialApp(
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2)),
            child: child!),
        home: Builder(
            builder: (context) => Scaffold(
                body: TextButton(
                    child: const Text('Abrir'),
                    onPressed: () => showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        builder: (sheetContext) => QuizFeedbackSheet(
                            isCorrect: false,
                            correctAnswer: 'Una respuesta explicada',
                            keyVisualClue: 'Una clave extensa para observar.',
                            explanation:
                                List.filled(80, 'Explicación detallada.')
                                    .join(' '),
                            onContinue: () =>
                                Navigator.pop(sheetContext))))))));
    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    expect(find.text('Continuar').hitTestable(), findsOneWidget);
    expect(find.text('Más explicación abajo · Desliza para leerla'),
        findsOneWidget);
    expect(tester.takeException(), isNull);
    final scroll = tester
        .widget<SingleChildScrollView>(find.byType(SingleChildScrollView));
    scroll.controller!.jumpTo(scroll.controller!.position.maxScrollExtent);
    await tester.pumpAndSettle();
    expect(
        find.text('Más explicación abajo · Desliza para leerla'), findsNothing);
    await tester.tap(find.text('Continuar'));
    await tester.pumpAndSettle();
    expect(find.text('Abrir'), findsOneWidget);
  });

  testWidgets(
      'Back from a tab returns Home and switching tabs dismisses the keyboard',
      (tester) async {
    phone(tester, const Size(390, 844));
    await tester.pumpWidget(
        const MaterialApp(home: MainNavigationScreen(initialTab: 1)));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'brazos');
    final field = tester.widget<EditableText>(find.byType(EditableText).first);
    expect(field.focusNode.hasFocus, isTrue);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(
        tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
        0);
    expect(field.focusNode.hasFocus, isFalse);
    await tester.tap(find.text('Manual'));
    await tester.pumpAndSettle();
    expect(
        tester.widget<TextField>(find.byType(TextField).first).controller!.text,
        'brazos');
  });

  testWidgets('Flash uses a question image and can be paused and replayed',
      (tester) async {
    await startFlash(tester);
    final question = QuizDatabase.questions.firstWhere((q) =>
        find.text(q.prompt).evaluate().isNotEmpty &&
        q.options
            .every((option) => find.text(option.text).evaluate().isNotEmpty));
    expect(question.isImageOptionGrid, isFalse);
    expect(
        tester
            .widget<ConoVeIllustration>(find.byType(ConoVeIllustration).first)
            .illustrationKey,
        question.questionIllustrationKey);
    await tester.tap(find.text('Pausar imagen'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));
    expect(find.byType(ConoVeIllustration), findsOneWidget);
    await tester.tap(find.text('Reanudar imagen'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 4));
    expect(find.byType(ConoVeIllustration), findsNothing);
    await tester.tap(find.text('Ver imagen otra vez'));
    await tester.pump();
    expect(find.byType(ConoVeIllustration), findsOneWidget);
  });

  testWidgets('Flash pauses for a concept route and while speech is playing',
      (tester) async {
    await startFlash(tester);
    await tester.tap(find.byTooltip('Consultar conceptos'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 10));
    await tester.pageBack();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.byType(ConoVeIllustration), findsOneWidget);
    await tester
        .tap(find.byTooltip('Escuchar lectura en voz alta').hitTestable());
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 10));
    expect(find.byType(ConoVeIllustration), findsOneWidget);
    expect(find.text('Tiempo pausado mientras escuchas.'), findsOneWidget);
    await TtsService.stop();
    await tester.pump();
    await tester.pump(const Duration(seconds: 4));
    expect(find.byType(ConoVeIllustration), findsNothing);
  });

  testWidgets('Flash clock does not run while the app is in the background',
      (tester) async {
    await startFlash(tester);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    await tester.pump(const Duration(seconds: 8));
    expect(find.byType(ConoVeIllustration), findsOneWidget);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pump();
    await tester.pump(const Duration(seconds: 4));
    expect(find.byType(ConoVeIllustration), findsNothing);
  });

  for (final size in [const Size(320, 640), const Size(844, 390)]) {
    testWidgets(
        'Scenario completion can scroll and exit on $size with large text',
        (tester) async {
      phone(tester, size);
      const scenario = Scenario(
          id: 'ux_end',
          title:
              'Un escenario con un título completo para revisar la lectura final.',
          domain: 'Prueba',
          description: '',
          contextOverview: '',
          iconName: 'help',
          steps: [
            ScenarioStep(
                id: 'end',
                narrative: 'Revisa esta situación.',
                characterAction: 'La persona espera una respuesta.',
                learningTakeaway: 'Un ejemplo para practicar.',
                visibleSignals: [],
                choices: [
                  ScenarioChoice(
                      text: 'Continuar con el caso',
                      consequenceSummary: 'Resultado del caso.',
                      analysis: 'Una explicación breve.',
                      isBestAction: true),
                ]),
          ]);
      await tester.pumpWidget(MaterialApp(
          builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(2)),
              child: child!),
          home: const ScenarioRunnerScreen(scenario: scenario)));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(find.text('Continuar con el caso'), 150,
          scrollable: find.byType(Scrollable).first);
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Continuar con el caso'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continuar con el caso').hitTestable());
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(find.text('Concluir Escenario'), 180,
          scrollable: find.byType(Scrollable).first);
      await tester.tap(find.text('Concluir Escenario'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.scrollUntilVisible(find.text('Volver a Escenarios'), 180,
          scrollable: find.byType(Scrollable).first);
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Volver a Escenarios'));
      await tester.pumpAndSettle();
      expect(find.text('Volver a Escenarios').hitTestable(), findsOneWidget);
      expect(
          ProgressProvider().progress.completedScenarioIds, contains('ux_end'));
    });
  }

  test(
      'Failed questions do not become completed after reopening saved progress',
      () {
    final failed = UserProgress.initial().recordQuizResult('failed', 0);
    expect(UserProgress.fromJson(failed.toJson()).completedQuizIds, isEmpty);
    final solved = failed.recordQuizResult('solved', 100);
    final restored = UserProgress.fromJson(solved.toJson());
    expect(restored.completedQuizIds, ['solved']);
    expect(restored.quizScores['failed'], 0);
  });

  testWidgets('Flash also pauses while the voice engine is still initializing',
      (tester) async {
    await startFlash(tester);
    final entered = Completer<void>();
    final release = Completer<int>();
    addTearDown(() {
      if (!release.isCompleted) release.complete(1);
    });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter_tts'),
            (call) async {
      if (call.method == 'setLanguage') {
        entered.complete();
        return release.future;
      }
      return 1;
    });
    final reading = TtsService.speakSpanish('Lectura de pantalla pendiente.',
        gestureId: 'screen_reader');
    await entered.future;
    await tester.pump();
    await tester.pump(const Duration(seconds: 6));
    expect(find.byType(ConoVeIllustration), findsOneWidget);
    release.complete(1);
    await reading;
    await TtsService.stop();
    await tester.pump();
    await tester.pump(const Duration(seconds: 4));
    expect(find.byType(ConoVeIllustration), findsNothing);
  });
}
