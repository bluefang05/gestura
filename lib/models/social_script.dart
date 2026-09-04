import 'package:flutter/material.dart';

enum SocialScriptCategory {
  work('Laboral', Icons.business_center_rounded),
  social('Social / Eventos', Icons.people_outline_rounded),
  sensory('Sensorial / Espacio', Icons.hearing_rounded),
  pressure('Frenar Presión', Icons.shield_rounded),
  consent('Consentimiento', Icons.handshake_rounded);

  final String label;
  final IconData icon;

  const SocialScriptCategory(this.label, this.icon);
}

enum ScriptFirmness {
  soft('Suave', Icons.filter_1_rounded),
  assertive('Asertivo', Icons.filter_2_rounded),
  firm('Firme', Icons.filter_3_rounded);

  final String label;
  final IconData icon;

  const ScriptFirmness(this.label, this.icon);
}

class SocialScript {
  final String id;
  final String title;
  final SocialScriptCategory category;
  final String contextDescription;
  final String softPhrase;
  final String assertivePhrase;
  final String firmPhrase;
  final String bodyLanguage;
  final String whatNotToDo;

  const SocialScript({
    required this.id,
    required this.title,
    required this.category,
    required this.contextDescription,
    required this.softPhrase,
    required this.assertivePhrase,
    required this.firmPhrase,
    required this.bodyLanguage,
    required this.whatNotToDo,
  });

  String getPhraseByFirmness(ScriptFirmness firmness) {
    switch (firmness) {
      case ScriptFirmness.soft:
        return softPhrase;
      case ScriptFirmness.assertive:
        return assertivePhrase;
      case ScriptFirmness.firm:
        return firmPhrase;
    }
  }
}
