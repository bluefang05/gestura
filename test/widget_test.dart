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
    expect(ScenarioDatabase.scenarios.length, equals(15));
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
    expect(boundaryScenario!.domain, equals('Límites & Asertividad'));
    expect(boundaryScenario.steps.length, equals(2));
    expect(
        boundaryScenario.steps.first.choices.any((c) => c.isBestAction), isTrue);

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

  test(
      'UserProgress calculates mastery percentage and motivational levels accurately',
      () {
    final initialProgress = UserProgress.initial();
    expect(initialProgress.masteryPercentage, equals(0));
    expect(initialProgress.masteryLevelTitle, equals('Iniciando Calibración'));

    final halfwayProgress = initialProgress.copyWith(
      exploredGestureIds: List.generate(33, (i) => 'g_$i'),
      completedScenarioIds: List.generate(8, (i) => 's_$i'),
      completedQuizIds: List.generate(22, (i) => 'q_$i'),
    );
    expect(halfwayProgress.masteryPercentage, greaterThanOrEqualTo(50));
    expect(halfwayProgress.masteryLevelTitle, equals('Analista de Campo'));

    final completedProgress = initialProgress.copyWith(
      exploredGestureIds: List.generate(66, (i) => 'g_$i'),
      completedScenarioIds: List.generate(15, (i) => 's_$i'),
      completedQuizIds: List.generate(45, (i) => 'q_$i'),
    );
    expect(completedProgress.masteryPercentage, equals(100));
    expect(
        completedProgress.masteryLevelTitle, equals('Maestro Decodificador'));
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
    expect(find.text('Neurobiología del Bloqueo'), findsOneWidget);

    // Scroll horizontal chips if needed and tap Neurobiología del Bloqueo
    await tester.ensureVisible(find.text('Neurobiología del Bloqueo'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Neurobiología del Bloqueo'));
    await tester.pumpAndSettle();

    expect(find.text('Neurobiología del Secuestro Emocional y Bloqueo'),
        findsOneWidget);
    expect(find.text('1. El Atajo Tálamo-Amígdala (12 ms)'), findsOneWidget);
    expect(find.text('2. El Secuestro de la Memoria de Trabajo'), findsOneWidget);
    expect(find.text('3. La Regla de los 20 Minutos (Dolf Zillmann)'),
        findsOneWidget);
    expect(find.text('4. Protocolo SOCS / Semáforo de Regulación'), findsOneWidget);
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
    expect(scripts.length, equals(25));

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

  test('BoundaryFrameworkDatabase defines 4 methodological phases and protocols',
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
    expect(find.text('Entenderlos: El Radar Somático'), findsOneWidget);

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
    expect(find.text('Ruta de Negociación y Ventas'), findsOneWidget);

    // Verify the 4 tabs
    expect(find.text('Pipeline (4 Fases)'), findsOneWidget);
    expect(find.text('Termómetro en Vivo'), findsOneWidget);
    expect(find.text('Guiones y Objeciones'), findsOneWidget);
    expect(find.text('Simulación y Práctica'), findsOneWidget);

    // Default tab 0 shows Phase 1
    expect(find.text('FASE 1'), findsOneWidget);

    // Switch to Termómetro en Vivo
    await tester.tap(find.text('Termómetro en Vivo'));
    await tester.pumpAndSettle();
    expect(find.textContaining('señales observadas'), findsOneWidget);
  });

  test('RoadmapDatabase defines complete 5-level curriculum with 11 steps and valid progression', () {
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
    expect(activeStep.getStatus(freshProgress, true), equals(RoadmapStepStatus.current));
    final step2 = allSteps[1];
    expect(step2.getStatus(freshProgress, false), equals(RoadmapStepStatus.locked));

    // Simulated progress: user explored 1 gesture
    final progressWith1Gesture = freshProgress.copyWith(exploredGestureIds: ['g_test_1']);
    expect(activeStep.getStatus(progressWith1Gesture, true), equals(RoadmapStepStatus.completed));
    final nextActive = RoadmapDatabase.getCurrentActiveStep(progressWith1Gesture);
    expect(nextActive.id, equals('step_first_quiz'));
    expect(nextActive.stepNumber, equals(2));
  });

  testWidgets('MasteryProgressCard renders How to Human mission card and navigates correctly', (tester) async {
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
    expect(find.text('RUTA: HOW TO HUMAN'), findsOneWidget);
    expect(find.textContaining('Nivel 1'), findsWidgets);
    expect(find.textContaining('PASO 1 DE 11'), findsOneWidget);
    expect(find.text('Calibrar la Línea Base & Clusters'), findsOneWidget);

    // Verify Action Buttons
    final continueBtn = find.text('Continuar Ruta');
    final itineraryBtn = find.text('Itinerario');
    expect(continueBtn, findsOneWidget);
    expect(itineraryBtn, findsOneWidget);

    // Tap Continuar Ruta -> navigates to Step 1 destination (ClusterBaselineScreen)
    await tester.tap(continueBtn);
    await tester.pumpAndSettle();
    expect(find.text('Conglomerados y Línea Base'), findsOneWidget);
  });

  testWidgets('ProgressScreen renders Roadmap How to Human and switches to Metrics/Radar tab', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProgressScreen(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Tab Selector
    expect(find.text('Ruta "How to Human"'), findsOneWidget);
    expect(find.text('Métricas y Radar'), findsOneWidget);

    // Default tab 0 shows Roadmap
    expect(find.text('Currículum: How to Human'), findsOneWidget);
    expect(find.text('Nivel 1: La Regla Cero'), findsOneWidget);
    expect(find.text('Nivel 2: El Alfabeto No Verbal'), findsOneWidget);
    expect(find.text('Nivel 3: El Código Oculto'), findsOneWidget);
    expect(find.text('Nivel 4: Blindaje y Consentimiento'), findsOneWidget);
    expect(find.text('Nivel 5: Mundo Real y Campo'), findsOneWidget);

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
      'ScenariosScreen renders 15 scenarios and filters by Límites y Consentimiento',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ScenariosScreen(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Title and total count chip
    expect(find.text('Simulador de Escenarios'), findsOneWidget);
    expect(find.text('Todos (15)'), findsOneWidget);
    expect(find.textContaining('Límites y Consentimiento (2)'), findsOneWidget);

    // Tap boundaries filter chip (ensuring visibility in horizontal scroll)
    final boundaryChip = find.textContaining('Límites y Consentimiento (2)');
    await tester.ensureVisible(boundaryChip);
    await tester.pumpAndSettle();
    await tester.tap(boundaryChip);
    await tester.pumpAndSettle();

    // Verify both boundary scenarios are displayed
    expect(
        find.textContaining('Límites Asertivos: La Presión del Colega'),
        findsOneWidget);
    expect(
        find.textContaining('Consentimiento Real: Decodificar el Falso Sí'),
        findsOneWidget);
  });

  testWidgets(
      'HomeScreen practical tools renders Límites & Consentimiento card and navigates',
      (tester) async {
    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();

    // Scroll down to Herramientas Prácticas
    await tester.drag(find.byType(ListView).first, const Offset(0, -600));
    await tester.pumpAndSettle();

    // Verify the Límites card is present
    final limitesCard = find.text('Límites & Consentimiento');
    expect(limitesCard, findsOneWidget);

    // Tap on the card
    await tester.tap(limitesCard);
    await tester.pumpAndSettle();

    // Expect navigation directly to Límites y Consentimiento Real tab in UnwrittenRulesScreen
    expect(find.text('Límites y Consentimiento Real'), findsOneWidget);
    expect(find.text('FASE 1'), findsOneWidget);
    expect(find.text('Entenderlos: El Radar Somático'), findsOneWidget);
  });

  test('ProgressProvider updates state and notifies listeners on progress changes', () async {
    final provider = ProgressProvider();
    bool notified = false;
    void listener() {
      notified = true;
    }

    provider.addListener(listener);
    await provider.markGestureExplored('sonrisa_duchenne');
    expect(notified, isTrue);
    expect(provider.progress.exploredGestureIds.contains('sonrisa_duchenne'), isTrue);
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

    expect(find.text('Señales Alineadas'), findsOneWidget);
    expect(find.text('Señales Mixtas'), findsOneWidget);

    await tester.tap(find.text('Señales Alineadas'));
    await tester.pumpAndSettle();

    expect(find.text('Siguiente Caso'), findsOneWidget);
    expect(find.text('Hipótesis e interpretaciones posibles:'), findsOneWidget);
  });

  test('GestureItem provides valid visual-first clues, actions, and express audio', () {
    for (final item in GestureDatabase.items) {
      expect(item.quickVisualClue.isNotEmpty, isTrue,
          reason: '${item.id} should have non-empty quickVisualClue');
      expect(item.quickMeaning.isNotEmpty, isTrue,
          reason: '${item.id} should have non-empty quickMeaning');
      expect(item.quickAction.isNotEmpty, isTrue,
          reason: '${item.id} should have non-empty quickAction');
      expect(item.expressAudioSummary.contains(item.name), isTrue,
          reason: '${item.id} expressAudioSummary should contain gesture name');
      expect(item.signalType.shortState.isNotEmpty, isTrue);
      expect(item.signalType.actionAdvice.isNotEmpty, isTrue);
    }
  });

  testWidgets('GestureDetailScreen renders 3-second card and express audio hero',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GestureDetailScreen(gestureId: 'sonrisa_genuina'),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('3 Segundos'), findsOneWidget);
    expect(find.textContaining('Qué mirar:'), findsOneWidget);
    expect(find.textContaining('Significado:'), findsOneWidget);
    expect(find.textContaining('Acción táctica:'), findsOneWidget);
    expect(find.text('🎧 Escuchar sin leer (10s)'), findsOneWidget);
    expect(find.text('📖 Ver análisis profundo y contexto (Opcional)'),
        findsOneWidget);
  });

  testWidgets('GestureCard displays traffic light pill and visual-first clues',
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

    expect(find.text('Receptivo'), findsOneWidget);
    expect(find.textContaining('💡'), findsOneWidget);
    expect(find.textContaining('👁️'), findsOneWidget);
  });
}

