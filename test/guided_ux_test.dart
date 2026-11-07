import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/core/services/tts_service.dart';
import 'package:gestura/core/theme/app_theme.dart';
import 'package:gestura/data/roadmap_database.dart';
import 'package:gestura/data/concepts_database.dart';
import 'package:gestura/models/user_progress.dart';
import 'package:gestura/screens/home_screen.dart';
import 'package:gestura/screens/explore_screen.dart';
import 'package:gestura/screens/decoder_screen.dart';
import 'package:gestura/screens/concepts_screen.dart';
import 'package:gestura/screens/communication_guide_screen.dart';
import 'package:gestura/screens/roadmap_lesson_screen.dart';
import 'package:gestura/screens/tools_screen.dart';
import 'package:gestura/state/progress_provider.dart';
import 'package:gestura/state/settings_provider.dart';
import 'package:gestura/widgets/home/mastery_progress_card.dart';

void main() {
  final spoken = <String>[];
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    ProgressProvider().loadProgress();
    SettingsProvider().loadSettings();
    await SettingsProvider().setSoundEffectsEnabled(false);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter_tts'),
            (call) async {
      if (call.method == 'speak') spoken.add(call.arguments.toString());
      if (call.method == 'getLanguages') return ['es-MX', 'es-ES'];
      return 1;
    });
    await TtsService.stop();
    spoken.clear();
  });

  test(
      'Course percentage counts known lessons independently of catalog activity',
      () {
    final progress = const UserProgress(
      exploredGestureIds: ['anything'],
      completedRoadmapStepIds: ['step_baseline', 'retired_step'],
    );
    expect(RoadmapDatabase.completedStepsCount(progress), 1);
    expect(RoadmapDatabase.completionRatio(progress), closeTo(1 / 11, .0001));
    final finished = UserProgress(
        completedRoadmapStepIds:
            RoadmapDatabase.steps.map((s) => s.id).toList());
    expect(RoadmapDatabase.completionRatio(finished), 1);
  });

  testWidgets('Continue is visible immediately and tools open from the top bar',
      (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
        theme: AppTheme.lightTheme,
        home: HomeScreen(onNavigateToTab: (_) {}, onOpenCategory: (_) {})));
    await tester.pumpAndSettle();
    expect(find.text('Empezar ruta').hitTestable(), findsOneWidget);
    expect(find.text('Ayuda rápida').hitTestable(), findsOneWidget);
    expect(
        tester
            .widget<LinearProgressIndicator>(
                find.byType(LinearProgressIndicator))
            .value,
        0);
    await tester.tap(find.byTooltip('Herramientas'));
    await tester.pumpAndSettle();
    expect(find.byType(ToolsScreen), findsOneWidget);
    expect(find.text('Test Visual'), findsOneWidget);
  });

  testWidgets(
      'Home prioritizes learning and communication while search stays accessible',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
        theme: AppTheme.lightTheme,
        home: HomeScreen(onNavigateToTab: (_) {}, onOpenCategory: (_) {})));
    await tester.pumpAndSettle();
    expect(tester.getTopLeft(find.text('Empezar ruta')).dy,
        lessThan(tester.getTopLeft(find.text('Comunicar ahora')).dy));
    expect(find.text('Gesto del Día'), findsNothing);
    expect(find.text('Conceptos'), findsNothing);
    await tester.scrollUntilVisible(find.text('Buscar'), 150);
    await tester.tap(find.text('Buscar'));
    await tester.pumpAndSettle();
    expect(find.byType(DecoderScreen), findsOneWidget);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tester.tap(find.text('Explorar'));
    await tester.pumpAndSettle();
    expect(find.byType(ExploreScreen), findsOneWidget);
    expect(find.text('Conceptos'), findsOneWidget);
    await tester.tap(find.text('Conceptos'));
    await tester.pumpAndSettle();
    expect(find.byType(ConceptsScreen), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
      'Reading completion goes directly to next lesson and Back preserves pending step',
      (tester) async {
    await ProgressProvider().markRoadmapStepCompleted('step_baseline');
    await ProgressProvider().markRoadmapStepCompleted('step_first_quiz');
    await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: MasteryProgressCard())));
    await tester.tap(find.text('Continuar ruta'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<RoadmapLessonScreen>(find.byType(RoadmapLessonScreen))
            .stepId,
        'step_eyes');
    await tester.tap(find.text('Completar y continuar'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<RoadmapLessonScreen>(find.byType(RoadmapLessonScreen))
            .stepId,
        'step_hands_torso');
    await tester.pageBack();
    await tester.pumpAndSettle();
    ProgressProvider().loadProgress();
    expect(ProgressProvider().progress.completedRoadmapStepIds,
        contains('step_eyes'));
    expect(ProgressProvider().progress.completedRoadmapStepIds,
        isNot(contains('step_hands_torso')));
    expect(find.text('27% · 3 de 11 pasos completados'), findsOneWidget);
  });

  testWidgets(
      'Completing the last step shows 100 percent and review instead of another pending step',
      (tester) async {
    for (final step
        in RoadmapDatabase.steps.take(RoadmapDatabase.steps.length - 1)) {
      await ProgressProvider().markRoadmapStepCompleted(step.id);
    }
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(child: MasteryProgressCard()))));
    await tester.tap(find.text('Continuar ruta'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Completar ruta'));
    await tester.pumpAndSettle();
    expect(find.text('100% · 11 de 11 pasos completados'), findsOneWidget);
    expect(find.text('Repasar ruta'), findsOneWidget);
    expect(find.text('Continuar ruta'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
      'Concept audio reads the filtered definitions and stops from the top bar',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ConceptsScreen()));
    await tester.enterText(find.byType(TextField), 'proxemica');
    await tester.pump();
    await tester.tap(find.byTooltip('Escuchar lectura en voz alta'));
    await tester.pumpAndSettle();
    expect(spoken.single, contains('Distancia personal'));
    expect(spoken.single, isNot(contains('Sarcasmo e ironía')));
    await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        'flutter_tts',
        const StandardMethodCodec()
            .encodeMethodCall(const MethodCall('speak.onStart')),
        (_) {});
    await tester.pump();
    await tester.tap(find.text('Detener'));
    await tester.pump();
    expect(TtsService.isSpeakingNotifier.value, isFalse);
  });

  testWidgets(
      'Automatic narration includes lesson exercises and concept definitions',
      (tester) async {
    await StorageService.setAutoNarration(true);
    await tester
        .pumpWidget(const MaterialApp(home: CommunicationGuideScreen()));
    await tester.pumpAndSettle();
    expect(
        spoken.last, contains(CommunicationGuideScreen.lessons.last.exercise));
    await tester.pumpWidget(const MaterialApp(home: ConceptsScreen()));
    await tester.pumpAndSettle();
    expect(spoken.last, contains(ConceptsDatabase.all.last.explanation));
    await tester.pumpWidget(const SizedBox());
    await tester.pump();
    expect(TtsService.isSpeakingNotifier.value, isFalse);
  });
}
