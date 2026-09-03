import 'package:flutter/material.dart';
import '../../models/gesture_item.dart';
import '../../models/category.dart';
import '../common/app_card.dart';
import '../common/badge_pill.dart';
import '../illustrations/illustration_widget.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/feedback_service.dart';
import '../../core/services/tts_service.dart';

class GestureCard extends StatelessWidget {
  final GestureItem item;
  final bool isBookmarked;
  final VoidCallback onTap;
  final VoidCallback onBookmarkToggle;

  const GestureCard({
    super.key,
    required this.item,
    required this.isBookmarked,
    required this.onTap,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    final catInfo = CategoryInfo.getInfo(item.category);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mutedColor =
        isDark ? AppColors.textMutedDark : AppColors.textMutedLight;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: AppCard(
        onTap: () {
          FeedbackService.lightClick();
          onTap();
        },
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Visual Vector Illustration Thumbnail
            Hero(
              tag: 'gesture_illustration_${item.id}',
              child: ConoVeIllustration(
                illustrationKey: item.illustrationKey,
                width: 76,
                height: 76,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 14),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top: Title, Audio and Bookmark
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ValueListenableBuilder<String?>(
                        valueListenable: TtsService.currentSpeakingIdNotifier,
                        builder: (context, speakingId, _) {
                          final isSpeaking = speakingId == item.id;
                          return IconButton(
                            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                            padding: EdgeInsets.zero,
                            iconSize: 22,
                            icon: Icon(
                              isSpeaking
                                  ? Icons.stop_circle_rounded
                                  : Icons.volume_up_rounded,
                              color: isSpeaking
                                  ? (isDark
                                      ? const Color(0xFFF87171)
                                      : const Color(0xFFDC2626))
                                  : mutedColor,
                            ),
                            tooltip: isSpeaking
                                ? 'Detener lectura'
                                : 'Escuchar en voz alta',
                            onPressed: () {
                              FeedbackService.lightClick();
                              if (isSpeaking) {
                                TtsService.stop();
                              } else {
                                final textToRead =
                                    '${item.name}. ${item.summary}. Pistas físicas: ${item.physiologicalDetails}. Significado: ${item.probableMeaning}';
                                TtsService.speak(textToRead, gestureId: item.id);
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                        padding: EdgeInsets.zero,
                        iconSize: 22,
                        icon: Icon(
                          isBookmarked
                              ? Icons.bookmark_rounded
                              : Icons.bookmark_outline_rounded,
                          color: isBookmarked ? catInfo.primaryColor : mutedColor,
                        ),
                        onPressed: () {
                          FeedbackService.bookmark();
                          onBookmarkToggle();
                        },
                        tooltip: isBookmarked
                            ? 'Guardado en favoritos'
                            : 'Guardar señal',
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Middle: Clear Summary
                  Text(
                    item.summary,
                    style: TextStyle(
                      fontSize: 12.5,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                      height: 1.35,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Bottom: Single badge + Signal Icon (Wrap protects from any overflow)
                  Wrap(
                    spacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      BadgePill(
                        text: item.bodyPart,
                        color: catInfo.primaryColor,
                      ),
                      Icon(
                        item.signalType.icon,
                        size: 18,
                        color: item.signalType.color,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
