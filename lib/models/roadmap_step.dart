import 'package:flutter/material.dart';
import 'user_progress.dart';

enum RoadmapDestination {
  clusterBaseline,
  visualQuiz,
  dictionaryEyes,
  dictionaryHands,
  unwrittenSmallTalk,
  unwrittenIndirects,
  boundariesMethod,
  boundariesConsent,
  incongruenceDetector,
  scenarioRunner,
  salesTrack,
  emergencyMode,
}

enum RoadmapStepStatus {
  completed,
  current,
  locked,
}

class RoadmapStep {
  final String id;
  final int levelNumber;
  final int stepNumber;
  final String title;
  final String subtitle;
  final IconData icon;
  final RoadmapDestination destination;
  final bool Function(UserProgress progress) isCompletedCheck;

  const RoadmapStep({
    required this.id,
    required this.levelNumber,
    required this.stepNumber,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.destination,
    required this.isCompletedCheck,
  });

  RoadmapStepStatus getStatus(UserProgress progress, bool isPreviousCompleted) {
    if (isCompleted(progress)) {
      return RoadmapStepStatus.completed;
    }
    if (isPreviousCompleted) {
      return RoadmapStepStatus.current;
    }
    return RoadmapStepStatus.locked;
  }

  bool isCompleted(UserProgress progress) =>
      progress.completedRoadmapStepIds.contains(id) ||
      isCompletedCheck(progress);
}

class RoadmapLevel {
  final int levelNumber;
  final String title;
  final String objective;
  final IconData icon;
  final List<RoadmapStep> steps;

  const RoadmapLevel({
    required this.levelNumber,
    required this.title,
    required this.objective,
    required this.icon,
    required this.steps,
  });

  bool isLevelCompleted(UserProgress progress) {
    return steps.every((s) => s.isCompleted(progress));
  }

  int completedStepsCount(UserProgress progress) {
    return steps.where((s) => s.isCompleted(progress)).length;
  }
}
