enum SignalRelationship {
  aligned,
  mixed,
  ambiguous,
  contextDependent;

  String get label {
    switch (this) {
      case SignalRelationship.aligned:
        return 'Señales Alineadas';
      case SignalRelationship.mixed:
        return 'Señales Mixtas';
      case SignalRelationship.ambiguous:
        return 'Señales Ambiguas';
      case SignalRelationship.contextDependent:
        return 'Dependiente del Contexto';
    }
  }
}

class IncongruenceItem {
  final String id;
  final String spokenPhrase;
  final String speakerRole;
  final String illustrationKey;
  final List<String> physicalSignals;
  final SignalRelationship relationship;
  final List<String> possibleInterpretations;
  final String explanation;
  final String recommendedAction;
  final String targetAudience; // 'general', 'autism_focus', 'sales_focus'

  /// Indica si las palabras y las señales corporales van en la misma dirección observable.
  bool get isAligned => relationship == SignalRelationship.aligned;

  /// Alias de retrocompatibilidad con la API anterior.
  bool get isCongruent => isAligned;

  /// Alias de retrocompatibilidad que concatena las hipótesis plausibles.
  String get realEmotion => possibleInterpretations.join(' / ');

  const IncongruenceItem({
    required this.id,
    required this.spokenPhrase,
    required this.speakerRole,
    required this.illustrationKey,
    required this.physicalSignals,
    required this.relationship,
    required this.possibleInterpretations,
    required this.explanation,
    required this.recommendedAction,
    this.targetAudience = 'general',
  });
}
