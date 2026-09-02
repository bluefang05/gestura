class IncongruenceItem {
  final String id;
  final String spokenPhrase;
  final String speakerRole;
  final String illustrationKey;
  final List<String> physicalSignals;
  final bool isCongruent;
  final String realEmotion;
  final String explanation;
  final String recommendedAction;
  final String targetAudience; // 'general', 'autism_focus', 'sales_focus'

  /// Nombre compatible para contenido que se presenta como una hipótesis,
  /// nunca como acceso directo al estado interno de otra persona.
  String get possibleInterpretations => realEmotion;

  const IncongruenceItem({
    required this.id,
    required this.spokenPhrase,
    required this.speakerRole,
    required this.illustrationKey,
    required this.physicalSignals,
    required this.isCongruent,
    required this.realEmotion,
    required this.explanation,
    required this.recommendedAction,
    this.targetAudience = 'general',
  });
}
