import 'package:flutter/material.dart';
import '../state/progress_provider.dart';
import '../widgets/common/ad_banner_slot.dart';
import '../data/roadmap_database.dart';
import '../core/services/tts_service.dart';

/// Reading lessons need an explicit completion action; Back never completes one.
class RoadmapLessonScreen extends StatefulWidget {
  final String stepId;
  final Widget child;
  final bool showAd;

  const RoadmapLessonScreen({
    super.key,
    required this.stepId,
    required this.child,
    this.showAd = true,
  });

  @override
  State<RoadmapLessonScreen> createState() => _RoadmapLessonScreenState();
}

class _RoadmapLessonScreenState extends State<RoadmapLessonScreen> {
  bool _saving = false;

  Future<void> _complete() async {
    setState(() => _saving = true);
    try {
      await ProgressProvider().markRoadmapStepCompleted(widget.stepId);
      if (mounted) {
        TtsService.stop();
        Navigator.pop(context, true);
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('No se pudo guardar. Inténtalo de nuevo.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.child,
        bottomNavigationBar: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                child: ListenableBuilder(
                  listenable: ProgressProvider(),
                  builder: (context, _) {
                    final steps = RoadmapDatabase.steps;
                    final index =
                        steps.indexWhere((step) => step.id == widget.stepId);
                    final percent = (RoadmapDatabase.completionRatio(
                                ProgressProvider().progress) *
                            100)
                        .round();
                    return Text(
                        'Paso ${index + 1} de ${steps.length} · $percent% completado');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _saving ? null : _complete,
                    child: Text(_saving
                        ? 'Guardando…'
                        : RoadmapDatabase.steps.last.id == widget.stepId
                            ? 'Completar ruta'
                            : 'Completar y continuar'),
                  ),
                ),
              ),
              if (widget.showAd) const AdBannerSlot(),
            ],
          ),
        ),
      );
}
