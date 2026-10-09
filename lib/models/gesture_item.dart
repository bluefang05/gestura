import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import 'category.dart';

enum GestureReading {
  possibleOpenness(
    'Posible apertura',
    AppColors.primary,
    Icons.chat_bubble_outline_rounded,
    'Posible apertura',
    'Puede indicar disposición a interactuar; no confirma acuerdo.',
  ),
  ambiguous(
    'Lectura ambigua',
    AppColors.primary,
    Icons.help_outline_rounded,
    'Lectura ambigua',
    'Puede tener varias explicaciones. Pregunta si necesitas claridad.',
  ),
  possibleTension(
    'Posible tensión o incomodidad',
    AppColors.primary,
    Icons.info_outline_rounded,
    'Posible tensión',
    'Puede acompañar tensión; no demuestra rechazo.',
  );

  final String label;
  final Color color;
  final IconData icon;
  final String shortState;
  final String actionAdvice;

  const GestureReading(
    this.label,
    this.color,
    this.icon,
    this.shortState,
    this.actionAdvice,
  );
}

class GestureItem {
  final String id;
  final String name;
  final CategoryType category;
  final String
      bodyPart; // Ojos, Boca, Cejas, Voz, Brazos, Torso, Espacio, Digital
  final String summary;
  final String physiologicalDetails;
  final String probableMeaning;
  final List<String> alternativeMeanings;
  final String contextGuidance;
  final String whatToDo;
  final String salesTip;
  final String illustrationKey;
  final int difficulty; // 1: Fácil, 2: Intermedio, 3: Sutil
  final GestureReading reading;

  const GestureItem({
    required this.id,
    required this.name,
    required this.category,
    required this.bodyPart,
    required this.summary,
    required this.physiologicalDetails,
    required this.probableMeaning,
    required this.alternativeMeanings,
    required this.contextGuidance,
    required this.whatToDo,
    required this.salesTip,
    required this.illustrationKey,
    this.difficulty = 1,
    this.reading = GestureReading.ambiguous,
  });

  /// Backwards-compatible alias for older callers.
  @Deprecated('Use reading instead.')
  GestureReading get signalType => reading;

  /// Pista visual física concisa para decodificación en 1 segundo (sin párrafos).
  String get quickVisualClue {
    final match = RegExp(r'[.;]').firstMatch(physiologicalDetails);
    if (match != null && match.start > 10 && match.start < 120) {
      return physiologicalDetails.substring(0, match.start).trim();
    }
    if (physiologicalDetails.length > 100) {
      final space = physiologicalDetails.indexOf(' ', 80);
      if (space != -1) {
        return '${physiologicalDetails.substring(0, space)}...';
      }
    }
    return physiologicalDetails.trim();
  }

  /// Significado directo en 1 frase de impacto inmediato.
  String get quickMeaning {
    final match = RegExp(r'[.;]').firstMatch(probableMeaning);
    if (match != null && match.start > 10 && match.start < 110) {
      return probableMeaning.substring(0, match.start).trim();
    }
    if (probableMeaning.length > 90) {
      final space = probableMeaning.indexOf(' ', 75);
      if (space != -1) {
        return '${probableMeaning.substring(0, space)}...';
      }
    }
    return probableMeaning.trim();
  }

  /// Acción táctica recomendada en 1 línea directa.
  String get quickAction {
    final match = RegExp(r'[.;]').firstMatch(whatToDo);
    if (match != null && match.start > 10 && match.start < 110) {
      return whatToDo.substring(0, match.start).trim();
    }
    if (whatToDo.length > 90) {
      final space = whatToDo.indexOf(' ', 75);
      if (space != -1) {
        return '${whatToDo.substring(0, space)}...';
      }
    }
    return whatToDo.trim();
  }

  /// Síntesis de voz express (8-10 segundos) para escuchar sin necesidad de leer.
  String get expressAudioSummary {
    return '$name. Lectura orientativa: ${reading.label}. En lo físico: $quickVisualClue. Puede significar: $quickMeaning. Una respuesta posible: $quickAction.';
  }

  /// Etiqueta legible del nivel de dificultad / sutileza del gesto.
  String get difficultyLabel => switch (difficulty) {
        1 => 'Nivel Básico',
        2 => 'Nivel Intermedio',
        3 => 'Nivel Sutil',
        _ => 'Nivel Básico',
      };

  /// Color semántico según la sutileza del gesto.
  Color get difficultyColor => switch (difficulty) {
        1 => AppColors.emerald,
        2 => AppColors.warning,
        3 => AppColors.purple,
        _ => AppColors.primary,
      };
}
