import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/core/services/tts_service.dart';
import 'package:gestura/models/category.dart';
import 'package:gestura/models/quiz_question.dart';
import 'package:gestura/models/user_progress.dart';
import 'package:gestura/models/scenario.dart';
import 'package:gestura/screens/scenario_runner_screen.dart';
import 'package:gestura/screens/quiz_runner_screen.dart';
import 'package:gestura/state/settings_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('flutter_tts');
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    SettingsProvider().loadSettings();
    await SettingsProvider().setSoundEffectsEnabled(false);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (_) async => 1);
  });
  QuizQuestion question({bool long = false}) => QuizQuestion(
        id: 'audit',
        category: CategoryType.lenguajeCorporal,
        prompt: long
            ? List.filled(20, 'Una pregunta extensa.').join(' ')
            : 'Elige una respuesta',
        options: const [
          QuizOption(id: 'yes', text: 'Correcta', isCorrect: true),
          QuizOption(id: 'no', text: 'Incorrecta', isCorrect: false)
        ],
        explanation: List.filled(40, 'Lee y vuelve a intentarlo.').join(' '),
        keyVisualClue: 'Observa con calma.',
      );
  test('Failed attempt is not a completed question', () {
    final failed = UserProgress.initial().recordQuizResult('q', 0);
    expect(failed.completedQuizIds, isEmpty);
    final passed = failed.recordQuizResult('q', 100);
    expect(passed.completedQuizIds, ['q']);
  });
  testWidgets('System Back from feedback continues instead of locking the quiz',
      (tester) async {
    var completions = 0;
    await tester.pumpWidget(MaterialApp(
        home: QuizRunnerScreen(
            title: 'Prueba',
            questions: [question()],
            onCompleted: () => completions++)));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Incorrecta'));
    await tester.pump();
    await tester.tap(find.text('Comprobar Respuesta'));
    await tester.pumpAndSettle();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(completions, 0);
    await tester.tap(find.text('Correcta'));
    await tester.pump();
    await tester.tap(find.text('Comprobar Respuesta'));
    await tester.pumpAndSettle();
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(completions, 1);
    // Framework reports uncaught rendering errors.
  });
  testWidgets('Long question and feedback stay readable with large text',
      (tester) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2.8)),
            child: child!),
        home: QuizRunnerScreen(
            title: 'Prueba', questions: [question(long: true)])));
    await tester.pumpAndSettle();
    // Framework reports uncaught rendering errors.
    await tester.scrollUntilVisible(find.text('Correcta'), 250);
    await tester.tap(find.text('Correcta'));
    await tester.pump();
    await tester.tap(find.text('Comprobar Respuesta'));
    await tester.pumpAndSettle();
    // Framework reports uncaught rendering errors.
    await tester.scrollUntilVisible(find.text('Continuar'), 300,
        scrollable: find.byType(Scrollable).last, maxScrolls: 100);
    await tester.tap(find.text('Continuar'));
    await tester.pumpAndSettle();
    // Framework reports uncaught rendering errors.
  });
  testWidgets(
      'Empty scenario with automatic narration does not access a missing step',
      (tester) async {
    await SettingsProvider().setAutoNarration(true);
    await tester.pumpWidget(const MaterialApp(
        home: ScenarioRunnerScreen(
            scenario: Scenario(
                id: 'empty',
                title: 'Vacío',
                domain: 'Prueba',
                description: '',
                contextOverview: '',
                iconName: 'help',
                steps: []))));
    await tester.pumpAndSettle();
    // Framework reports uncaught rendering errors.
  });
  test('Stopping while voice initializes cancels the pending reading',
      () async {
    final entered = Completer<void>();
    final release = Completer<int>();
    var speechCalls = 0;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'setLanguage') {
        entered.complete();
        return release.future;
      }
      if (call.method == 'speak') speechCalls++;
      return 1;
    });
    final reading = TtsService.speak('No debe sonar después de salir.');
    await entered.future;
    await TtsService.stop();
    release.complete(1);
    await reading;
    expect(speechCalls, 0);
  });
}
