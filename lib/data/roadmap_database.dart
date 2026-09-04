import 'package:flutter/material.dart';
import '../models/roadmap_step.dart';
import '../models/user_progress.dart';
import '../screens/cluster_baseline_screen.dart';
import '../screens/quiz_runner_screen.dart';
import '../screens/dictionary_screen.dart';
import '../screens/unwritten_rules_screen.dart';
import '../screens/incongruence_detector_screen.dart';
import '../screens/buyer_temperature_screen.dart';
import '../screens/emergency_mode_screen.dart';
import '../data/quiz_database.dart';
import '../models/social_script.dart';
import '../models/category.dart';
import '../screens/scenarios_screen.dart';

class RoadmapDatabase {
  static final List<RoadmapLevel> levels = [
    // ==========================================
    // NIVEL 1: LA REGLA CERO (OBSERVAR SIN SESGO)
    // ==========================================
    RoadmapLevel(
      levelNumber: 1,
      title: 'Nivel 1: La Regla Cero',
      objective:
          'Aprende a observar sin juzgar: calibrar la línea base y la regla de las 3 señales.',
      icon: Icons.hub_rounded,
      steps: [
        RoadmapStep(
          id: 'step_baseline',
          levelNumber: 1,
          stepNumber: 1,
          title: 'Calibrar la Línea Base & Clusters',
          subtitle:
              'Nunca asumas un gesto aislado: busca el estado neutro y 3 señales coincidentes.',
          icon: Icons.hub_rounded,
          destination: RoadmapDestination.clusterBaseline,
          isCompletedCheck: (p) => p.exploredGestureIds.isNotEmpty,
        ),
        RoadmapStep(
          id: 'step_first_quiz',
          levelNumber: 1,
          stepNumber: 2,
          title: 'Primer Test Visual de Microexpresiones',
          subtitle:
              'Distingue emociones básicas en tarjetas visuales de alto contraste.',
          icon: Icons.psychology_rounded,
          destination: RoadmapDestination.visualQuiz,
          isCompletedCheck: (p) => p.totalQuizzesTaken >= 1,
        ),
      ],
    ),

    // ==========================================
    // NIVEL 2: EL ALFABETO NO VERBAL PRIMARIO
    // ==========================================
    RoadmapLevel(
      levelNumber: 2,
      title: 'Nivel 2: El Alfabeto No Verbal',
      objective:
          'Identifica las señales físicas involuntarias en ojos, rostro y extremidades.',
      icon: Icons.accessibility_new_rounded,
      steps: [
        RoadmapStep(
          id: 'step_eyes',
          levelNumber: 2,
          stepNumber: 3,
          title: 'El Canal Visual: Ojos y Cejas',
          subtitle:
              'Aprende a diferenciar el contacto visual de confort vs sobrecarga o desvío.',
          icon: Icons.remove_red_eye_rounded,
          destination: RoadmapDestination.dictionaryEyes,
          isCompletedCheck: (p) => p.exploredGestureIds.length >= 5,
        ),
        RoadmapStep(
          id: 'step_hands_torso',
          levelNumber: 2,
          stepNumber: 4,
          title: 'Brazos, Manos y Barreras Corporales',
          subtitle:
              'Postura abierta, manos visibles y barreras defensivas con objetos.',
          icon: Icons.pan_tool_rounded,
          destination: RoadmapDestination.dictionaryHands,
          isCompletedCheck: (p) => p.exploredGestureIds.length >= 10,
        ),
      ],
    ),

    // ==========================================
    // NIVEL 3: EL CÓDIGO OCULTO (EL MUNDO NEUROTÍPICO)
    // ==========================================
    RoadmapLevel(
      levelNumber: 3,
      title: 'Nivel 3: El Código Oculto',
      objective:
          'Decodifica las reglas no escritas donde las palabras no significan lo literal.',
      icon: Icons.auto_stories_rounded,
      steps: [
        RoadmapStep(
          id: 'step_smalltalk',
          levelNumber: 3,
          stepNumber: 5,
          title: 'El Mito del Small Talk',
          subtitle:
              'El ping de red que comunica que el canal está en paz, no un examen.',
          icon: Icons.chat_bubble_outline_rounded,
          destination: RoadmapDestination.unwrittenSmallTalk,
          isCompletedCheck: (p) => p.exploredGestureIds.length >= 15,
        ),
        RoadmapStep(
          id: 'step_indirects',
          levelNumber: 3,
          stepNumber: 6,
          title: 'Decodificador de Indirectas Cotidianas',
          subtitle:
              'Traduce fórmulas de cortesía social a lo que la persona realmente necesita.',
          icon: Icons.transform_rounded,
          destination: RoadmapDestination.unwrittenIndirects,
          isCompletedCheck: (p) => p.totalCompletedQuizzes >= 2,
        ),
      ],
    ),

    // ==========================================
    // NIVEL 4: BLINDAJE SOCIAL Y CONSENTIMIENTO REAL
    // ==========================================
    RoadmapLevel(
      levelNumber: 4,
      title: 'Nivel 4: Blindaje y Consentimiento',
      objective:
          'Aprende a marcar tus límites sin culpa y a no presionar jamás por desgaste.',
      icon: Icons.shield_rounded,
      steps: [
        RoadmapStep(
          id: 'step_boundaries',
          levelNumber: 4,
          stepNumber: 7,
          title: 'El Arte de Marcar Límites (Fórmula E-I-A)',
          subtitle:
              'Hecho observable, impacto y acción declarada sin sonrisas de disculpa.',
          icon: Icons.shield_outlined,
          destination: RoadmapDestination.boundariesMethod,
          isCompletedCheck: (p) => p.masteryPercentage >= 15,
        ),
        RoadmapStep(
          id: 'step_consent',
          levelNumber: 4,
          stepNumber: 8,
          title: 'Consentimiento Real: Decodificar el Falso Sí',
          subtitle:
              'Aprende a leer el apaciguamiento y a ofrecer siempre puertas de escape airosas.',
          icon: Icons.handshake_rounded,
          destination: RoadmapDestination.boundariesConsent,
          isCompletedCheck: (p) => p.masteryPercentage >= 20,
        ),
      ],
    ),

    // ==========================================
    // NIVEL 5: MUNDO REAL, NEGOCIACIÓN Y CAMPO
    // ==========================================
    RoadmapLevel(
      levelNumber: 5,
      title: 'Nivel 5: Mundo Real y Campo',
      objective:
          'Pon a prueba tus habilidades en situaciones de presión, ventas y emergencias.',
      icon: Icons.flash_on_rounded,
      steps: [
        RoadmapStep(
          id: 'step_incongruences',
          levelNumber: 5,
          stepNumber: 9,
          title: 'Detector de Incongruencias Reales',
          subtitle:
              'Distingue cuando las palabras de la persona dicen una cosa pero el cuerpo otra.',
          icon: Icons.psychology_alt_rounded,
          destination: RoadmapDestination.incongruenceDetector,
          isCompletedCheck: (p) =>
              p.totalCompletedScenarios >= 1 || p.totalCompletedQuizzes >= 3,
        ),
        RoadmapStep(
          id: 'step_sales_negotiation',
          levelNumber: 5,
          stepNumber: 10,
          title: 'Ruta de Negociación y Ventas (Pipeline 4 Fases)',
          subtitle:
              'Calibración en tiempo real, manejo de objeciones y la regla del silencio.',
          icon: Icons.trending_up_rounded,
          destination: RoadmapDestination.salesTrack,
          isCompletedCheck: (p) => p.totalCompletedScenarios >= 2,
        ),
        RoadmapStep(
          id: 'step_emergency_sos',
          levelNumber: 5,
          stepNumber: 11,
          title: 'Modo Emergencia / Campo',
          subtitle:
              'Kit de supervivencia de 30 segundos antes de entrar por la puerta.',
          icon: Icons.flash_on_rounded,
          destination: RoadmapDestination.emergencyMode,
          isCompletedCheck: (p) => p.totalCompletedScenarios >= 3,
        ),
      ],
    ),
  ];

  static RoadmapStep getCurrentActiveStep(UserProgress progress) {
    for (final level in levels) {
      for (final step in level.steps) {
        if (!step.isCompletedCheck(progress)) {
          return step;
        }
      }
    }
    // Si completó todo, devuelve el último paso de maestría
    return levels.last.steps.last;
  }

  static RoadmapLevel getCurrentActiveLevel(UserProgress progress) {
    for (final level in levels) {
      if (!level.isLevelCompleted(progress)) {
        return level;
      }
    }
    return levels.last;
  }

  static void navigateToDestination(
      BuildContext context, RoadmapDestination destination) {
    switch (destination) {
      case RoadmapDestination.clusterBaseline:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ClusterBaselineScreen()),
        );
        break;
      case RoadmapDestination.visualQuiz:
        final questions = QuizDatabase.getImageCardQuestions();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => QuizRunnerScreen(
              title: 'Test Visual',
              questions:
                  questions.isNotEmpty ? questions : QuizDatabase.questions,
            ),
          ),
        );
        break;
      case RoadmapDestination.dictionaryEyes:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DictionaryScreen(
              initialCategory: CategoryType.expresionesFaciales,
            ),
          ),
        );
        break;
      case RoadmapDestination.dictionaryHands:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const DictionaryScreen(
              initialCategory: CategoryType.lenguajeCorporal,
            ),
          ),
        );
        break;
      case RoadmapDestination.unwrittenSmallTalk:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const UnwrittenRulesScreen(initialTab: 0),
          ),
        );
        break;
      case RoadmapDestination.unwrittenIndirects:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const UnwrittenRulesScreen(initialTab: 1),
          ),
        );
        break;
      case RoadmapDestination.boundariesMethod:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const UnwrittenRulesScreen(
              initialTab: 4,
              initialSubView: 0,
            ),
          ),
        );
        break;
      case RoadmapDestination.boundariesConsent:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const UnwrittenRulesScreen(
              initialTab: 4,
              initialSubView: 1,
              initialCategory: SocialScriptCategory.consent,
            ),
          ),
        );
        break;
      case RoadmapDestination.incongruenceDetector:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const IncongruenceDetectorScreen()),
        );
        break;
      case RoadmapDestination.salesTrack:
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => const BuyerTemperatureScreen()),
        );
        break;
      case RoadmapDestination.emergencyMode:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmergencyModeScreen()),
        );
        break;
      case RoadmapDestination.scenarioRunner:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ScenariosScreen()),
        );
        break;
    }
  }
}
