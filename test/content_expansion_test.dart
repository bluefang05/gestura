import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestura/data/gesture_database.dart';
import 'package:gestura/data/gesture_expansion.dart';
import 'package:gestura/data/quiz_database.dart';
import 'package:gestura/data/quiz_expansion.dart';
import 'package:gestura/data/scenario_database.dart';
import 'package:gestura/data/scenario_expansion.dart';
import 'package:gestura/data/social_scripts_database.dart';
import 'package:gestura/data/social_scripts_expansion.dart';
import 'package:gestura/models/category.dart';
import 'package:gestura/models/social_script.dart';
import 'package:gestura/models/user_progress.dart';
import 'package:gestura/screens/communication_guide_screen.dart';

void main() {
  test('Expanded catalog includes every new record with unique identifiers',
      () {
    expect(GestureDatabase.items.length, 90);
    expect(QuizDatabase.questions.length, 93);
    expect(ScenarioDatabase.scenarios.length, 27);
    for (final ids in [
      GestureDatabase.items.map((g) => g.id),
      QuizDatabase.questions.map((q) => q.id),
      ScenarioDatabase.scenarios.map((s) => s.id),
      SocialScriptsDatabase.scripts.map((s) => s.id),
    ]) {
      expect(ids.toSet().length, ids.length);
    }
    expect(SocialScriptsDatabase.scripts,
        containsAll(SocialScriptsExpansion.scripts));
  });

  test('Every category adds four contextual signals and eight exercises', () {
    for (final category in CategoryType.values) {
      expect(GestureExpansion.items.where((g) => g.category == category).length,
          4);
      expect(
          QuizExpansion.questions.where((q) => q.category == category).length,
          8);
    }
    for (final gesture in GestureExpansion.items) {
      expect(gesture.alternativeMeanings.length, greaterThanOrEqualTo(2));
      expect(gesture.whatToDo, isNotEmpty);
      expect(gesture.contextGuidance, isNotEmpty);
      final linked = QuizExpansion.questions
          .where((q) => q.id.startsWith('q_${gesture.id}_'));
      expect(linked.length, 2);
    }
  });

  test(
      'Questions have one correct answer, varied positions and distinct choices',
      () {
    final positions = <int>{};
    for (final question in QuizExpansion.questions) {
      expect(question.options.where((o) => o.isCorrect).length, 1);
      expect(question.options.map((o) => o.id).toSet().length,
          question.options.length);
      expect(question.options.map((o) => o.text).toSet().length,
          question.options.length);
      expect(question.scenarioText, isNotEmpty);
      expect(question.keyVisualClue, isNotEmpty);
      expect(question.explanation, isNotEmpty);
      positions.add(question.options.indexWhere((o) => o.isCorrect));
    }
    expect(positions, {0, 1, 2});
  });

  test('New scenarios have reachable steps and terminate without cycles', () {
    for (final scenario in ScenarioExpansion.scenarios) {
      expect(scenario.steps.length, 2);
      expect(scenario.steps.map((s) => s.id).toSet().length,
          scenario.steps.length);
      for (var i = 0; i < scenario.steps.length; i++) {
        final step = scenario.steps[i];
        expect(step.choices.where((c) => c.isBestAction).length, 1);
        expect(step.learningTakeaway, isNotEmpty);
        for (final choice in step.choices) {
          expect(choice.analysis, isNotEmpty);
          expect(choice.consequenceSummary, isNotEmpty);
          if (i == scenario.steps.length - 1) {
            expect(choice.nextStepIndex, isNull);
          } else {
            expect(choice.nextStepIndex, i + 1);
          }
        }
      }
    }
  });

  test('New social scripts provide three distinct usable phrases', () {
    expect(SocialScriptsExpansion.scripts.length, 12);
    for (final script in SocialScriptsExpansion.scripts) {
      final phrases =
          ScriptFirmness.values.map(script.getPhraseByFirmness).toSet();
      expect(phrases.length, 3);
      expect(phrases.every((p) => p.trim().isNotEmpty), isTrue);
      expect(script.bodyLanguage, isNotEmpty);
      expect(script.whatNotToDo, isNotEmpty);
    }
  });

  test('Expanded mastery uses the entire catalog and preserves stored records',
      () {
    expect(UserProgress.totalPossibleMilestones, 210);
    final complete = UserProgress(
      exploredGestureIds: GestureDatabase.items.map((g) => g.id).toList(),
      completedQuizIds: QuizDatabase.questions.map((q) => q.id).toList(),
      completedScenarioIds:
          ScenarioDatabase.scenarios.map((s) => s.id).toList(),
    );
    expect(complete.masteryPercentage, 100);
    final restored = UserProgress.fromJson(complete.toJson());
    expect(restored.masteryPercentage, 100);
    expect(restored.exploredGestureIds, complete.exploredGestureIds);
    expect(restored.completedQuizIds, complete.completedQuizIds);
  });

  testWidgets('Guide opens lessons and shows the practical exercise',
      (tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: CommunicationGuideScreen()));
    expect(find.text('Observa, pregunta y ajusta'), findsOneWidget);
    await tester.tap(find.text('1. Describe antes de interpretar'));
    await tester.pumpAndSettle();
    expect(find.text(CommunicationGuideScreen.lessons.first.exercise),
        findsOneWidget);
    expect(CommunicationGuideScreen.lessons.length, 8);
    expect(
        CommunicationGuideScreen.sources
            .every((s) => Uri.parse(s.url).scheme == 'https'),
        isTrue);
    expect(tester.takeException(), isNull);
  });
}
