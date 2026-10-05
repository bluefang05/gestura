import '../data/gesture_database.dart';
import '../data/quiz_database.dart';
import '../data/scenario_database.dart';

class UserProgress {
  final int currentStreak;
  final int bestStreak;
  final String lastActiveDate; // YYYY-MM-DD
  final List<String> exploredGestureIds;
  final List<String> completedQuizIds;
  final Map<String, int> quizScores; // quizId -> score %
  final List<String> completedScenarioIds;
  final List<String> completedRoadmapStepIds;

  const UserProgress({
    this.currentStreak = 0,
    this.bestStreak = 0,
    this.lastActiveDate = '',
    this.exploredGestureIds = const [],
    this.completedQuizIds = const [],
    this.quizScores = const {},
    this.completedScenarioIds = const [],
    this.completedRoadmapStepIds = const [],
  });

  factory UserProgress.initial() {
    return const UserProgress(
      currentStreak: 0,
      bestStreak: 0,
      lastActiveDate: '',
      exploredGestureIds: [],
      completedQuizIds: [],
      quizScores: {},
      completedScenarioIds: [],
      completedRoadmapStepIds: [],
    );
  }

  static String _formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }

  UserProgress registerActiveDay([DateTime? currentTime]) {
    final now = currentTime ?? DateTime.now();
    final todayStr = _formatDate(now);
    if (lastActiveDate == todayStr) {
      return this;
    }

    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final yesterdayStr = _formatDate(yesterday);
    int newStreak = currentStreak;

    if (lastActiveDate.isEmpty) {
      newStreak = 1;
    } else if (lastActiveDate == yesterdayStr) {
      newStreak = currentStreak + 1;
    } else {
      newStreak = 1;
    }

    final newBest = newStreak > bestStreak ? newStreak : bestStreak;

    return copyWith(
      currentStreak: newStreak,
      bestStreak: newBest,
      lastActiveDate: todayStr,
    );
  }

  UserProgress markGestureExplored(String gestureId) {
    if (exploredGestureIds.contains(gestureId)) {
      return registerActiveDay();
    }
    final updated = List<String>.from(exploredGestureIds)..add(gestureId);
    return copyWith(exploredGestureIds: updated).registerActiveDay();
  }

  UserProgress recordQuizResult(String quizId, int score) {
    final updatedCompleted = List<String>.from(completedQuizIds);
    if (score >= 100 && !updatedCompleted.contains(quizId)) {
      updatedCompleted.add(quizId);
    }
    final updatedScores = Map<String, int>.from(quizScores)
      ..[quizId] = score.clamp(0, 100);

    return copyWith(
      completedQuizIds: updatedCompleted,
      quizScores: updatedScores,
    ).registerActiveDay();
  }

  UserProgress markScenarioCompleted(String scenarioId) {
    final updated = List<String>.from(completedScenarioIds);
    if (!updated.contains(scenarioId)) {
      updated.add(scenarioId);
    }
    return copyWith(completedScenarioIds: updated).registerActiveDay();
  }

  UserProgress markRoadmapStepCompleted(String stepId) {
    if (completedRoadmapStepIds.contains(stepId)) return this;
    return copyWith(
      completedRoadmapStepIds: [...completedRoadmapStepIds, stepId],
    ).registerActiveDay();
  }

  int get totalPoints {
    int points = exploredGestureIds.length * 10;
    quizScores.forEach((_, score) {
      points += score;
    });
    points += completedScenarioIds.length * 50;
    points += currentStreak * 20;
    return points;
  }

  int get totalQuizzesTaken => completedQuizIds.length;

  double get averageQuizAccuracy {
    if (quizScores.isEmpty) return 0.0;
    final total = quizScores.values.reduce((a, b) => a + b);
    return total / quizScores.length;
  }

  int get totalExploredGestures => exploredGestureIds.length;
  int get totalCompletedScenarios => completedScenarioIds.length;
  int get totalCompletedQuizzes => completedQuizIds.length;

  int get totalMilestonesCompleted =>
      totalExploredGestures + totalCompletedScenarios + totalCompletedQuizzes;

  static int get totalPossibleMilestones =>
      GestureDatabase.items.length +
      ScenarioDatabase.scenarios.length +
      QuizDatabase.questions.length;

  double get masteryRatio =>
      (totalMilestonesCompleted / totalPossibleMilestones).clamp(0.0, 1.0);

  int get masteryPercentage => (masteryRatio * 100).toInt();

  String get masteryLevelTitle {
    final pct = masteryPercentage;
    if (pct >= 100) return 'Recorrido completo';
    if (pct >= 75) return 'Casi al final';
    if (pct >= 50) return 'Vas por la mitad';
    if (pct >= 25) return 'Buen avance';
    if (pct >= 10) return 'Ya empezaste';
    return 'Primeros pasos';
  }

  String get motivationalMessage {
    final pct = masteryPercentage;
    if (pct >= 100) {
      return '¡Felicidades! Has completado el 100% de Gestura.';
    }
    if (pct >= 75) {
      return '¡Casi terminas! Te quedan pocos pasos.';
    }
    if (pct >= 50) {
      return '¡Ya pasaste la mitad! Sigue a tu ritmo.';
    }
    if (pct >= 25) {
      return '¡Buen avance! Sigue practicando a tu ritmo.';
    }
    if (pct >= 10) {
      return '¡Buen despegue! Sigue practicando cada día para consolidar el hábito.';
    }
    return '¡Bienvenido! Empieza por el tema que más te interese.';
  }

  UserProgress copyWith({
    int? currentStreak,
    int? bestStreak,
    String? lastActiveDate,
    List<String>? exploredGestureIds,
    List<String>? completedQuizIds,
    Map<String, int>? quizScores,
    List<String>? completedScenarioIds,
    List<String>? completedRoadmapStepIds,
  }) {
    return UserProgress(
      currentStreak: currentStreak ?? this.currentStreak,
      bestStreak: bestStreak ?? this.bestStreak,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      exploredGestureIds: exploredGestureIds ?? this.exploredGestureIds,
      completedQuizIds: completedQuizIds ?? this.completedQuizIds,
      quizScores: quizScores ?? this.quizScores,
      completedScenarioIds: completedScenarioIds ?? this.completedScenarioIds,
      completedRoadmapStepIds:
          completedRoadmapStepIds ?? this.completedRoadmapStepIds,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentStreak': currentStreak,
      'bestStreak': bestStreak,
      'lastActiveDate': lastActiveDate,
      'exploredGestureIds': exploredGestureIds,
      'completedQuizIds': completedQuizIds,
      'quizScores': quizScores,
      'completedScenarioIds': completedScenarioIds,
      'completedRoadmapStepIds': completedRoadmapStepIds,
    };
  }

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    List<String> ids(String key) {
      final value = json[key];
      return value is List
          ? value
              .whereType<String>()
              .where((id) => id.isNotEmpty)
              .toSet()
              .toList()
          : [];
    }

    int nonNegativeInt(Object? value) =>
        value is num && value.isFinite ? value.toInt().clamp(0, 1 << 30) : 0;
    final rawScores = json['quizScores'];
    final scores = <String, int>{};
    if (rawScores is Map) {
      for (final entry in rawScores.entries) {
        final value = entry.value;
        if (entry.key is String && value is num && value.isFinite) {
          scores[entry.key as String] = value.round().clamp(0, 100);
        }
      }
    }
    return UserProgress(
      currentStreak: nonNegativeInt(json['currentStreak']),
      bestStreak: nonNegativeInt(json['bestStreak']),
      lastActiveDate: json['lastActiveDate'] is String
          ? json['lastActiveDate'] as String
          : '',
      exploredGestureIds: ids('exploredGestureIds'),
      completedQuizIds: {...ids('completedQuizIds'), ...scores.keys}.toList(),
      quizScores: scores,
      completedScenarioIds: ids('completedScenarioIds'),
      completedRoadmapStepIds: ids('completedRoadmapStepIds'),
    );
  }
}
