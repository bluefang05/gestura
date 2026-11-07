import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/feedback_service.dart';
import '../../core/services/storage_service.dart';
import '../../core/services/tts_service.dart';
import '../common/app_card.dart';

class QuizFeedbackSheet extends StatefulWidget {
  final String? correctAnswer;
  final bool isCorrect;
  final String keyVisualClue;
  final String explanation;
  final VoidCallback onContinue;

  const QuizFeedbackSheet({
    super.key,
    this.correctAnswer,
    required this.isCorrect,
    required this.keyVisualClue,
    required this.explanation,
    required this.onContinue,
  });

  @override
  State<QuizFeedbackSheet> createState() => _QuizFeedbackSheetState();
}

class _QuizFeedbackSheetState extends State<QuizFeedbackSheet> {
  final _scrollController = ScrollController();
  bool _hasMore = false;

  void _updateScrollHint(ScrollMetrics metrics) {
    final more = metrics.extentAfter > 1;
    if (more == _hasMore) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && more != _hasMore) setState(() => _hasMore = more);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _read() => TtsService.speakQuizFeedback(
        correctAnswer: widget.correctAnswer,
        isCorrect: widget.isCorrect,
        keyVisualClue: widget.keyVisualClue,
        explanation: widget.explanation,
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted &&
          StorageService.getAutoNarration() &&
          ModalRoute.of(context)?.isCurrent == true) {
        _read();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final titleColor = isDark
        ? (widget.isCorrect ? const Color(0xFF6EE7B7) : const Color(0xFFFCA5A5))
        : (widget.isCorrect
            ? const Color(0xFF065F46)
            : const Color(0xFF991B1B));
    final foreground =
        isDark ? AppColors.textPrimaryDark : const Color(0xFF1F2937);

    return PopScope<void>(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) TtsService.stop();
      },
      child: Semantics(
        liveRegion: true,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: NotificationListener<ScrollMetricsNotification>(
                    onNotification: (notification) {
                      _updateScrollHint(notification.metrics);
                      return false;
                    },
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        _updateScrollHint(notification.metrics);
                        return false;
                      },
                      child: Scrollbar(
                        controller: _scrollController,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(children: [
                                Icon(
                                    widget.isCorrect
                                        ? Icons.check_circle_rounded
                                        : Icons.info_rounded,
                                    color: titleColor,
                                    size: 28),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: Text(
                                  widget.isCorrect
                                      ? 'Respuesta correcta'
                                      : 'Respuesta para repasar',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: titleColor),
                                )),
                                ValueListenableBuilder<bool>(
                                  valueListenable:
                                      TtsService.isSpeakingNotifier,
                                  builder: (context, speaking, _) => IconButton(
                                    tooltip: speaking
                                        ? 'Detener lectura'
                                        : 'Escuchar explicación',
                                    icon: Icon(
                                        speaking
                                            ? Icons.stop_circle_rounded
                                            : Icons.volume_up_rounded,
                                        color: titleColor),
                                    onPressed: () {
                                      FeedbackService.lightClick();
                                      if (speaking) {
                                        TtsService.stop();
                                      } else {
                                        _read();
                                      }
                                    },
                                  ),
                                ),
                              ]),
                              const SizedBox(height: 12),
                              if (widget.correctAnswer != null) ...[
                                Text('Respuesta: ${widget.correctAnswer}',
                                    style: TextStyle(
                                        color: foreground,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 12),
                              ],
                              if (!widget.isCorrect) ...[
                                Text(
                                    'Esta pregunta volverá al final para repasarla.',
                                    style: TextStyle(color: foreground)),
                                const SizedBox(height: 12),
                              ],
                              AppCard(
                                color: isDark
                                    ? const Color(0xFF0F172A)
                                    : Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 10),
                                child: Text.rich(
                                    TextSpan(children: [
                                      const TextSpan(
                                          text: 'Qué observar: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(text: widget.keyVisualClue),
                                    ]),
                                    style: TextStyle(
                                        color: foreground, fontSize: 13)),
                              ),
                              const SizedBox(height: 10),
                              Text(widget.explanation,
                                  style: TextStyle(
                                      color: foreground,
                                      fontSize: 13.5,
                                      height: 1.4)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (_hasMore)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text('Más explicación abajo · Desliza para leerla',
                        style: TextStyle(color: foreground, fontSize: 12)),
                  ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    FeedbackService.lightClick();
                    TtsService.stop();
                    widget.onContinue();
                  },
                  child: const Text('Continuar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
