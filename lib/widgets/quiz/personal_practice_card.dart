import 'package:flutter/material.dart';
import '../../data/quiz_database.dart';
import '../../screens/quiz_runner_screen.dart';
import '../../state/progress_provider.dart';

class PersonalPracticeCard extends StatelessWidget {
  const PersonalPracticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ProgressProvider();
    return ListenableBuilder(
      listenable: provider,
      builder: (context, _) {
        final scores = provider.progress.quizScores;
        final mistakes = QuizDatabase.questions
            .where((q) => scores.containsKey(q.id) && scores[q.id]! < 100)
            .toList();
        final unseen = QuizDatabase.questions
            .where((q) => !scores.containsKey(q.id))
            .toList();
        final reviewing = mistakes.isNotEmpty;
        final completed = !reviewing && unseen.isEmpty;
        final questions = (reviewing
                ? mistakes
                : completed
                    ? QuizDatabase.questions
                    : unseen)
            .take(5)
            .toList();
        final title = reviewing
            ? 'Repasa a tu ritmo'
            : completed
                ? 'Mantén lo aprendido'
                : 'Tu siguiente paso';
        final colors = Theme.of(context).colorScheme;
        return Card.filled(
          margin: const EdgeInsets.only(bottom: 20),
          color: colors.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(reviewing ? Icons.refresh_rounded : Icons.explore_outlined,
                    color: colors.onPrimaryContainer),
                const SizedBox(height: 12),
                Text(title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: colors.onPrimaryContainer,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                    reviewing
                        ? '${mistakes.length} preguntas para reforzar. Practica sin cronómetro y con una explicación en cada respuesta.'
                        : completed
                            ? 'Ya exploraste todas las preguntas. Una sesión breve te ayudará a recordarlas.'
                            : '${unseen.length} preguntas por descubrir. Avanza con una sesión de hasta 5 preguntas.',
                    style: TextStyle(color: colors.onPrimaryContainer)),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: questions.isEmpty
                      ? null
                      : () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => QuizRunnerScreen(
                                      title: reviewing
                                          ? 'Repaso personal'
                                          : 'Práctica personal',
                                      questions: questions,
                                    )),
                          ),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: Text(
                      reviewing ? 'Repasar errores' : 'Practicar 5 preguntas'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
