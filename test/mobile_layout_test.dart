import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/core/theme/app_theme.dart';
import 'package:gestura/screens/main_navigation_screen.dart';
import 'package:gestura/screens/buyer_temperature_screen.dart';
import 'package:gestura/screens/compare_screen.dart';
import 'package:gestura/screens/cheat_sheet_screen.dart';
import 'package:gestura/screens/cluster_baseline_screen.dart';
import 'package:gestura/screens/concepts_screen.dart';
import 'package:gestura/screens/decoder_screen.dart';
import 'package:gestura/screens/decision_tree_screen.dart';
import 'package:gestura/screens/incongruence_detector_screen.dart';
import 'package:gestura/screens/unwritten_rules_screen.dart';
import 'package:gestura/screens/progress_screen.dart';
import 'package:gestura/state/settings_provider.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    SettingsProvider().loadSettings();
    await SettingsProvider().setSoundEffectsEnabled(false);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('flutter_tts'), (_) async => 1);
  });
  for (final scale in [1.0, 2.0]) {
    testWidgets('Selected gesture reading stays readable on mobile text $scale',
        (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.lightTheme,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(scale)),
          child: child!,
        ),
        home: const DecisionTreeScreen(),
      ));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(find.text('Boca y Labios'), 200,
          scrollable: find.byType(Scrollable).first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Boca y Labios'));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(find.text('Mandíbula apretada'), 200,
          scrollable: find.byType(Scrollable).first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Mandíbula apretada'));
      await tester.pumpAndSettle();
      await tester.scrollUntilVisible(
          find.text('Posible tensión o incomodidad'), 200,
          scrollable: find.byType(Scrollable).first);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  }
  final tools = <Widget>[
    const BuyerTemperatureScreen(),
    const CompareScreen(),
    const CheatSheetScreen(),
    const ClusterBaselineScreen(),
    const ConceptsScreen(),
    const DecoderScreen(),
    const DecisionTreeScreen(),
    const IncongruenceDetectorScreen(),
    const UnwrittenRulesScreen(),
    const ProgressScreen(),
  ];
  for (final screen in tools) {
    for (final scale in [1.0, 2.0]) {
      testWidgets('Mobile tool ${screen.runtimeType} text $scale',
          (tester) async {
        tester.view.physicalSize = const Size(320, 640);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        final previousHandler = FlutterError.onError;
        FlutterError.onError = (details) {
          FlutterError.dumpErrorToConsole(details, forceReport: true);
          previousHandler?.call(details);
        };
        addTearDown(() => FlutterError.onError = previousHandler);
        await tester.pumpWidget(MaterialApp(
          theme: AppTheme.lightTheme,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.linear(scale)),
            child: child!,
          ),
          home: screen,
        ));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        final scrollables = find.byType(Scrollable);
        if (scrollables.evaluate().isNotEmpty) {
          for (var step = 0; step < 10; step++) {
            await tester.drag(scrollables.first, const Offset(0, -350));
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
          }
        }
      });
    }
  }
  for (final size in [
    const Size(320, 640),
    const Size(390, 844),
    const Size(844, 390)
  ]) {
    for (final scale in [1.0, 2.0]) {
      for (var tab = 0; tab < 5; tab++) {
        testWidgets(
            'Mobile $size text $scale tab $tab scrolls without overflow',
            (tester) async {
          tester.view.physicalSize = size;
          tester.view.devicePixelRatio = 1;
          addTearDown(tester.view.resetPhysicalSize);
          addTearDown(tester.view.resetDevicePixelRatio);
          final previousHandler = FlutterError.onError;
          FlutterError.onError = (details) {
            FlutterError.dumpErrorToConsole(details, forceReport: true);
            previousHandler?.call(details);
          };
          addTearDown(() => FlutterError.onError = previousHandler);
          await tester.pumpWidget(MaterialApp(
            theme: AppTheme.lightTheme,
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.linear(scale)),
              child: child!,
            ),
            home: MainNavigationScreen(initialTab: tab),
          ));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
          final scrollables = find.byType(Scrollable);
          if (scrollables.evaluate().isNotEmpty) {
            for (var step = 0; step < 12; step++) {
              await tester.drag(scrollables.first, const Offset(0, -350));
              await tester.pumpAndSettle();
              expect(tester.takeException(), isNull);
            }
          }
        });
      }
    }
  }
}
