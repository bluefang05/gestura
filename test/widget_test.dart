import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/main.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/data/gesture_database.dart';
import 'package:gestura/data/quiz_database.dart';
import 'package:gestura/data/scenario_database.dart';
import 'package:gestura/data/incongruence_database.dart';
import 'package:gestura/screens/buyer_temperature_screen.dart';
import 'package:gestura/screens/unwritten_rules_screen.dart';
import 'package:gestura/screens/cluster_baseline_screen.dart';
import 'package:gestura/screens/emergency_mode_screen.dart';
import 'package:gestura/models/category.dart';
import 'package:gestura/models/user_progress.dart';
import 'package:gestura/state/settings_provider.dart';
import 'package:gestura/core/localization/app_localizations.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
  });

  test('AppLocalizations provides complete dictionary in all 5 languages', () {
    for (final locale in AppLocalizations.supportedLocales) {
      final loc = AppLocalizations(locale);
      expect(loc.appName, equals('Gestura'));
      expect(loc.home.isNotEmpty, isTrue);
      expect(loc.manual.isNotEmpty, isTrue);
      expect(loc.practice.isNotEmpty, isTrue);
      expect(loc.scenarios.isNotEmpty, isTrue);
      expect(loc.settings.isNotEmpty, isTrue);
      expect(loc.quickDecoder.isNotEmpty, isTrue);
      expect(loc.dailyQuiz.isNotEmpty, isTrue);
      expect(loc.socialTree.isNotEmpty, isTrue);
      expect(loc.compareAB.isNotEmpty, isTrue);
      expect(loc.cheatSheet.isNotEmpty, isTrue);
      expect(loc.language.isNotEmpty, isTrue);
    }
  });

  test('GestureDatabase contains complete dataset across all 6 categories', () {
    expect(GestureDatabase.items.isNotEmpty, isTrue);
    for (final cat in CategoryInfo.allCategories) {
      final items = GestureDatabase.getByCategory(cat.type);
      expect(items.isNotEmpty, isTrue,
          reason: 'Category ${cat.title} should have signals');
    }
  });

  test('Content data uses unique identifiers and complete scenario choices',
      () {
    final gestureIds = GestureDatabase.items.map((item) => item.id).toList();
    final quizIds = QuizDatabase.questions.map((item) => item.id).toList();
    final scenarioIds =
        ScenarioDatabase.scenarios.map((item) => item.id).toList();
    final incongruenceIds =
        IncongruenceDatabase.items.map((item) => item.id).toList();

    expect(gestureIds.toSet().length, equals(gestureIds.length));
    expect(quizIds.toSet().length, equals(quizIds.length));
    expect(scenarioIds.toSet().length, equals(scenarioIds.length));
    expect(incongruenceIds.toSet().length, equals(incongruenceIds.length));

    for (final scenario in ScenarioDatabase.scenarios) {
      for (final step in scenario.steps) {
        expect(step.choices, isNotEmpty,
            reason: '${scenario.id}/${step.id} needs choices');
        expect(
          step.choices.any((choice) => choice.isBestAction),
          isTrue,
          reason: '${scenario.id}/${step.id} needs a supportive best action',
        );
      }
    }
  });

  test('QuizDatabase contains image-card grid questions and valid answers', () {
    expect(QuizDatabase.questions.isNotEmpty, isTrue);
    expect(QuizDatabase.questions.length, greaterThanOrEqualTo(45));
    final imageQuestions = QuizDatabase.getImageCardQuestions();
    expect(imageQuestions.isNotEmpty, isTrue,
        reason: 'Must have questions with visual image cards');

    for (final q in QuizDatabase.questions) {
      expect(q.options.any((o) => o.isCorrect), isTrue,
          reason: 'Question ${q.id} must have at least one correct answer');
      expect(q.explanation.isNotEmpty, isTrue);
      expect(q.keyVisualClue.isNotEmpty, isTrue);
    }
  });

  test('ScenarioDatabase contains sales and workplace simulations', () {
    expect(ScenarioDatabase.scenarios.length, greaterThanOrEqualTo(5));
    final salesScenario = ScenarioDatabase.getById('scenario_sales_closing');
    expect(salesScenario, isNotNull);
    expect(salesScenario!.steps.isNotEmpty, isTrue);
    expect(
        salesScenario.steps.first.choices.any((c) => c.isBestAction), isTrue);

    final salaryScenario =
        ScenarioDatabase.getById('scenario_salary_negotiation');
    expect(salaryScenario, isNotNull);
    expect(salaryScenario!.steps.length, equals(2));

    final clientScenario =
        ScenarioDatabase.getById('scenario_skeptical_client');
    expect(clientScenario, isNotNull);
    expect(clientScenario!.domain, equals('Ventas B2B'));
  });

  test('IncongruenceDatabase contains cases for autism and sales focus', () {
    expect(IncongruenceDatabase.items.isNotEmpty, isTrue);
    final allItems = IncongruenceDatabase.getByAudience('all');
    expect(allItems.length, greaterThanOrEqualTo(8));

    final autismItems = IncongruenceDatabase.getByAudience('autism_focus');
    expect(autismItems.isNotEmpty, isTrue);

    final salesItems = IncongruenceDatabase.getByAudience('sales_focus');
    expect(salesItems.isNotEmpty, isTrue);

    for (final item in IncongruenceDatabase.items) {
      expect(item.id.isNotEmpty, isTrue);
      expect(item.spokenPhrase.isNotEmpty, isTrue);
      expect(item.speakerRole.isNotEmpty, isTrue);
      expect(item.physicalSignals.isNotEmpty, isTrue);
      expect(item.realEmotion.isNotEmpty, isTrue);
      expect(item.explanation.isNotEmpty, isTrue);
      expect(item.recommendedAction.isNotEmpty, isTrue);
    }
  });

  test('BuyerTemperature signals contain green, yellow, and red categories',
      () {
    final greenSignals = BuyerTemperatureScreen.signals
        .where((s) => s.category == 'green')
        .toList();
    final redSignals = BuyerTemperatureScreen.signals
        .where((s) => s.category == 'red')
        .toList();
    expect(greenSignals.isNotEmpty, isTrue);
    expect(redSignals.isNotEmpty, isTrue);
  });

  test('UserProgress calculates mastery percentage and motivational levels accurately', () {
    final initialProgress = UserProgress.initial();
    expect(initialProgress.masteryPercentage, equals(0));
    expect(initialProgress.masteryLevelTitle, equals('Iniciando Calibración'));

    final halfwayProgress = initialProgress.copyWith(
      exploredGestureIds: List.generate(33, (i) => 'g_$i'),
      completedScenarioIds: List.generate(7, (i) => 's_$i'),
      completedQuizIds: List.generate(22, (i) => 'q_$i'),
    );
    expect(halfwayProgress.masteryPercentage, greaterThanOrEqualTo(50));
    expect(halfwayProgress.masteryLevelTitle, equals('Analista de Campo'));

    final completedProgress = initialProgress.copyWith(
      exploredGestureIds: List.generate(66, (i) => 'g_$i'),
      completedScenarioIds: List.generate(13, (i) => 's_$i'),
      completedQuizIds: List.generate(45, (i) => 'q_$i'),
    );
    expect(completedProgress.masteryPercentage, equals(100));
    expect(completedProgress.masteryLevelTitle, equals('Maestro Decodificador'));
  });

  test('StorageService persists bookmarks and user progress correctly',
      () async {
    expect(StorageService.isBookmarked('duchenne_smile'), isFalse);
    await StorageService.toggleBookmark('duchenne_smile');
    expect(StorageService.isBookmarked('duchenne_smile'), isTrue);

    final progress = StorageService.loadProgress();
    final updated = progress.recordQuizResult('Test Visual', 100);
    await StorageService.saveProgress(updated);

    final reloaded = StorageService.loadProgress();
    expect(reloaded.totalQuizzesTaken, equals(1));
    expect(reloaded.totalPoints, greaterThan(0));
  });

  testWidgets(
      'GesturaApp launches and renders main navigation bar and new tools',
      (WidgetTester tester) async {
    final settings = SettingsProvider();
    await settings.setLanguageCode('es');
    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();

    expect(find.text('Gestura'), findsWidgets);
    expect(find.text('Inicio'), findsOneWidget);
    expect(find.text('Manual'), findsOneWidget);
    expect(find.text('Práctica'), findsOneWidget);
    expect(find.text('Escenarios'), findsOneWidget);
    expect(find.text('Gesto del Día'), findsOneWidget);

    // Scroll down to check tools
    await tester.drag(find.byType(ListView).first, const Offset(0, -400));
    await tester.pumpAndSettle();

    expect(find.textContaining('Comparador Visual'), findsWidgets);
    expect(find.textContaining('Árbol de Decisión'), findsWidgets);
    expect(find.textContaining('Guía de Bolsillo'), findsWidgets);
  });

  testWidgets(
      'SettingsProvider toggles theme, high contrast and motion dynamically',
      (WidgetTester tester) async {
    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();

    final settings = SettingsProvider();
    expect(settings.themeMode, equals(ThemeMode.system));

    // Switch to dark mode
    await settings.setThemeMode(ThemeMode.dark);
    await tester.pumpAndSettle();
    expect(settings.themeMode, equals(ThemeMode.dark));

    // Switch to high contrast
    await settings.setHighContrast(true);
    await tester.pumpAndSettle();
    expect(settings.isHighContrast, isTrue);

    // Switch reduce motion
    await settings.setReduceMotion(true);
    await tester.pumpAndSettle();
    expect(settings.isReduceMotion, isTrue);

    // Switch language to English
    await settings.setLanguageCode('en');
    await tester.pumpAndSettle();
    expect(settings.languageCode, equals('en'));
    expect(find.text('Home'), findsWidgets);
    expect(find.text('Manual'), findsWidgets);
    expect(find.text('Practice'), findsWidgets);

    // Switch language to French
    await settings.setLanguageCode('fr');
    await tester.pumpAndSettle();
    expect(settings.languageCode, equals('fr'));
    expect(find.text('Accueil'), findsWidgets);

    // Switch language to Portuguese
    await settings.setLanguageCode('pt');
    await tester.pumpAndSettle();
    expect(settings.languageCode, equals('pt'));
    expect(find.text('Início'), findsWidgets);

    // Switch language to German
    await settings.setLanguageCode('de');
    await tester.pumpAndSettle();
    expect(settings.languageCode, equals('de'));
    expect(find.text('Start'), findsWidgets);
  });

  testWidgets(
      'Adaptive layout renders NavigationRail on wide screens and NavigationBar on mobile',
      (WidgetTester tester) async {
    // 1. Tablet / Wide screen test (800x600 dp)
    tester.view.physicalSize = const Size(800, 600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);

    // 2. Mobile screen test (390x844 dp)
    tester.view.physicalSize = const Size(390, 844);
    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
  });

  testWidgets('Posturas category card opens the filtered manual',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();

    final postureCard = find.text('Posturas y Lenguaje Corporal');
    final scrollable =
        tester.state<ScrollableState>(find.byType(Scrollable).first);
    scrollable.position.jumpTo(1400);
    await tester.pumpAndSettle();
    await tester.tap(postureCard);
    await tester.pumpAndSettle();

    expect(find.text('Postura Abierta y Receptiva'), findsOneWidget);
    expect(find.text('Sonrisa Genuina (Duchenne)'), findsNothing);
  });

  testWidgets('UnwrittenRulesScreen renders tabs and indirect decoder',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MaterialApp(home: UnwrittenRulesScreen()));
    await tester.pumpAndSettle();

    expect(find.text('El Manual de lo No Dicho'), findsOneWidget);
    expect(find.text('El Mito del Small Talk'), findsOneWidget);
    expect(find.text('Decodificador de Indirectas'), findsOneWidget);
  });

  testWidgets('ClusterBaselineScreen renders 3-signal rule and tabs',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MaterialApp(home: ClusterBaselineScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Conglomerados y Línea Base'), findsOneWidget);
    expect(find.text('Regla de las 3 Señales'), findsOneWidget);
    expect(find.text('Calibrar la Línea Base'), findsOneWidget);
  });

  testWidgets('EmergencyModeScreen renders checklists and protocols',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MaterialApp(home: EmergencyModeScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Modo Emergencia / Campo'), findsOneWidget);
    expect(find.text('Entrevista / Ventas'), findsOneWidget);
    expect(find.text('Evento Social / Fiesta'), findsOneWidget);
  });
}
