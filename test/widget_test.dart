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
import 'package:gestura/state/progress_provider.dart';
import 'package:gestura/core/localization/app_localizations.dart';
import 'package:gestura/core/constants/app_colors.dart';
import 'package:gestura/core/services/tts_service.dart';
import 'package:gestura/core/services/ads/ad_ids.dart';
import 'package:gestura/core/utils/contrast_utils.dart';
import 'package:gestura/data/social_scripts_database.dart';
import 'package:gestura/models/social_script.dart';
import 'package:gestura/data/sales_pipeline_database.dart';
import 'package:gestura/data/boundary_framework_database.dart';
import 'package:gestura/data/roadmap_database.dart';
import 'package:gestura/models/roadmap_step.dart';
import 'package:gestura/widgets/home/mastery_progress_card.dart';
import 'package:gestura/screens/progress_screen.dart';
import 'package:gestura/screens/scenarios_screen.dart';
import 'package:gestura/screens/incongruence_detector_screen.dart';
import 'package:gestura/screens/gesture_detail_screen.dart';
import 'package:gestura/widgets/dictionary/gesture_card.dart';
import 'package:gestura/screens/scenario_runner_screen.dart';
import 'package:gestura/screens/decision_tree_screen.dart';
import 'package:gestura/screens/cheat_sheet_screen.dart';
import 'package:gestura/screens/quiz_runner_screen.dart';
import 'package:gestura/core/constants/app_constants.dart';
import 'package:gestura/models/scenario.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
  });

  test('AppLocalizations provides interface dictionaries for all 6 variants',
      () {
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
    expect(ScenarioDatabase.scenarios.length, greaterThanOrEqualTo(27));
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

    final boundaryScenario =
        ScenarioDatabase.getById('scenario_assertive_boundaries_work');
    expect(boundaryScenario, isNotNull);
    expect(boundaryScenario!.domain, equals('Límites'));
    expect(boundaryScenario.steps.length, equals(2));
    expect(boundaryScenario.steps.first.choices.any((c) => c.isBestAction),
        isTrue);

    final consentScenario =
        ScenarioDatabase.getById('scenario_consent_decoding_fawning');
    expect(consentScenario, isNotNull);
    expect(consentScenario!.domain, equals('Límites & Consentimiento'));
    expect(consentScenario.steps.length, equals(2));
    expect(
        consentScenario.steps.first.choices.any((c) => c.isBestAction), isTrue);
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
      expect(item.possibleInterpretations.length, greaterThanOrEqualTo(2));
      expect(item.relationship, isNotNull);
      expect(item.explanation.isNotEmpty, isTrue);
      expect(item.recommendedAction.isNotEmpty, isTrue);
    }
  });

  test('Sales observations use descriptive categories', () {
    final categories =
        BuyerTemperatureScreen.signals.map((s) => s.category).toSet();
    expect(categories, equals({'openness', 'ambiguous', 'tension'}));
    for (final id in [
      'steepling',
      'crossed_arms',
      'neck_touch',
      'finger_tap',
      'lean_back_distance'
    ]) {
      expect(
          BuyerTemperatureScreen.signals.firstWhere((s) => s.id == id).category,
          'ambiguous',
          reason: id);
    }
  });

  test(
      'UserProgress calculates mastery percentage and motivational levels accurately',
      () {
    final initialProgress = UserProgress.initial();
    expect(initialProgress.masteryPercentage, equals(0));
    expect(initialProgress.masteryLevelTitle, equals('Primeros pasos'));

    final halfwayProgress = initialProgress.copyWith(
      exploredGestureIds: GestureDatabase.items
          .take((GestureDatabase.items.length / 2).ceil())
          .map((g) => g.id)
          .toList(),
      completedScenarioIds: ScenarioDatabase.scenarios
          .take((ScenarioDatabase.scenarios.length / 2).ceil())
          .map((s) => s.id)
          .toList(),
      completedQuizIds: QuizDatabase.questions
          .take((QuizDatabase.questions.length / 2).ceil())
          .map((q) => q.id)
          .toList(),
    );
    expect(halfwayProgress.masteryPercentage, greaterThanOrEqualTo(50));
    expect(halfwayProgress.masteryLevelTitle, equals('Vas por la mitad'));

    final completedProgress = initialProgress.copyWith(
      exploredGestureIds: GestureDatabase.items.map((g) => g.id).toList(),
      completedScenarioIds:
          ScenarioDatabase.scenarios.map((s) => s.id).toList(),
      completedQuizIds: QuizDatabase.questions.map((q) => q.id).toList(),
    );
    expect(completedProgress.masteryPercentage, equals(100));
    expect(completedProgress.masteryLevelTitle, equals('Recorrido completo'));
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
    expect(find.text('Comunicar ahora'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Gesto del Día'), 200,
        scrollable: find.byType(Scrollable).first);
    expect(find.text('Gesto del Día'), findsOneWidget);

    // Scroll down to check tools
    await tester.scrollUntilVisible(
        find.textContaining('Comparador Visual'), 200,
        scrollable: find.byType(Scrollable).first);
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

    final postureCard = find.text('Posturas y movimientos');
    await tester.scrollUntilVisible(postureCard, 300,
        scrollable: find.byType(Scrollable).first);
    await tester.pumpAndSettle();
    await tester.tap(postureCard);
    await tester.pumpAndSettle();

    expect(find.text('Postura con brazos y torso despejados'), findsOneWidget);
    expect(find.text('Sonrisa Genuina (Duchenne)'), findsNothing);
  });

  testWidgets('UnwrittenRulesScreen renders tabs and indirect decoder',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MaterialApp(home: UnwrittenRulesScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Situaciones sociales cotidianas'), findsOneWidget);
    expect(find.text('Conversaciones breves'), findsOneWidget);
    expect(find.text('Frases con doble sentido'), findsOneWidget);
  });

  testWidgets('Observation lesson renders plain-language tabs',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MaterialApp(home: ClusterBaselineScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Gestos y forma habitual de expresarse'), findsOneWidget);
    expect(find.text('Observar y preguntar'), findsOneWidget);
    expect(find.text('Forma habitual de expresarse'), findsOneWidget);
  });

  testWidgets('EmergencyModeScreen renders checklists and protocols',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const MaterialApp(home: EmergencyModeScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Ayuda rápida'), findsOneWidget);
    expect(find.text('Trabajo'), findsOneWidget);
    expect(find.text('Encuentros'), findsOneWidget);
    await tester.tap(find.text('Pedir una pausa'));
    await tester.pumpAndSettle();

    expect(find.text('Puedes pausar la conversación'), findsOneWidget);
    await tester.scrollUntilVisible(
        find.text('Elige cuánto tiempo necesitas'), 200);
    expect(find.text('Elige cuánto tiempo necesitas'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  test('AppLocalizations maintains 100% key symmetry across all 5 languages',
      () {
    final translations = AppLocalizations.translations;
    final esKeys = translations['es']!.keys.toSet();

    for (final lang in ['en', 'fr', 'pt', 'de']) {
      final langKeys = translations[lang]!.keys.toSet();
      final missingKeys = esKeys.difference(langKeys);
      expect(missingKeys, isEmpty,
          reason: 'Language $lang is missing keys: $missingKeys');
    }
  });

  test(
      'StorageService.clearProgress resets progress while preserving preferences and bookmarks',
      () async {
    // 1. Arrange: populate progress and user preferences
    final initialBookmarksCount = StorageService.getBookmarks().length;
    await StorageService.toggleBookmark('ojos_contacto_visual');
    await StorageService.toggleBookmark('brazos_cruzados');
    await StorageService.setLanguage('pt');
    await StorageService.setThemeMode('dark');
    await StorageService.setSpeechRate(0.75);
    await StorageService.setReduceMotion(true);
    await StorageService.setSoundEffectsEnabled(false);

    final progress = const UserProgress(
      currentStreak: 7,
      bestStreak: 7,
      lastActiveDate: '2026-09-04',
      completedQuizIds: ['q1', 'q2'],
      completedScenarioIds: ['s1'],
      exploredGestureIds: ['g1', 'g2', 'g3'],
    );
    await StorageService.saveProgress(progress);

    // Verify initial values
    expect(StorageService.getBookmarks().length,
        equals(initialBookmarksCount + 2));
    expect(StorageService.loadProgress().totalPoints, greaterThan(0));
    expect(StorageService.getLanguage(), equals('pt'));
    expect(StorageService.getSpeechRate(), equals(0.75));

    // 2. Act: Clear only training progress
    await StorageService.clearProgress();

    // 3. Assert: Progress is completely reset to initial
    final clearedProgress = StorageService.loadProgress();
    expect(clearedProgress.completedQuizIds, isEmpty);
    expect(clearedProgress.completedScenarioIds, isEmpty);
    expect(clearedProgress.exploredGestureIds, isEmpty);

    // Bookmarks and preferences MUST remain intact
    expect(StorageService.getBookmarks().length,
        equals(initialBookmarksCount + 2));
    expect(StorageService.getBookmarks(), contains('ojos_contacto_visual'));
    expect(StorageService.getBookmarks(), contains('brazos_cruzados'));
    expect(StorageService.getLanguage(), equals('pt'));
    expect(StorageService.getThemeMode(), equals('dark'));
    expect(StorageService.getSpeechRate(), equals(0.75));
    expect(StorageService.getReduceMotion(), isTrue);
    expect(StorageService.getSoundEffectsEnabled(), isFalse);
  });

  test('ProgressProvider resetProgress notifies listeners and resets metrics',
      () async {
    final provider = ProgressProvider();
    final initialProgress = const UserProgress(
      currentStreak: 4,
      bestStreak: 4,
      lastActiveDate: '2026-09-04',
      completedQuizIds: ['q1'],
      completedScenarioIds: ['s1'],
      exploredGestureIds: ['g1'],
    );
    await StorageService.saveProgress(initialProgress);
    provider.loadProgress();

    expect(provider.progress.totalPoints, greaterThan(0));

    bool notified = false;
    void listener() {
      notified = true;
    }

    provider.addListener(listener);
    await provider.resetProgress();
    provider.removeListener(listener);

    expect(notified, isTrue);
    expect(provider.progress.completedQuizIds, isEmpty);
    expect(provider.progress.completedScenarioIds, isEmpty);
    expect(provider.progress.exploredGestureIds, isEmpty);
    expect(provider.progress.masteryRatio, equals(0.0));
  });

  test('TtsService clamps and persists speech rate reliably', () async {
    // Set rate to 0.70
    await TtsService.setSpeechRate(0.70);
    expect(TtsService.currentRate, equals(0.70));
    expect(StorageService.getSpeechRate(), equals(0.70));

    // Test extreme values clamped
    await TtsService.setSpeechRate(3.0); // should clamp to 1.0
    expect(TtsService.currentRate, equals(1.0));

    await TtsService.setSpeechRate(0.1); // should clamp to 0.25
    expect(TtsService.currentRate, equals(0.25));
  });

  test('ContrastUtils accurately calculates WCAG 2.1 contrast ratios', () {
    // Pure black on pure white gives maximum ratio of 21.0
    final blackWhite = ContrastUtils.contrastRatio(Colors.black, Colors.white);
    expect(blackWhite, closeTo(21.0, 0.1));

    // Same color has ratio of 1.0
    final sameColor = ContrastUtils.contrastRatio(Colors.white, Colors.white);
    expect(sameColor, closeTo(1.0, 0.01));

    // Gestura text primary light on light surface satisfies AAA
    final textRatio = ContrastUtils.contrastRatio(
      AppColors.textPrimaryLight,
      AppColors.lightSurface,
    );
    expect(textRatio, greaterThanOrEqualTo(7.0));
    expect(
        ContrastUtils.isWcagAaa(
            AppColors.textPrimaryLight, AppColors.lightSurface),
        isTrue);

    // Gestura text primary dark on dark surface satisfies AAA
    final darkTextRatio = ContrastUtils.contrastRatio(
      AppColors.textPrimaryDark,
      AppColors.darkSurface,
    );
    expect(darkTextRatio, greaterThanOrEqualTo(7.0));
    expect(
        ContrastUtils.isWcagAaa(
            AppColors.textPrimaryDark, AppColors.darkSurface),
        isTrue);
  });

  test('AdIds provides valid non-empty production and test IDs', () {
    expect(AdIds.realBannerId, startsWith('ca-app-pub-'));
    expect(AdIds.testBannerId, startsWith('ca-app-pub-'));
    expect(AdIds.bannerAdUnitId, isNotEmpty);
  });

  test('All illustration keys across databases are valid and non-empty', () {
    final allKeys = <String>{};
    for (final g in GestureDatabase.items) {
      allKeys.add(g.illustrationKey);
    }
    for (final q in QuizDatabase.questions) {
      if (q.questionIllustrationKey != null) {
        allKeys.add(q.questionIllustrationKey!);
      }
      for (final opt in q.options) {
        if (opt.illustrationKey != null) {
          allKeys.add(opt.illustrationKey!);
        }
      }
    }
    for (final s in ScenarioDatabase.scenarios) {
      for (final step in s.steps) {
        if (step.illustrationKey != null) {
          allKeys.add(step.illustrationKey!);
        }
      }
    }
    for (final inc in IncongruenceDatabase.items) {
      allKeys.add(inc.illustrationKey);
    }

    expect(allKeys.length, greaterThanOrEqualTo(50));
    for (final key in allKeys) {
      expect(key.trim(), isNotEmpty);
    }
  });

  test('SocialScriptsDatabase has complete scripts with 3 firmness levels', () {
    final scripts = SocialScriptsDatabase.scripts;
    expect(scripts.length, greaterThanOrEqualTo(37));

    final scriptIds = scripts.map((s) => s.id).toList();
    expect(scriptIds.toSet().length, equals(scriptIds.length),
        reason: 'Script IDs must be unique');

    // Verify all 8 TEA and autonomy scripts are present
    expect(scriptIds.contains('work_meeting_ended'), isTrue);
    expect(scriptIds.contains('work_written_instructions'), isTrue);
    expect(scriptIds.contains('work_camera_fatigue'), isTrue);
    expect(scriptIds.contains('sensory_decompression_alone'), isTrue);
    expect(scriptIds.contains('sensory_medical_dentist_touch'), isTrue);
    expect(scriptIds.contains('social_infodumping_check'), isTrue);
    expect(scriptIds.contains('social_graceful_exit'), isTrue);
    expect(scriptIds.contains('pressure_family_interrogation'), isTrue);

    for (final cat in SocialScriptCategory.values) {
      final inCat = SocialScriptsDatabase.getByCategory(cat);
      expect(inCat.isNotEmpty, isTrue,
          reason: 'Category ${cat.label} must have scripts');
    }

    for (final script in scripts) {
      expect(script.id.trim(), isNotEmpty);
      expect(script.title.trim(), isNotEmpty);
      expect(script.contextDescription.trim(), isNotEmpty);
      expect(script.softPhrase.trim(), isNotEmpty);
      expect(script.assertivePhrase.trim(), isNotEmpty);
      expect(script.firmPhrase.trim(), isNotEmpty);
      expect(script.bodyLanguage.trim(), isNotEmpty);
      expect(script.whatNotToDo.trim(), isNotEmpty);

      // Verify firmness getter
      expect(script.getPhraseByFirmness(ScriptFirmness.soft),
          equals(script.softPhrase));
      expect(script.getPhraseByFirmness(ScriptFirmness.assertive),
          equals(script.assertivePhrase));
      expect(script.getPhraseByFirmness(ScriptFirmness.firm),
          equals(script.firmPhrase));
    }
  });

  test('SalesPipelineDatabase defines 4 chronological phases and objections',
      () {
    final phases = SalesPipelineDatabase.phases;
    expect(phases.length, equals(4));

    for (int i = 0; i < phases.length; i++) {
      final p = phases[i];
      expect(p.phaseNumber, equals(i + 1));
      expect(p.title.trim(), isNotEmpty);
      expect(p.timing.trim(), isNotEmpty);
      expect(p.objective.trim(), isNotEmpty);
      expect(p.clientSignalsToWatch.isNotEmpty, isTrue);
      expect(p.yourBodyLanguage.isNotEmpty, isTrue);
      expect(p.keyRule.trim(), isNotEmpty);
    }

    final objections = SalesPipelineDatabase.objections;
    expect(objections.length, greaterThanOrEqualTo(5));

    final objIds = objections.map((o) => o.id).toList();
    expect(objIds.toSet().length, equals(objIds.length),
        reason: 'Objection IDs must be unique');

    for (final obj in objections) {
      expect(obj.id.trim(), isNotEmpty);
      expect(obj.title.trim(), isNotEmpty);
      expect(obj.objectionPhrase.trim(), isNotEmpty);
      expect(obj.context.trim(), isNotEmpty);
      expect(obj.softResponse.trim(), isNotEmpty);
      expect(obj.assertiveResponse.trim(), isNotEmpty);
      expect(obj.firmResponse.trim(), isNotEmpty);
      expect(obj.bodyLanguage.trim(), isNotEmpty);
      expect(obj.whatNotToDo.trim(), isNotEmpty);
    }
  });

  test(
      'BoundaryFrameworkDatabase defines 4 methodological phases and protocols',
      () {
    final phases = BoundaryFrameworkDatabase.phases;
    expect(phases.length, equals(4));

    for (int i = 0; i < phases.length; i++) {
      final p = phases[i];
      expect(p.phaseNumber, equals(i + 1));
      expect(p.title.trim(), isNotEmpty);
      expect(p.subtitle.trim(), isNotEmpty);
      expect(p.corePrinciple.trim(), isNotEmpty);
      expect(p.conceptItems.isNotEmpty, isTrue);
      for (final item in p.conceptItems) {
        expect(item.title.trim(), isNotEmpty);
        expect(item.description.trim(), isNotEmpty);
      }
      expect(p.practicalProtocol.trim(), isNotEmpty);
    }
  });

  testWidgets(
      'UnwrittenRulesScreen renders Límites y Consentimiento tab and both subviews',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: UnwrittenRulesScreen(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Tab chip exists
    final tabFinder = find.text('Límites y Consentimiento');
    expect(tabFinder, findsOneWidget);

    // Scroll until visible in horizontal chip bar and tap
    await tester.ensureVisible(tabFinder);
    await tester.pumpAndSettle();
    await tester.tap(tabFinder);
    await tester.pumpAndSettle();

    // Default subview 0: La Ruta en 3 Fases
    expect(find.text('Límites y Consentimiento Real'), findsOneWidget);
    expect(find.text('La Ruta en 3 Fases'), findsOneWidget);
    expect(find.text('FASE 1'), findsOneWidget);
    expect(find.text('Reconocer tus límites'), findsOneWidget);

    // Tap subview 1: Biblioteca de Guiones
    await tester.tap(find.textContaining('Biblioteca de Guiones').first);
    await tester.pumpAndSettle();

    // Should find category chips
    expect(find.textContaining('Laboral'), findsWidgets);
  });

  testWidgets('BuyerTemperatureScreen renders Sales Track Hub with 4 tabs',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BuyerTemperatureScreen(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Title
    expect(find.text('Conversaciones de venta'), findsOneWidget);

    // Verify the 4 tabs
    expect(find.text('Pasos de una venta'), findsOneWidget);
    expect(find.text('Observar y preguntar'), findsOneWidget);
    expect(find.text('Respuestas a dudas'), findsOneWidget);
    expect(find.text('Simulación y Práctica'), findsOneWidget);

    // Default tab 0 shows Phase 1
    expect(find.text('FASE 1'), findsOneWidget);

    // Switch to the observation tab
    await tester.tap(find.text('Observar y preguntar'));
    await tester.pumpAndSettle();
    expect(find.textContaining('señales observadas'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsNothing);
    expect(find.textContaining(RegExp(r'\d+%')), findsNothing);
    await tester.scrollUntilVisible(
        find.text('Inclinación frontal hacia la mesa'), 200,
        scrollable: find.byType(Scrollable).first);
    await tester.tap(find.text('Inclinación frontal hacia la mesa'));
    await tester.pumpAndSettle();
    expect(find.text('Observaciones para conversar'), findsOneWidget);
    expect(find.textContaining('no permiten calcular interés'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsNothing);
    expect(find.textContaining(RegExp(r'\d+%')), findsNothing);
  });

  test(
      'RoadmapDatabase defines complete 5-level curriculum with 11 steps and valid progression',
      () {
    expect(RoadmapDatabase.levels.length, equals(5));
    final allSteps = RoadmapDatabase.levels.expand((l) => l.steps).toList();
    expect(allSteps.length, equals(11));

    // Unique IDs
    final stepIds = allSteps.map((s) => s.id).toSet();
    expect(stepIds.length, equals(11));

    // Initial state (empty progress)
    final freshProgress = const UserProgress();
    final activeStep = RoadmapDatabase.getCurrentActiveStep(freshProgress);
    expect(activeStep.id, equals('step_baseline'));
    expect(activeStep.stepNumber, equals(1));

    final activeLevel = RoadmapDatabase.getCurrentActiveLevel(freshProgress);
    expect(activeLevel.levelNumber, equals(1));

    // Status checks
    expect(activeStep.getStatus(freshProgress, true),
        equals(RoadmapStepStatus.current));
    final step2 = allSteps[1];
    expect(step2.getStatus(freshProgress, false),
        equals(RoadmapStepStatus.locked));

    // Unrelated activity must not complete a roadmap lesson.
    final progressWith1Gesture =
        freshProgress.copyWith(exploredGestureIds: ['g_test_1']);
    expect(activeStep.getStatus(progressWith1Gesture, true),
        equals(RoadmapStepStatus.current));
    final nextActive = RoadmapDatabase.getCurrentActiveStep(
        progressWith1Gesture.markRoadmapStepCompleted(activeStep.id));
    expect(nextActive.id, equals('step_first_quiz'));
    expect(nextActive.stepNumber, equals(2));
  });

  testWidgets(
      'MasteryProgressCard renders How to Human mission card and navigates correctly',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: MasteryProgressCard(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Roadmap mission card indicators
    expect(find.text('RUTA DE APRENDIZAJE'), findsOneWidget);
    expect(find.textContaining('Nivel 1'), findsWidgets);
    expect(find.textContaining('PASO 1 DE 11'), findsOneWidget);
    expect(find.text('Observar sin sacar conclusiones'), findsOneWidget);

    // Verify Action Buttons
    final continueBtn = find.text('Continuar Ruta');
    final itineraryBtn = find.text('Itinerario');
    expect(continueBtn, findsOneWidget);
    expect(itineraryBtn, findsOneWidget);

    // Tap Continuar Ruta -> navigates to Step 1 destination (ClusterBaselineScreen)
    await tester.tap(continueBtn);
    await tester.pumpAndSettle();
    expect(find.text('Gestos y forma habitual de expresarse'), findsOneWidget);
  });

  testWidgets(
      'ProgressScreen renders Roadmap How to Human and switches to Metrics/Radar tab',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProgressScreen(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Tab Selector
    expect(find.text('Ruta de aprendizaje'), findsOneWidget);
    expect(find.text('Métricas y Radar'), findsOneWidget);

    // Default tab 0 shows Roadmap
    expect(find.text('Tu recorrido de aprendizaje'), findsOneWidget);
    expect(find.text('Nivel 1: Observar con calma'), findsOneWidget);
    expect(find.text('Nivel 2: Cara, brazos y manos'), findsOneWidget);
    expect(find.text('Nivel 3: Frases y contexto'), findsOneWidget);
    expect(find.text('Nivel 4: Límites y consentimiento'), findsOneWidget);
    expect(find.text('Nivel 5: Situaciones cotidianas'), findsOneWidget);

    // Switch to Tab 1: Métricas y Radar
    await tester.tap(find.text('Métricas y Radar'));
    await tester.pumpAndSettle();

    // Verify metrics widgets
    expect(find.text('Radar de Competencias No Verbales'), findsOneWidget);
    expect(find.text('Racha Activa'), findsOneWidget);
    expect(find.text('Precisión Quiz'), findsOneWidget);
    expect(find.text('Escenarios'), findsOneWidget);
  });

  testWidgets(
      'ScenariosScreen renders the catalog and filters by Límites y Consentimiento',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ScenariosScreen(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Title and total count chip
    expect(find.text('Simulador de Escenarios'), findsOneWidget);
    expect(find.text('Todos (${ScenarioDatabase.scenarios.length})'),
        findsOneWidget);
    final boundaryCount = ScenarioDatabase.scenarios
        .where((s) =>
            s.domain == 'Límites' || s.domain == 'Límites & Consentimiento')
        .length;
    expect(
        find.text('Límites y Consentimiento ($boundaryCount)'), findsOneWidget);

    // Tap boundaries filter chip (ensuring visibility in horizontal scroll)
    final boundaryChip = find.text('Límites y Consentimiento ($boundaryCount)');
    await tester.ensureVisible(boundaryChip);
    await tester.pumpAndSettle();
    await tester.tap(boundaryChip);
    await tester.pumpAndSettle();

    // Verify both boundary scenarios are displayed
    expect(find.textContaining('Poner límites ante la presión de un compañero'),
        findsOneWidget);
    expect(find.textContaining('Comprobar que un sí es libre'), findsOneWidget);
  });

  testWidgets(
      'HomeScreen practical tools renders Límites & Consentimiento card and navigates',
      (tester) async {
    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();

    // Scroll down to Herramientas Prácticas
    final limitesCard = find.text('Límites & Consentimiento');
    await tester.scrollUntilVisible(limitesCard, 300,
        scrollable: find.byType(Scrollable).first);
    await tester.ensureVisible(limitesCard);
    await tester.pumpAndSettle();
    expect(limitesCard, findsOneWidget);

    // Tap on the card
    await tester.tap(limitesCard);
    await tester.pumpAndSettle();

    // Expect navigation directly to Límites y Consentimiento Real tab in UnwrittenRulesScreen
    expect(find.text('Límites y Consentimiento Real'), findsOneWidget);
    expect(find.text('FASE 1'), findsOneWidget);
    expect(find.text('Reconocer tus límites'), findsOneWidget);
  });

  test(
      'ProgressProvider updates state and notifies listeners on progress changes',
      () async {
    final provider = ProgressProvider();
    bool notified = false;
    void listener() {
      notified = true;
    }

    provider.addListener(listener);
    await provider.markGestureExplored('sonrisa_duchenne');
    expect(notified, isTrue);
    expect(provider.progress.exploredGestureIds.contains('sonrisa_duchenne'),
        isTrue);
    provider.removeListener(listener);
  });

  testWidgets(
      'IncongruenceDetectorScreen renders neuroaffirmative buttons and feedback',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: IncongruenceDetectorScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Explorar explicaciones'), findsOneWidget);
    expect(find.text('Señales Alineadas'), findsNothing);
    expect(find.textContaining('Aciertos:'), findsNothing);

    await tester.tap(find.text('Explorar explicaciones'));
    await tester.pumpAndSettle();

    expect(find.text('Siguiente Caso'), findsOneWidget);
    await tester.scrollUntilVisible(
        find.text('Algunas explicaciones posibles:'), 200,
        scrollable: find.byType(Scrollable).first);
    expect(find.text('Algunas explicaciones posibles:'), findsOneWidget);
  });

  test(
      'GestureItem provides valid visual-first clues, actions, and express audio',
      () {
    for (final item in GestureDatabase.items) {
      expect(item.quickVisualClue.isNotEmpty, isTrue,
          reason: '${item.id} should have non-empty quickVisualClue');
      expect(item.quickMeaning.isNotEmpty, isTrue,
          reason: '${item.id} should have non-empty quickMeaning');
      expect(item.quickAction.isNotEmpty, isTrue,
          reason: '${item.id} should have non-empty quickAction');
      expect(item.expressAudioSummary.contains(item.name), isTrue,
          reason: '${item.id} expressAudioSummary should contain gesture name');
      expect(item.reading.shortState.isNotEmpty, isTrue);
      expect(item.reading.actionAdvice.isNotEmpty, isTrue);
    }
  });

  testWidgets('GestureDetailScreen renders quick view and audio summary',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GestureDetailScreen(gestureId: 'sonrisa_genuina'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Vista rápida'), findsOneWidget);
    expect(find.textContaining('Qué mirar:'), findsOneWidget);
    expect(find.textContaining('Posibles significados:'), findsOneWidget);
    expect(find.textContaining('Qué puedes hacer:'), findsOneWidget);
    expect(find.text('🎧 Escuchar resumen'), findsOneWidget);
    expect(find.text('📖 Ver análisis profundo y contexto (Opcional)'),
        findsOneWidget);
  });

  testWidgets('GestureCard displays tentative reading and visual clues',
      (tester) async {
    final item = GestureDatabase.getById('sonrisa_genuina')!;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GestureCard(
            item: item,
            isBookmarked: false,
            onTap: () {},
            onBookmarkToggle: () {},
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(item.reading.shortState), findsOneWidget);
    expect(find.textContaining('💡'), findsOneWidget);
    expect(find.textContaining('👁️'), findsOneWidget);
    expect(find.text(item.difficultyLabel), findsOneWidget);
  });

  test('GestureItem provides valid difficultyLabel and color', () {
    for (final item in GestureDatabase.items) {
      expect(item.difficultyLabel,
          isIn(['Nivel Básico', 'Nivel Intermedio', 'Nivel Sutil']));
      expect(item.difficultyColor, isNotNull);
    }
  });

  testWidgets(
      'UnwrittenRulesScreen displays literal meaning and speaker buttons for indirect phrases',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: UnwrittenRulesScreen(initialTab: 1),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Literalmente:'), findsWidgets);
    expect(find.byIcon(Icons.volume_up_rounded), findsWidgets);
  });

  testWidgets(
      'ScenarioRunnerScreen displays characterAction and learningTakeaway upon choice selection',
      (tester) async {
    final scenario = ScenarioDatabase.scenarios.first;
    await tester.pumpWidget(
      MaterialApp(
        home: ScenarioRunnerScreen(scenario: scenario),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Acción visible:'), findsOneWidget);

    // Tap first choice
    final firstChoiceText = scenario.steps.first.choices.first.text;
    await tester.tap(find.text(firstChoiceText));
    await tester.pumpAndSettle();

    expect(find.text('Lección Teórica Clave'), findsOneWidget);
    expect(find.text(scenario.steps.first.learningTakeaway), findsOneWidget);
  });

  test('DecisionTreeScreen zones map contains only valid GestureDatabase IDs',
      () {
    for (final zone in DecisionTreeScreen.zones) {
      final clues = zone['clues'] as List<String>;
      expect(clues, isNotEmpty, reason: 'Zone ${zone["id"]} should have clues');
      for (final id in clues) {
        final gesture = GestureDatabase.getById(id);
        expect(gesture, isNotNull,
            reason:
                'Clue ID "$id" in zone "${zone["id"]}" must exist in GestureDatabase');
      }
    }
  });

  test('CheatSheetScreen priorityIds contains exactly 20 valid gestures', () {
    expect(CheatSheetScreen.priorityIds.length, equals(20));
    for (final id in CheatSheetScreen.priorityIds) {
      final gesture = GestureDatabase.getById(id);
      expect(gesture, isNotNull,
          reason:
              'Priority ID "$id" in CheatSheetScreen must exist in GestureDatabase');
    }
  });

  test('UserProgress calculates streak safely across day transitions', () {
    var progress = UserProgress.initial();
    // Day 1
    final day1 = DateTime(2026, 3, 28, 23, 30);
    progress = progress.registerActiveDay(day1);
    expect(progress.currentStreak, equals(1));

    // Day 2 (even if crossing DST transition of 23 hours)
    final day2 = DateTime(2026, 3, 29, 0, 30);
    progress = progress.registerActiveDay(day2);
    expect(progress.currentStreak, equals(2));

    // Same day activity should maintain streak
    progress = progress.registerActiveDay(day2.add(const Duration(hours: 5)));
    expect(progress.currentStreak, equals(2));

    // Gap of 2 days resets streak
    final day5 = DateTime(2026, 4, 1, 10, 0);
    progress = progress.registerActiveDay(day5);
    expect(progress.currentStreak, equals(1));
    expect(progress.bestStreak, equals(2));
  });

  test('AppConstants appVersion matches version 1.0.19', () {
    expect(AppConstants.appVersion, equals('1.0.19'));
  });

  testWidgets(
      'QuizRunnerScreen handles empty questions safely without crashing',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: QuizRunnerScreen(title: 'Empty Quiz', questions: []),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No hay preguntas disponibles.'), findsOneWidget);
  });

  testWidgets(
      'ScenarioRunnerScreen handles empty steps safely without crashing',
      (tester) async {
    const emptyScenario = Scenario(
      id: 'empty_test',
      title: 'Escenario Vacío',
      domain: 'Test',
      description: 'Test description',
      contextOverview: 'Test overview',
      iconName: 'theater_comedy',
      steps: [],
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: ScenarioRunnerScreen(scenario: emptyScenario),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('No hay pasos configurados en este escenario.'),
        findsOneWidget);
  });
}
