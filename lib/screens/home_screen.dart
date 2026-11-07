import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../models/category.dart';
import '../widgets/illustrations/gestura_logo_painter.dart';
import '../core/services/feedback_service.dart';
import '../core/localization/app_localizations.dart';
import '../core/services/tts_service.dart';
import '../widgets/home/mastery_progress_card.dart';
import 'tools_screen.dart';
import 'progress_screen.dart';
import 'decoder_screen.dart';
import 'explore_screen.dart';
import 'emergency_mode_screen.dart';
import 'communication_board_screen.dart';
import 'unwritten_rules_screen.dart';

class HomeScreen extends StatelessWidget {
  final ValueChanged<int> onNavigateToTab;
  final ValueChanged<CategoryType> onOpenCategory;

  const HomeScreen({
    super.key,
    required this.onNavigateToTab,
    required this.onOpenCategory,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const GesturaLogoWidget(size: 34),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    loc.appName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w900),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    loc.appSubtitle,
                    style: TextStyle(
                      fontSize: 10.5,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.widgets_outlined),
            tooltip: 'Herramientas',
            onPressed: () {
              TtsService.stop();
              Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const ToolsScreen(),
                  ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.insights_rounded),
            tooltip: 'Mi Progreso',
            onPressed: () {
              FeedbackService.lightClick();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProgressScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1050),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            children: [
              const MasteryProgressCard(showRouteButton: false),
              const SizedBox(height: 12),
              Card(
                color: theme.colorScheme.primaryContainer,
                margin: EdgeInsets.zero,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Icon(Icons.forum_outlined,
                      color: theme.colorScheme.onPrimaryContainer),
                  title: Text('Comunicar ahora',
                      style: TextStyle(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w700,
                      )),
                  subtitle: Text('Muestra una frase o escribe un mensaje.',
                      style: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer)),
                  trailing: Icon(Icons.chevron_right,
                      color: theme.colorScheme.onPrimaryContainer),
                  onTap: () {
                    TtsService.stop();
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (_) => const CommunicationBoardScreen()));
                  },
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ActionChip(
                    avatar: const Icon(Icons.bolt_outlined),
                    label: const Text('Ayuda rápida'),
                    onPressed: () {
                      TtsService.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => const EmergencyModeScreen(),
                          ));
                    },
                  ),
                  ActionChip(
                    avatar: const Icon(Icons.shield_outlined),
                    label: const Text('Límites y consentimiento'),
                    onPressed: () {
                      TtsService.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) =>
                                const UnwrittenRulesScreen(initialTab: 4),
                          ));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.search_rounded),
                    label: const Text('Buscar'),
                    onPressed: () {
                      TtsService.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (_) => const DecoderScreen()));
                    },
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.explore_outlined),
                    label: const Text('Explorar'),
                    onPressed: () {
                      TtsService.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (_) => ExploreScreen(
                                  onNavigateToTab: onNavigateToTab,
                                  onOpenCategory: onOpenCategory)));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
