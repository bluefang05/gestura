import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import 'category.dart';

enum SignalTrafficLight {
  green(
    'Luz Verde (Receptividad)',
    AppColors.success,
    Icons.check_circle_rounded,
    'Receptivo',
    'Avanza con confianza',
  ),
  yellow(
    'Luz Amarilla (Precaución / Duda)',
    AppColors.warning,
    Icons.warning_rounded,
    'Precaución',
    'Pausa y sondea',
  ),
  red(
    'Luz Roja (Objeción / Barrera)',
    AppColors.error,
    Icons.cancel_rounded,
    'Barrera',
    'Baja la presión',
  );

  final String label;
  final Color color;
  final IconData icon;
  final String shortState;
  final String actionAdvice;

  const SignalTrafficLight(
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
  final SignalTrafficLight signalType;

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
    this.signalType = SignalTrafficLight.green,
  });

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
    final lightName = switch (signalType) {
      SignalTrafficLight.green => 'Señal verde, receptividad.',
      SignalTrafficLight.yellow => 'Señal amarilla, evaluación o cautela.',
      SignalTrafficLight.red => 'Señal roja, barrera o tensión.',
    };
    return '$name. $lightName En lo físico: $quickVisualClue. Suele reflejar: $quickMeaning. Tu mejor jugada: $quickAction.';
  }
}
