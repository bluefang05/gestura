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
import '../state/progress_provider.dart';
import '../screens/roadmap_lesson_screen.dart';

class RoadmapDatabase {
  static final List<RoadmapLevel> levels = [
    // ==========================================
    // NIVEL 1: LA REGLA CERO (OBSERVAR SIN SESGO)
    // ==========================================
    RoadmapLevel(
      levelNumber: 1,
      title: 'Nivel 1: Observar con calma',
      objective:
          'Aprende a observar sin juzgar: conoce cómo suele expresarse una persona y pregunta si algo no está claro.',
      icon: Icons.hub_rounded,
      steps: [
        RoadmapStep(
          id: 'step_baseline',
          levelNumber: 1,
          stepNumber: 1,
          title: 'Observar sin sacar conclusiones',
          subtitle:
              'Observa la situación, escucha las palabras y pregunta si necesitas aclarar algo.',
          icon: Icons.hub_rounded,
          destination: RoadmapDestination.clusterBaseline,
        ),
        RoadmapStep(
          id: 'step_first_quiz',
          levelNumber: 1,
          stepNumber: 2,
          title: 'Primera práctica con imágenes',
          subtitle: 'Reconoce posiciones de manos, brazos y cara en imágenes.',
          icon: Icons.psychology_rounded,
          destination: RoadmapDestination.visualQuiz,
        ),
      ],
    ),

    // ==========================================
    // NIVEL 2: GESTOS DE LA CARA, LOS BRAZOS Y LAS MANOS
    // ==========================================
    RoadmapLevel(
      levelNumber: 2,
      title: 'Nivel 2: Cara, brazos y manos',
      objective:
          'Reconoce movimientos de los ojos, la cara, los brazos y las manos.',
      icon: Icons.accessibility_new_rounded,
      steps: [
        RoadmapStep(
          id: 'step_eyes',
          levelNumber: 2,
          stepNumber: 3,
          title: 'Miradas y cejas',
          subtitle:
              'Cada persona mira de una manera distinta. No hace falta exigir contacto visual.',
          icon: Icons.remove_red_eye_rounded,
          destination: RoadmapDestination.dictionaryEyes,
        ),
        RoadmapStep(
          id: 'step_hands_torso',
          levelNumber: 2,
          stepNumber: 4,
          title: 'Brazos y manos',
          subtitle:
              'Observa cómo coloca los brazos y las manos. No adivines lo que piensa.',
          icon: Icons.pan_tool_rounded,
          destination: RoadmapDestination.dictionaryHands,
        ),
      ],
    ),

    // ==========================================
    // NIVEL 3: FRASES Y COSTUMBRES COTIDIANAS
    // ==========================================
    RoadmapLevel(
      levelNumber: 3,
      title: 'Nivel 3: Frases y contexto',
      objective:
          'Practica cómo responder a frases y situaciones cotidianas. Si no entiendes, puedes preguntar.',
      icon: Icons.auto_stories_rounded,
      steps: [
        RoadmapStep(
          id: 'step_smalltalk',
          levelNumber: 3,
          stepNumber: 5,
          title: 'Conversaciones breves y cotidianas',
          subtitle:
              'Practica cómo empezar una charla breve o decir que prefieres hablar después.',
          icon: Icons.chat_bubble_outline_rounded,
          destination: RoadmapDestination.unwrittenSmallTalk,
        ),
        RoadmapStep(
          id: 'step_indirects',
          levelNumber: 3,
          stepNumber: 6,
          title: 'Frases que pueden tener más de un sentido',
          subtitle:
              'Practica cómo pedir una aclaración. Una misma frase puede tener distintos sentidos.',
          icon: Icons.transform_rounded,
          destination: RoadmapDestination.unwrittenIndirects,
        ),
      ],
    ),

    // ==========================================
    // NIVEL 4: BLINDAJE SOCIAL Y CONSENTIMIENTO REAL
    // ==========================================
    RoadmapLevel(
      levelNumber: 4,
      title: 'Nivel 4: Límites y consentimiento',
      objective:
          'Practica cómo expresar tus límites y respetar la respuesta de otras personas.',
      icon: Icons.shield_rounded,
      steps: [
        RoadmapStep(
          id: 'step_boundaries',
          levelNumber: 4,
          stepNumber: 7,
          title: 'Cómo expresar un límite',
          subtitle:
              'Di qué ocurrió, cómo te afecta y qué necesitas que cambie.',
          icon: Icons.shield_outlined,
          destination: RoadmapDestination.boundariesMethod,
        ),
        RoadmapStep(
          id: 'step_consent',
          levelNumber: 4,
          stepNumber: 8,
          title: 'Aceptar algo por presión',
          subtitle:
              'Una persona puede aceptar por presión. Pregunta con claridad y respeta si cambia de opinión.',
          icon: Icons.handshake_rounded,
          destination: RoadmapDestination.boundariesConsent,
        ),
      ],
    ),

    // ==========================================
    // NIVEL 5: MUNDO REAL, NEGOCIACIÓN Y CAMPO
    // ==========================================
    RoadmapLevel(
      levelNumber: 5,
      title: 'Nivel 5: Situaciones cotidianas',
      objective:
          'Practica en situaciones de trabajo, ventas y momentos difíciles.',
      icon: Icons.flash_on_rounded,
      steps: [
        RoadmapStep(
          id: 'step_incongruences',
          levelNumber: 5,
          stepNumber: 9,
          title: 'Cuando palabras y gestos parecen distintos',
          subtitle:
              'Describe lo que ves y pregunta si necesitas entender mejor.',
          icon: Icons.psychology_alt_rounded,
          destination: RoadmapDestination.incongruenceDetector,
        ),
        RoadmapStep(
          id: 'step_sales_negotiation',
          levelNumber: 5,
          stepNumber: 10,
          title: 'Una reunión de ventas, paso a paso',
          subtitle:
              'Escucha preguntas, responde con claridad y deja tiempo para decidir.',
          icon: Icons.trending_up_rounded,
          destination: RoadmapDestination.salesTrack,
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
        ),
      ],
    ),
  ];

  static RoadmapStep getCurrentActiveStep(UserProgress progress) {
    for (final level in levels) {
      for (final step in level.steps) {
        if (!step.isCompleted(progress)) {
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

  static Future<void> navigateToDestination(
    BuildContext context,
    RoadmapDestination destination, {
    String? roadmapStepId,
  }) async {
    final Widget screen;
    switch (destination) {
      case RoadmapDestination.clusterBaseline:
        screen = const ClusterBaselineScreen();
        break;
      case RoadmapDestination.visualQuiz:
        final questions = QuizDatabase.getImageCardQuestions();
        screen = QuizRunnerScreen(
          title: 'Test Visual',
          questions: questions.isNotEmpty ? questions : QuizDatabase.questions,
          onCompleted: roadmapStepId == null
              ? null
              : () {
                  ProgressProvider().markRoadmapStepCompleted(roadmapStepId);
                },
        );
        break;
      case RoadmapDestination.dictionaryEyes:
        screen = const DictionaryScreen(
            initialCategory: CategoryType.expresionesFaciales);
        break;
      case RoadmapDestination.dictionaryHands:
        screen = const DictionaryScreen(
            initialCategory: CategoryType.lenguajeCorporal);
        break;
      case RoadmapDestination.unwrittenSmallTalk:
        screen = const UnwrittenRulesScreen(initialTab: 0);
        break;
      case RoadmapDestination.unwrittenIndirects:
        screen = const UnwrittenRulesScreen(initialTab: 1);
        break;
      case RoadmapDestination.boundariesMethod:
        screen = const UnwrittenRulesScreen(initialTab: 4, initialSubView: 0);
        break;
      case RoadmapDestination.boundariesConsent:
        screen = const UnwrittenRulesScreen(
            initialTab: 4,
            initialSubView: 1,
            initialCategory: SocialScriptCategory.consent);
        break;
      case RoadmapDestination.incongruenceDetector:
        screen = const IncongruenceDetectorScreen();
        break;
      case RoadmapDestination.salesTrack:
        screen = const BuyerTemperatureScreen();
        break;
      case RoadmapDestination.emergencyMode:
        screen = const EmergencyModeScreen();
        break;
      case RoadmapDestination.scenarioRunner:
        screen = const ScenariosScreen();
        break;
    }
    await Navigator.push<void>(
        context,
        MaterialPageRoute(
          builder: (_) => roadmapStepId != null &&
                  destination != RoadmapDestination.visualQuiz
              ? RoadmapLessonScreen(
                  stepId: roadmapStepId,
                  showAd: destination != RoadmapDestination.salesTrack &&
                      destination != RoadmapDestination.incongruenceDetector &&
                      destination != RoadmapDestination.emergencyMode,
                  child: screen,
                )
              : screen,
        ));
  }
}
