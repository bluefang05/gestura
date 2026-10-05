import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestura/data/concepts_database.dart';
import 'package:gestura/data/quiz_database.dart';
import 'package:gestura/screens/concepts_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
            const MethodChannel('flutter_tts'), (_) async => 1);
  });

  testWidgets(
      'Concept search accepts old names, missing accents and can be cleared',
      (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ConceptsScreen()));
    await tester.enterText(find.byType(TextField), '  LINEA base  ');
    await tester.pump();
    expect(find.text('Forma habitual de expresarse'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'proxemica');
    await tester.pump();
    expect(find.text('Distancia personal'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'zzzzzzz');
    await tester.pump();
    expect(find.byType(Card), findsNothing);
    await tester.tap(find.byTooltip('Limpiar búsqueda'));
    await tester.pump();
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text,
        isEmpty);
    expect(find.text('Forma habitual de expresarse'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Sarcasmo e ironía'), 250,
        scrollable: find.byType(Scrollable).first);
    expect(find.text('Sarcasmo e ironía'), findsOneWidget);
  });

  test('Renamed lessons still provide preparation for the matching question',
      () {
    final hands = QuizDatabase.questions
        .firstWhere((q) => q.id == 'q_visual_posture_steeple');
    expect(ConceptsDatabase.forQuestions([hands]).map((c) => c.title),
        contains('Puntas de los dedos juntas'));
    final smile =
        QuizDatabase.questions.firstWhere((q) => q.id == 'q_visual_duchenne');
    expect(ConceptsDatabase.forQuestions([smile]).map((c) => c.title),
        contains('Sonrisa con arrugas junto a los ojos'));
  });

  test('Shuffled visual answers and explanations do not rely on fixed labels',
      () {
    final label = RegExp(
        r'\b(opción|imagen|figura|expresión|silueta|disposición|sonrisa)\s+[a-d1-4]\b',
        caseSensitive: false);
    for (final q in QuizDatabase.questions.where((q) => q.isImageOptionGrid)) {
      expect(label.hasMatch(q.explanation), isFalse, reason: q.id);
      for (final option in q.options) {
        expect(label.hasMatch(option.text), isFalse, reason: option.id);
      }
    }
  });
}
