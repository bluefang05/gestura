import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/data/roadmap_database.dart';
import 'package:gestura/data/quiz_database.dart';
import 'package:gestura/models/category.dart';
import 'package:gestura/models/quiz_question.dart';
import 'package:gestura/models/roadmap_step.dart';
import 'package:gestura/screens/quiz_runner_screen.dart';
import 'package:gestura/screens/flash_quiz_screen.dart';
import 'package:gestura/state/progress_provider.dart';
import 'package:gestura/state/settings_provider.dart';
import 'package:gestura/widgets/quiz/image_option_card.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    ProgressProvider().loadProgress();
    SettingsProvider().loadSettings();
    await SettingsProvider().setSoundEffectsEnabled(false);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('flutter_tts'), (_) async => 1);
  });

  QuizQuestion question(String id) => QuizQuestion(
        id: id,
        category: CategoryType.lenguajeCorporal,
        prompt: 'Pregunta $id',
        options: [
          QuizOption(id: '${id}_no', text: 'Incorrecta $id', isCorrect: false),
          QuizOption(id: '${id}_yes', text: 'Correcta $id', isCorrect: true),
        ],
        explanation: 'Explicación breve.',
        keyVisualClue: 'Observa el contexto.',
      );

  testWidgets('Wrong answers repeat until correct and do not complete early',
      (tester) async {
    var completed = 0;
    final spoken = <String>[];
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter_tts'),
            (call) async {
      if (call.method == 'speak') {
        spoken.add(call.arguments as String);
      }
      return 1;
    });
    await tester.pumpWidget(MaterialApp(
        home: QuizRunnerScreen(
            title: 'Repaso',
            questions: [question('a'), question('b')],
            onCompleted: () => completed++)));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Empezar preguntas'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Escuchar lectura en voz alta'));
    await tester.pumpAndSettle();
    final cards = tester
        .widgetList<ImageOptionCard>(find.byType(ImageOptionCard))
        .toList();
    expect(spoken.last.indexOf(cards[0].option.text),
        lessThan(spoken.last.indexOf(cards[1].option.text)));
    expect(spoken.last, isNot(contains('Opción A:')));
    for (final answer in [
      'Incorrecta a',
      'Correcta b',
      'Incorrecta a',
      'Correcta a'
    ]) {
      expect(completed, 0);
      await tester.tap(find.text(answer));
      await tester.pump();
      await tester.tap(find.text('Comprobar Respuesta'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
    }
    expect(completed, 1);
    expect(find.textContaining('2 de 2 respuestas correctas'), findsOneWidget);
  });

  testWidgets('Flash repeats a failed question after the other seven',
      (tester) async {
    tester.view.physicalSize = const Size(430, 1800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const MaterialApp(home: FlashQuizScreen()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Empezar preguntas'));
    await tester.pumpAndSettle();
    String? firstId;
    for (var attempt = 0; attempt < 9; attempt++) {
      expect(find.text('¡Sesión Completada!'), findsNothing);
      final q = QuizDatabase.questions.firstWhere((q) =>
          find.text(q.prompt).evaluate().isNotEmpty &&
          q.options.every((o) => find.text(o.text).evaluate().isNotEmpty));
      if (attempt == 0) firstId = q.id;
      if (attempt == 8) expect(q.id, firstId);
      final answer = q.options.firstWhere((o) => o.isCorrect == (attempt != 0));
      await tester.scrollUntilVisible(find.text(answer.text), 150);
      await tester.tap(find.text(answer.text));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
    }
    expect(find.text('¡Sesión Completada!'), findsOneWidget);
    expect(find.text('Aciertos: 8 de 8'), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets(
      'Quiz finishes only after all answers and retry restores first options',
      (tester) async {
    var completed = 0;
    await tester.pumpWidget(MaterialApp(
        home: QuizRunnerScreen(
      title: 'Prueba',
      questions: [question('a'), question('b')],
      onCompleted: () => completed++,
    )));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    for (final id in ['a', 'b']) {
      final order = tester
          .widgetList<ImageOptionCard>(find.byType(ImageOptionCard))
          .map((card) => card.option.id)
          .toList();
      await tester.tap(find.text('Correcta $id'));
      await tester.pump();
      expect(
          tester
              .widgetList<ImageOptionCard>(find.byType(ImageOptionCard))
              .map((card) => card.option.id)
              .toList(),
          order);
      await tester.tap(find.text('Comprobar Respuesta'));
      await tester.pumpAndSettle();
      if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
        await tester.ensureVisible(find.text('Empezar preguntas'));
        await tester.tap(find.text('Empezar preguntas'));
        await tester.pumpAndSettle();
      }
      expect(completed, 0);
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
        await tester.ensureVisible(find.text('Empezar preguntas'));
        await tester.tap(find.text('Empezar preguntas'));
        await tester.pumpAndSettle();
      }
    }
    expect(completed, 1);
    expect(find.textContaining('2 de 2 respuestas correctas (100%)'),
        findsOneWidget);
    expect(ProgressProvider().progress.quizScores, {'a': 100, 'b': 100});
    await tester.tap(find.text('Reintentar Quiz'));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    expect(find.text('Pregunta a'), findsOneWidget);
    expect(find.text('Correcta a'), findsOneWidget);
    expect(find.text('Correcta b'), findsNothing);
    await tester.tap(find.text('Correcta a'));
    await tester.pump();
    await tester.tap(find.text('Comprobar Respuesta'));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    expect(find.text('Continuar'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox.shrink());
  });

  testWidgets('Completing the real visual quiz unlocks the next topic',
      (tester) async {
    tester.view.physicalSize = const Size(430, 1100);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await ProgressProvider().markRoadmapStepCompleted('step_baseline');
    await tester.pumpWidget(MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                  body: TextButton(
                      onPressed: () => RoadmapDatabase.navigateToDestination(
                          context, RoadmapDestination.visualQuiz,
                          roadmapStepId: 'step_first_quiz'),
                      child: const Text('Empezar')),
                ))));
    await tester.tap(find.text('Empezar'));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    final questions = QuizDatabase.getImageCardQuestions();
    expect(questions, isNotEmpty);
    for (final question in questions) {
      expect(ProgressProvider().progress.completedRoadmapStepIds,
          isNot(contains('step_first_quiz')));
      final correct = question.options.firstWhere((option) => option.isCorrect);
      final optionFinder = find.byWidgetPredicate((widget) =>
          widget is ImageOptionCard && widget.option.id == correct.id);
      await tester.scrollUntilVisible(optionFinder, 180,
          scrollable: find.byType(Scrollable).first);
      await tester.pumpAndSettle();
      await tester.ensureVisible(optionFinder);
      await tester.pumpAndSettle();
      await tester.tap(optionFinder);
      await tester.pump();
      await tester.tap(find.text('Comprobar Respuesta'));
      await tester.pumpAndSettle();
      if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
        await tester.ensureVisible(find.text('Empezar preguntas'));
        await tester.tap(find.text('Empezar preguntas'));
        await tester.pumpAndSettle();
      }
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
        await tester.ensureVisible(find.text('Empezar preguntas'));
        await tester.tap(find.text('Empezar preguntas'));
        await tester.pumpAndSettle();
      }
    }
    expect(find.textContaining('(100%)'), findsOneWidget);
    await tester.tap(find.text('Continuar ruta'));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    ProgressProvider().loadProgress();
    expect(RoadmapDatabase.getCurrentActiveStep(ProgressProvider().progress).id,
        'step_eyes');
    expect(find.text('Empezar'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
      'Back does not complete reading or quiz; explicit completion unlocks and persists',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                  body: Column(children: [
                    TextButton(
                        onPressed: () => RoadmapDatabase.navigateToDestination(
                            context, RoadmapDestination.clusterBaseline,
                            roadmapStepId: 'step_baseline'),
                        child: const Text('Leer tema')),
                    TextButton(
                        onPressed: () => RoadmapDatabase.navigateToDestination(
                            context, RoadmapDestination.visualQuiz,
                            roadmapStepId: 'step_first_quiz'),
                        child: const Text('Abrir quiz')),
                  ]),
                ))));
    await tester.tap(find.text('Leer tema'));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    await tester.pageBack();
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    expect(ProgressProvider().progress.completedRoadmapStepIds, isEmpty);
    await tester.tap(find.text('Abrir quiz'));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    await tester.pageBack();
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    expect(ProgressProvider().progress.completedRoadmapStepIds, isEmpty);
    await tester.tap(find.text('Leer tema'));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('Completar tema y volver a la ruta'));
    await tester.pumpAndSettle();
    if (find.text('Empezar preguntas').evaluate().isNotEmpty) {
      await tester.ensureVisible(find.text('Empezar preguntas'));
      await tester.tap(find.text('Empezar preguntas'));
      await tester.pumpAndSettle();
    }
    ProgressProvider().loadProgress();
    expect(
        ProgressProvider().progress.completedRoadmapStepIds, ['step_baseline']);
    expect(RoadmapDatabase.getCurrentActiveStep(ProgressProvider().progress).id,
        'step_first_quiz');
    expect(tester.takeException(), isNull);
  });
}
