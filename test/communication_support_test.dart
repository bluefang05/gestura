import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gestura/core/services/storage_service.dart';
import 'package:gestura/core/services/tts_service.dart';
import 'package:gestura/core/theme/app_theme.dart';
import 'package:gestura/main.dart';
import 'package:gestura/screens/communication_board_screen.dart';
import 'package:gestura/screens/emergency_mode_screen.dart';

void main() {
  final speechCalls = <MethodCall>[];

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.init();
    speechCalls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(const MethodChannel('flutter_tts'),
            (call) async {
      speechCalls.add(call);
      return 1;
    });
    await TtsService.stop();
    speechCalls.clear();
  });

  testWidgets('Home opens the communication board directly', (tester) async {
    await tester.pumpWidget(const GesturaApp());
    await tester.pumpAndSettle();
    await tester.tap(find.text('Comunicar ahora'));
    await tester.pumpAndSettle();
    expect(find.byType(CommunicationBoardScreen), findsOneWidget);
    expect(find.text('Necesito una pausa.'), findsOneWidget);
  });

  testWidgets(
      'Showing a phrase is silent; reading is explicit and stops on exit',
      (tester) async {
    final semantics = tester.ensureSemantics();
    await tester
        .pumpWidget(const MaterialApp(home: CommunicationBoardScreen()));
    await tester.tap(find.text('Necesito una pausa.'));
    await tester.pumpAndSettle();
    expect(find.byType(CommunicationMessageScreen), findsOneWidget);
    expect(find.byType(SelectableText), findsOneWidget);
    expect(find.bySemanticsLabel('Necesito una pausa.'), findsOneWidget);
    expect(speechCalls.where((c) => c.method == 'speak'), isEmpty);
    await tester.tap(find.text('Leer en voz alta'));
    await tester.pumpAndSettle();
    expect(speechCalls.where((c) => c.method == 'speak').length, 1);
    expect(find.text('Detener lectura'), findsOneWidget);
    speechCalls.clear();
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(speechCalls.where((c) => c.method == 'stop'), isNotEmpty);
    expect(TtsService.currentSpeakingIdNotifier.value, isNull);
    semantics.dispose();
  });

  testWidgets(
      'Custom messages reject whitespace, retain drafts and copy exact text',
      (tester) async {
    String? copied;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, (call) async {
      if (call.method == 'Clipboard.setData') {
        copied = (call.arguments as Map)['text'] as String;
      }
      return null;
    });
    await tester
        .pumpWidget(const MaterialApp(home: CommunicationBoardScreen()));
    await tester.scrollUntilVisible(find.byType(TextField), 300,
        scrollable: find.byType(Scrollable).first);
    await tester.enterText(find.byType(TextField), '   ');
    await tester.ensureVisible(find.text('Mostrar mi mensaje'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<FilledButton>(
                find.byKey(const ValueKey('show_custom_message')))
            .onPressed,
        isNull);
    await tester.enterText(
        find.byType(TextField), '  Prefiero hablar mañana.  ');
    await tester.ensureVisible(find.text('Mostrar mi mensaje'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Mostrar mi mensaje'));
    await tester.pumpAndSettle();
    expect(find.text('Prefiero hablar mañana.'), findsOneWidget);
    await tester.tap(find.text('Copiar mensaje'));
    await tester.pumpAndSettle();
    expect(copied, 'Prefiero hablar mañana.');
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        '  Prefiero hablar mañana.  ');
  });

  testWidgets(
      'Quick help retains each checklist and opens the matching message',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: EmergencyModeScreen()));
    await tester.tap(find.byType(CheckboxListTile).first);
    await tester.pump();
    await tester.tap(find.text('Pedir una pausa'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<CheckboxListTile>(find.byType(CheckboxListTile).first)
            .value,
        isFalse);
    await tester.tap(find.text('Trabajo'));
    await tester.pumpAndSettle();
    expect(
        tester
            .widget<CheckboxListTile>(find.byType(CheckboxListTile).first)
            .value,
        isTrue);
    await tester.tap(find.text('Pedir una pausa'));
    await tester.pumpAndSettle();
    final showMessage = find.text('Mostrar una frase para esta situación');
    await tester.scrollUntilVisible(showMessage, 200);
    await tester.ensureVisible(showMessage);
    await tester.tap(showMessage);
    await tester.pumpAndSettle();
    expect(find.text('Necesito una pausa. Podemos hablar después.'),
        findsOneWidget);
  });

  testWidgets(
      'Support screens fit narrow displays and enlarged text in all themes',
      (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    for (final theme in [
      AppTheme.lightTheme,
      AppTheme.darkTheme,
      AppTheme.highContrastTheme
    ]) {
      for (final screen in [
        const CommunicationBoardScreen(),
        const CommunicationMessageScreen(
            message:
                'Necesito más tiempo para responder. Por favor, dime una cosa a la vez.'),
        const EmergencyModeScreen(),
      ]) {
        await tester.pumpWidget(MaterialApp(
          theme: theme,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2.8)),
            child: child!,
          ),
          home: screen,
        ));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        await tester.drag(find.byType(Scrollable).first, const Offset(0, -600));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }
    }
  });
}
