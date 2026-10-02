import 'package:flutter/material.dart';
import '../state/progress_provider.dart';
import '../widgets/common/ad_banner_slot.dart';

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
      if (mounted) Navigator.pop(context);
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
                padding: const EdgeInsets.all(12),
                child: FilledButton(
                  onPressed: _saving ? null : _complete,
                  child: Text(_saving
                      ? 'Guardando…'
                      : 'Completar tema y volver a la ruta'),
                ),
              ),
              if (widget.showAd) const AdBannerSlot(),
            ],
          ),
        ),
      );
}
