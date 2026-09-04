import 'package:flutter/material.dart';

class SalesPhaseItem {
  final int phaseNumber;
  final String title;
  final String timing;
  final String objective;
  final IconData icon;
  final List<String> clientSignalsToWatch;
  final List<String> yourBodyLanguage;
  final String keyRule;

  const SalesPhaseItem({
    required this.phaseNumber,
    required this.title,
    required this.timing,
    required this.objective,
    required this.icon,
    required this.clientSignalsToWatch,
    required this.yourBodyLanguage,
    required this.keyRule,
  });
}

class SalesObjectionScript {
  final String id;
  final String title;
  final String objectionPhrase;
  final String context;
  final String softResponse;
  final String assertiveResponse;
  final String firmResponse;
  final String bodyLanguage;
  final String whatNotToDo;

  const SalesObjectionScript({
    required this.id,
    required this.title,
    required this.objectionPhrase,
    required this.context,
    required this.softResponse,
    required this.assertiveResponse,
    required this.firmResponse,
    required this.bodyLanguage,
    required this.whatNotToDo,
  });
}
