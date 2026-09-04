import 'package:flutter/material.dart';

class BoundaryConceptItem {
  final String title;
  final String description;
  final IconData icon;
  final String? badge;

  const BoundaryConceptItem({
    required this.title,
    required this.description,
    required this.icon,
    this.badge,
  });
}

class BoundaryPhase {
  final int phaseNumber;
  final String title;
  final String subtitle;
  final IconData icon;
  final String corePrinciple;
  final List<BoundaryConceptItem> conceptItems;
  final String practicalProtocol;

  const BoundaryPhase({
    required this.phaseNumber,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.corePrinciple,
    required this.conceptItems,
    required this.practicalProtocol,
  });
}
