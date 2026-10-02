import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/data/gesture_database.dart';
import 'package:gestura/data/quiz_database.dart';
import 'package:gestura/models/user_progress.dart';
import 'package:gestura/models/quiz_question.dart';
import 'package:gestura/data/roadmap_database.dart';
import 'package:gestura/screens/dictionary_screen.dart';
import 'package:gestura/screens/quiz_runner_screen.dart';
import 'package:gestura/state/progress_provider.dart';
import 'package:gestura/state/settings_provider.dart';
import 'package:gestura/widgets/dictionary/gesture_card.dart';
import 'package:gestura/widgets/quiz/personal_practice_card.dart';
import 'package:gestura/widgets/common/badge_pill.dart';
import 'package:gestura/core/utils/contrast_utils.dart';
import 'package:gestura/core/theme/app_theme.dart';

void main() {
  testWidgets('Manual fits narrow screens with enlarged text', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(2)),
        child: child!,
      ),
      home: const DictionaryScreen(),
    ));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('Badges meet AA contrast on light and dark surfaces',
      (tester) async {
    for (final theme in [AppTheme.lightTheme, AppTheme.darkTheme]) {
      for (final color in [
        Colors.teal,
        Colors.orange,
        Colors.purple,
        Colors.red
      ]) {
        await tester.pumpWidget(MaterialApp(
            theme: theme,
            home: Scaffold(body: BadgePill(text: 'Señal', color: color))));
        final foreground =
            tester.widget<Text>(find.text('Señal')).style!.color!;
        final container = tester.widget<Container>(find
            .descendant(
                of: find.byType(BadgePill), matching: find.byType(Container))
            .first);
        final background = (container.decoration! as BoxDecoration).color!;
        expect(ContrastUtils.isWcagAa(foreground, background), isTrue);
      }
    }
  });

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    SettingsProvider().loadSettings();
    ProgressProvider().loadProgress();
    await SettingsProvider().setSoundEffectsEnabled(false);
  });

  test('Search accepts accents, combining accents and multiple terms', () {
    final accented =
        GestureDatabase.search('tensión').map((g) => g.id).toList();
    expect(accented, isNotEmpty);
    expect(GestureDatabase.search(' TENSION ').map((g) => g.id), accented);
    expect(GestureDatabase.search('tensio\u0301n').map((g) => g.id), accented);
    final first = GestureDatabase.items.first;
    expect(GestureDatabase.search('${first.name}  ${first.bodyPart}'),
        contains(first));
    expect(GestureDatabase.search('zzzzzzzz'), isEmpty);
  });

  test('Reading progress does not award an activity day or points', () {
    expect(ProgressProvider().progress.currentStreak, 0);
    expect(ProgressProvider().progress.totalPoints, 0);
    expect(ProgressProvider().progress.lastActiveDate, isEmpty);
  });

  test('Revisiting a signal records activity without duplicating it', () {
    final progress = const UserProgress(
      exploredGestureIds: ['signal'],
      lastActiveDate: '2020-01-01',
    ).markGestureExplored('signal');
    expect(progress.exploredGestureIds, ['signal']);
    expect(progress.currentStreak, 1);
    expect(progress.lastActiveDate, isNot('2020-01-01'));
  });

  test('Scores remain percentages and retries replace the previous result', () {
    final progress = UserProgress.initial()
        .recordQuizResult('q', 120)
        .recordQuizResult('q', -10);
    expect(progress.completedQuizIds, ['q']);
    expect(progress.averageQuizAccuracy, 0);
    expect(
        UserProgress.initial().recordQuizResult('q', 120).averageQuizAccuracy,
        100);
  });

  test('Quiz options can move the correct answer from its source position', () {
    final question = QuizDatabase.questions.first;
    final sourceCorrectIndex =
        question.options.indexWhere((option) => option.isCorrect);
    final displayedCorrectIndices = List.generate(12, (seed) {
      return shuffledQuizOptions(question, Random(seed))
          .indexWhere((option) => option.isCorrect);
    }).toSet();

    expect(displayedCorrectIndices.length, greaterThan(1));
    expect(displayedCorrectIndices, isNot({sourceCorrectIndex}));
    for (var seed = 0; seed < 12; seed++) {
      final options = shuffledQuizOptions(question, Random(seed));
      expect(options.map((option) => option.id).toSet(),
          question.options.map((option) => option.id).toSet());
      expect(options.where((option) => option.isCorrect).length, 1);
    }
  });

  test('Completing a roadmap lesson advances and survives saved progress', () {
    final progress =
        const UserProgress().markRoadmapStepCompleted('step_baseline');
    final restored = UserProgress.fromJson(progress.toJson());

    expect(restored.completedRoadmapStepIds, ['step_baseline']);
    expect(
        RoadmapDatabase.getCurrentActiveStep(restored).id, 'step_first_quiz');
  });

  test('Partially invalid stored progress preserves usable records', () {
    final progress = UserProgress.fromJson({
      'currentStreak': -2,
      'bestStreak': 'bad',
      'exploredGestureIds': ['a', 'a', null, 42],
      'completedScenarioIds': ['s'],
      'quizScores': {'q': 120.0, 'broken': 'bad'},
    });
    expect(progress.exploredGestureIds, ['a']);
    expect(progress.completedScenarioIds, ['s']);
    expect(progress.quizScores, {'q': 100});
    expect(progress.currentStreak, 0);
  });

  testWidgets('Saved filter shows bookmarks and reacts to external changes',
      (tester) async {
    final gesture = GestureDatabase.items.first;
    await ProgressProvider().toggleBookmark(gesture.id);
    await tester.pumpWidget(const MaterialApp(home: DictionaryScreen()));
    await tester.tap(find.byTooltip('Ver Guardados'));
    await tester.pumpAndSettle();
    expect(find.byType(GestureCard), findsOneWidget);
    expect(tester.widget<GestureCard>(find.byType(GestureCard)).item.id,
        gesture.id);
    await ProgressProvider().toggleBookmark(gesture.id);
    await tester.pumpAndSettle();
    expect(find.text('Tus señales favoritas, a mano'), findsOneWidget);
    await tester.tap(find.text('Ver todas las señales'));
    await tester.pumpAndSettle();
    expect(find.byType(GestureCard), findsWidgets);
  });

  testWidgets('Unexplored filter excludes read signals and can be cleared',
      (tester) async {
    await ProgressProvider()
        .markGestureExplored(GestureDatabase.items.first.id);
    await tester.pumpWidget(const MaterialApp(home: DictionaryScreen()));
    await tester.tap(find.text('Por explorar'));
    await tester.pumpAndSettle();
    expect(find.text('${GestureDatabase.items.length - 1} señales'),
        findsOneWidget);
    await tester.tap(find.text('Limpiar filtros'));
    await tester.pumpAndSettle();
    expect(
        find.text('${GestureDatabase.items.length} señales'), findsOneWidget);
  });

  testWidgets('Personal practice targets mistakes and updates after correction',
      (tester) async {
    final question = QuizDatabase.questions.first;
    await ProgressProvider().recordQuizResult(question.id, 0);
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: PersonalPracticeCard())));
    expect(find.text('Repasar errores'), findsOneWidget);
    await tester.tap(find.text('Repasar errores'));
    await tester.pumpAndSettle();
    final runner =
        tester.widget<QuizRunnerScreen>(find.byType(QuizRunnerScreen));
    expect(runner.questions.map((q) => q.id), [question.id]);
    await ProgressProvider().recordQuizResult(question.id, 100);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Tu siguiente paso'), findsOneWidget);
  });

  testWidgets('Empty quiz is safe with automatic narration enabled',
      (tester) async {
    await StorageService.setAutoNarration(true);
    await tester.pumpWidget(const MaterialApp(
        home: QuizRunnerScreen(title: 'Vacío', questions: [])));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.text('No hay preguntas disponibles.'), findsOneWidget);
  });
}
