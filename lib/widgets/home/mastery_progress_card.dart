import 'package:flutter/material.dart';
import '../../core/services/tts_service.dart';
import '../../data/roadmap_database.dart';
import '../../screens/progress_screen.dart';
import '../../state/progress_provider.dart';
import '../common/app_card.dart';

/// Course progress is independent of catalog exploration.
class MasteryProgressCard extends StatelessWidget {
  final bool showRouteButton;
  const MasteryProgressCard({super.key, this.showRouteButton = true});

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: ProgressProvider(),
        builder: (context, _) {
          final theme = Theme.of(context);
          final progress = ProgressProvider().progress;
          final total = RoadmapDatabase.steps.length;
          final completed = RoadmapDatabase.completedStepsCount(progress);
          final ratio = RoadmapDatabase.completionRatio(progress);
          final percentage = (ratio * 100).round();
          final done = completed == total;
          final step = RoadmapDatabase.getCurrentActiveStep(progress);
          final summary = '$percentage% de la ruta completado. '
              '$completed de $total pasos completados. '
              '${done ? 'Ruta completada. Puedes repasar cualquier tema.' : 'Siguiente: ${step.title}. ${step.subtitle}'}';

          return AppCard(
            borderSide: BorderSide(color: theme.colorScheme.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: Text('Ruta de aprendizaje',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700)),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: TtsService.isSpeakingNotifier,
                    builder: (context, speaking, _) => IconButton(
                      tooltip:
                          speaking ? 'Detener lectura' : 'Escuchar progreso',
                      icon: Icon(speaking
                          ? Icons.stop_circle_outlined
                          : Icons.volume_up_outlined,
                          color: theme.colorScheme.onSurface),
                      onPressed: () => speaking
                          ? TtsService.stop()
                          : TtsService.speakSpanish(summary,
                              gestureId: 'roadmap_progress'),
                    ),
                  ),
                ]),
                Text('$percentage% · $completed de $total pasos completados',
                    style: theme.textTheme.bodyMedium),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: ratio,
                  color: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.12),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(8),
                  semanticsLabel: 'Progreso de la ruta de aprendizaje',
                  semanticsValue: '$percentage%',
                ),
                const SizedBox(height: 16),
                Text(
                    done
                        ? 'Ruta completada'
                        : 'Siguiente · Paso ${step.stepNumber}',
                    style: theme.textTheme.labelLarge),
                const SizedBox(height: 4),
                Text(done ? 'Todos los temas completados' : step.title,
                    style: theme.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(
                    done
                        ? 'Puedes repasar cualquier tema o seguir con la práctica libre.'
                        : step.subtitle,
                    style: theme.textTheme.bodyMedium),
                const SizedBox(height: 16),
                if (!done)
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => RoadmapDatabase.navigateToDestination(
                        context,
                        step.destination,
                        roadmapStepId: step.id,
                      ),
                      icon: const Icon(Icons.arrow_forward_rounded),
                      label: Text(
                          completed == 0 ? 'Empezar ruta' : 'Continuar ruta'),
                    ),
                  ),
                if (showRouteButton)
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {
                        TtsService.stop();
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (_) => const ProgressScreen(),
                            ));
                      },
                      icon: const Icon(Icons.map_outlined),
                      label:
                          Text(done ? 'Repasar ruta' : 'Ver todos los pasos'),
                    ),
                  ),
              ],
            ),
          );
        },
      );
}
