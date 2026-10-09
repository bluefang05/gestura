import 'package:flutter/material.dart';
import '../../data/communication_evidence_database.dart';
import '../../core/services/tts_service.dart';
import 'app_card.dart';

class CommunicationEvidenceCard extends StatelessWidget {
  final CommunicationEvidence evidence;
  const CommunicationEvidenceCard({super.key, required this.evidence});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Qué aporta la fuente',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(evidence.sourceKind,
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Text(evidence.finding),
          const SizedBox(height: 12),
          const Text('Alcance del resultado',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(evidence.limits),
          const SizedBox(height: 12),
          const Text('Una aplicación posible',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(evidence.practicalUse),
          const SizedBox(height: 12),
          Text(evidence.sourceTitle,
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          SelectableText(evidence.sourceUrl,
              style: Theme.of(context).textTheme.bodySmall),
          for (final url in evidence.additionalSourceUrls) ...[
            const SizedBox(height: 4),
            SelectableText(url, style: Theme.of(context).textTheme.bodySmall),
          ],
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => TtsService.speakSpanish(evidence.spokenSummary),
            icon: const Icon(Icons.volume_up_outlined),
            label: const Text('Escuchar el hallazgo y sus límites'),
          ),
        ],
      ),
    );
  }
}
