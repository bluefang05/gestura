import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/localization/app_language.dart';
import 'package:gestura/core/localization/app_localizations.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/core/services/tts_service.dart';
import 'package:gestura/main.dart';
import 'package:gestura/state/settings_provider.dart';
import 'package:gestura/screens/settings_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('flutter_tts');
  final calls = <MethodCall>[];
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    SettingsProvider().loadSettings();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      return call.method == 'getLanguages'
          ? ['es-MX', 'es-ES', 'en-US', 'fr-FR', 'pt-BR', 'de-DE']
          : 1;
    });
    await TtsService.stop();
    calls.clear();
  });

  final cases = {
    const Locale('es', 'DO'): AppLanguage.latinSpanish,
    const Locale('es', 'MX'): AppLanguage.latinSpanish,
    const Locale('es', 'AR'): AppLanguage.latinSpanish,
    const Locale('es', 'ES'): AppLanguage.spainSpanish,
    const Locale('en', 'GB'): const Locale('en'),
    const Locale('fr', 'CA'): const Locale('fr'),
    const Locale('pt', 'BR'): const Locale('pt', 'BR'),
    const Locale('de', 'AT'): const Locale('de'),
  };
  for (final entry in cases.entries) {
    testWidgets(
        'First launch ${entry.key} uses ${entry.value} in interface and voice',
        (tester) async {
      tester.platformDispatcher.localesTestValue = [entry.key];
      addTearDown(tester.platformDispatcher.clearLocalesTestValue);
      await tester.pumpWidget(const GesturaApp());
      await tester.pumpAndSettle();
      final context =
          tester.element(find.byType(SettingsScreen, skipOffstage: false));
      expect(AppLocalizations.of(context).locale, entry.value);
      expect(StorageService.getLanguage(), isNull);
      await TtsService.speak('Sample', gestureId: 'sample');
      expect(calls.where((c) => c.method == 'setLanguage').last.arguments,
          AppLanguage.speechTag(entry.value));
    });
  }

  test('Automatic resolution skips unsupported preferred languages', () {
    expect(AppLanguage.resolve([const Locale('ja'), const Locale('fr', 'FR')]),
        const Locale('fr'));
    expect(AppLanguage.resolve([const Locale('ja')]), AppLanguage.latinSpanish);
  });

  testWidgets(
      'Manual language survives reload and automatic mode follows the device again',
      (tester) async {
    tester.platformDispatcher.localesTestValue = [const Locale('de', 'DE')];
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);
    await SettingsProvider().setLanguageCode('es-ES');
    SettingsProvider().loadSettings();
    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();
    expect(
        AppLocalizations.of(tester
                .element(find.byType(SettingsScreen, skipOffstage: false)))
            .locale,
        AppLanguage.spainSpanish);
    await TtsService.speak('Hola');
    expect(TtsService.currentLanguage, 'es-ES');
    await SettingsProvider().setLanguageCode(null);
    await TtsService.updateLanguage(null);
    await tester.pumpAndSettle();
    expect(
        AppLocalizations.of(tester
                .element(find.byType(SettingsScreen, skipOffstage: false)))
            .locale,
        const Locale('de'));
    expect(TtsService.currentLanguage, 'de-DE');
  });

  test('Legacy Spanish preference keeps its Spain variant', () async {
    await StorageService.setLanguage('es');
    SettingsProvider().loadSettings();
    expect(SettingsProvider().languageCode, 'es-ES');
    expect(SettingsProvider().locale, AppLanguage.spainSpanish);
    await TtsService.init();
    expect(TtsService.currentLanguage, 'es-ES');
  });

  testWidgets(
      'Both Spanish options fit on a mobile and Spain selects its voice',
      (tester) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLanguage.supportedLocales,
      locale: AppLanguage.latinSpanish,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(2)),
        child: child!,
      ),
      home: const SettingsScreen(),
    ));
    await tester.pumpAndSettle();
    final dropdown = find.byType(DropdownButton<String?>);
    await tester.scrollUntilVisible(dropdown, 200);
    await tester.tap(dropdown);
    await tester.pumpAndSettle();
    expect(find.text('Español (España)').hitTestable(), findsOneWidget);
    expect(find.text('Español (Latinoamérica)').hitTestable(), findsOneWidget);
    await tester.tap(find.text('Español (España)').hitTestable());
    await tester.pumpAndSettle();
    expect(StorageService.getLanguage(), 'es-ES');
    expect(TtsService.currentLanguage, 'es-ES');
  });

  test('Unavailable regional voice falls back within the same language',
      () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      if (call.method == 'getLanguages') return ['es-ES', 'fr-CA'];
      if (call.method == 'isLanguageAvailable') {
        return call.arguments == 'fr-CA';
      }
      return 1;
    });
    await TtsService.speak('Bonjour', langCode: 'fr');
    expect(TtsService.currentLanguage, 'fr-CA');
    expect(calls.where((c) => c.method == 'setLanguage').single.arguments,
        'fr-CA');
  });

  testWidgets(
      'Missing voice does not read in another language and shows a translated notice',
      (tester) async {
    await SettingsProvider().setLanguageCode('en');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      if (call.method == 'getLanguages') return ['es-ES'];
      if (call.method == 'isLanguageAvailable') return false;
      return 1;
    });
    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();
    await TtsService.speak('Hello');
    await tester.pump();
    expect(calls.where((c) => c.method == 'speak'), isEmpty);
    expect(find.textContaining('No voice is available'), findsOneWidget);
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  });

  test('Spanish learning material uses a Spanish voice even with English menus',
      () async {
    await StorageService.setLanguage('en');
    await TtsService.speakQuizQuestion(
        question: 'Pregunta en español', options: ['Sí', 'No']);
    expect(TtsService.currentLanguage, 'es-MX');
  });

  test('Concurrent reads cancel the older request while the engine initializes',
      () async {
    final entered = Completer<void>();
    final release = Completer<int>();
    var first = true;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
      calls.add(call);
      if (call.method == 'setLanguage' && first) {
        first = false;
        entered.complete();
        return release.future;
      }
      return 1;
    });
    final oldRead = TtsService.speak('Older', langCode: 'en');
    await entered.future;
    final newRead = TtsService.speak('Newer', langCode: 'de');
    release.complete(1);
    await Future.wait([oldRead, newRead]);
    expect(calls.where((c) => c.method == 'speak').length, 1);
    expect(calls.where((c) => c.method == 'speak').single.arguments.toString(),
        contains('Newer'));
    expect(TtsService.currentLanguage, 'de-DE');
  });
}
