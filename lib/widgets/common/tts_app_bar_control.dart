import 'package:flutter/material.dart';
import '../../core/services/feedback_service.dart';
import '../../core/services/tts_service.dart';

/// Control accesible y no intrusivo para la barra superior (AppBar)
/// que permite reproducir o detener inmediatamente la lectura en voz alta.
class TtsAppBarControl extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback? onStop;
  final String? activeTag;
  final String tooltipPlay;
  final String tooltipStop;

  const TtsAppBarControl({
    super.key,
    required this.onPlay,
    this.onStop,
    this.activeTag,
    this.tooltipPlay = 'Escuchar lectura en voz alta',
    this.tooltipStop = 'Detener lectura (Silenciar)',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ValueListenableBuilder<bool>(
      valueListenable: TtsService.isSpeakingNotifier,
      builder: (context, isSpeaking, _) {
        if (!isSpeaking) {
          return IconButton(
            icon: const Icon(Icons.volume_up_rounded),
            tooltip: tooltipPlay,
            onPressed: () {
              FeedbackService.lightClick();
              onPlay();
            },
          );
        }

        // Estado activo: Muestra un botón claro y directo de "Detener"
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: isDark
                  ? const Color(0xFFEF4444).withValues(alpha: 0.25)
                  : const Color(0xFFFEE2E2),
              foregroundColor:
                  isDark ? const Color(0xFFFCA5A5) : const Color(0xFFDC2626),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              minimumSize: const Size(0, 36),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(
                  color: isDark
                      ? const Color(0xFFF87171)
                      : const Color(0xFFEF4444),
                  width: 1.2,
                ),
              ),
            ),
            icon: const Icon(Icons.stop_circle_rounded, size: 18),
            label: const Text(
              'Detener',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
            onPressed: () {
              FeedbackService.lightClick();
              TtsService.stop();
              onStop?.call();
            },
          ),
        );
      },
    );
  }
}
