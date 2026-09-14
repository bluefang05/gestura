import 'package:flutter/material.dart';
import '../state/settings_provider.dart';
import '../state/progress_provider.dart';
import '../widgets/common/app_card.dart';
import '../widgets/common/section_header.dart';
import '../widgets/illustrations/gestura_logo_painter.dart';
import '../core/constants/app_constants.dart';
import '../core/constants/app_colors.dart';
import '../core/services/feedback_service.dart';
import '../core/services/tts_service.dart';
import '../core/localization/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SettingsProvider _settings;

  @override
  void initState() {
    super.initState();
    _settings = SettingsProvider();
  }

  @override
  void dispose() {
    TtsService.stop();
    super.dispose();
  }

  void _confirmResetProgress() {
    final loc = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(loc.resetProgressDialogTitle),
        content: Text(loc.resetProgressDialogContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(loc.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () async {
              await ProgressProvider().resetProgress();
              if (ctx.mounted) {
                Navigator.pop(ctx);
              }
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(loc.progressResetSnackbar)),
              );
            },
            child: Text(loc.resetProgressButton),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return ListenableBuilder(
      listenable: _settings,
      builder: (context, _) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
          appBar: AppBar(
            title: Text('${loc.settings} & ${loc.accessibilitySectionTitle}'),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                children: [
                  // Visual Theme Section
                  SectionHeader(
                    title: loc.appearance,
                    subtitle: loc.appearanceSubtitle,
                  ),
                  AppCard(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: SegmentedButton<ThemeMode>(
                        segments: [
                          ButtonSegment(
                            value: ThemeMode.light,
                            label: Text(loc.themeLightShort),
                            icon:
                                const Icon(Icons.light_mode_rounded, size: 18),
                          ),
                          ButtonSegment(
                            value: ThemeMode.dark,
                            label: Text(loc.themeDarkShort),
                            icon: const Icon(Icons.dark_mode_rounded, size: 18),
                          ),
                          ButtonSegment(
                            value: ThemeMode.system,
                            label: Text(loc.themeAutoShort),
                            icon: const Icon(Icons.brightness_auto_rounded,
                                size: 18),
                          ),
                        ],
                        selected: {_settings.themeMode},
                        onSelectionChanged: (newSelection) {
                          FeedbackService.lightClick();
                          _settings.setThemeMode(newSelection.first);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Language Selector Section
                  SectionHeader(
                    title: loc.languageSectionTitle,
                    subtitle: loc.languageSectionSubtitle,
                  ),
                  AppCard(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String?>(
                        value: _settings.languageCode,
                        isExpanded: true,
                        icon: const Icon(Icons.language_rounded,
                            color: AppColors.primary),
                        items: [
                          DropdownMenuItem(
                            value: null,
                            child: Row(
                              children: [
                                const Text('🌐',
                                    style: TextStyle(fontSize: 18)),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(loc.systemLanguageDesc,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ),
                          const DropdownMenuItem(
                            value: 'es',
                            child: Row(
                              children: [
                                Text('🇪🇸', style: TextStyle(fontSize: 18)),
                                SizedBox(width: 10),
                                Text('Español',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          const DropdownMenuItem(
                            value: 'en',
                            child: Row(
                              children: [
                                Text('🇺🇸', style: TextStyle(fontSize: 18)),
                                SizedBox(width: 10),
                                Text('English',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          const DropdownMenuItem(
                            value: 'fr',
                            child: Row(
                              children: [
                                Text('🇫🇷', style: TextStyle(fontSize: 18)),
                                SizedBox(width: 10),
                                Text('Français',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          const DropdownMenuItem(
                            value: 'pt',
                            child: Row(
                              children: [
                                Text('🇧🇷', style: TextStyle(fontSize: 18)),
                                SizedBox(width: 10),
                                Text('Português',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          const DropdownMenuItem(
                            value: 'de',
                            child: Row(
                              children: [
                                Text('🇩🇪', style: TextStyle(fontSize: 18)),
                                SizedBox(width: 10),
                                Text('Deutsch',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (newLang) {
                          FeedbackService.lightClick();
                          _settings.setLanguageCode(newLang);
                          TtsService.updateLanguage(newLang ?? 'es');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Accessibility / Sensory friendly
                  SectionHeader(
                    title: loc.accessibilitySectionTitle,
                    subtitle: loc.accessibilitySectionSubtitle,
                  ),
                  AppCard(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        SwitchListTile(
                          title: Text(loc.highContrast),
                          subtitle: Text(loc.highContrastSubtitle),
                          value: _settings.isHighContrast,
                          onChanged: (val) {
                            FeedbackService.lightClick();
                            _settings.setHighContrast(val);
                          },
                        ),
                        const Divider(height: 1),
                        SwitchListTile(
                          title: Text(loc.reduceMotion),
                          subtitle: Text(loc.reduceMotionSubtitle),
                          value: _settings.isReduceMotion,
                          onChanged: (val) {
                            FeedbackService.lightClick();
                            _settings.setReduceMotion(val);
                          },
                        ),
                        const Divider(height: 1),
                        SwitchListTile(
                          title: Text(loc.warmFilterTitle),
                          subtitle: Text(loc.warmFilterSubtitle),
                          value: _settings.isWarmFilter,
                          onChanged: (val) {
                            FeedbackService.lightClick();
                            _settings.setWarmFilter(val);
                          },
                        ),
                        const Divider(height: 1),
                        SwitchListTile(
                          title: Text(loc.hapticsTitle),
                          subtitle: Text(loc.hapticsSubtitle),
                          value: _settings.isHapticsEnabled,
                          onChanged: (val) {
                            FeedbackService.lightClick();
                            _settings.setHapticsEnabled(val);
                          },
                        ),
                        const Divider(height: 1),
                        SwitchListTile(
                          title: Text(loc.soundEffectsTitle),
                          subtitle: Text(loc.soundEffectsSubtitle),
                          value: _settings.isSoundEffectsEnabled,
                          onChanged: (val) {
                            _settings.setSoundEffectsEnabled(val);
                            if (val) {
                              FeedbackService.neutral();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // TTS Voice & Auto-Narration Section
                  SectionHeader(
                    title: loc.ttsSectionTitle,
                    subtitle: loc.ttsSectionSubtitle,
                  ),
                  AppCard(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        SwitchListTile(
                          title: Text(loc.autoNarrationTitle,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(loc.autoNarrationSubtitle),
                          value: _settings.isAutoNarration,
                          onChanged: (val) {
                            FeedbackService.lightClick();
                            _settings.setAutoNarration(val);
                            if (val) {
                              TtsService.speak(loc.autoNarrationSubtitle);
                            } else {
                              TtsService.stop();
                            }
                          },
                        ),
                        const Divider(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(loc.ttsSpeedTitle,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.5)),
                                  Text(
                                    '${(_settings.speechRate * 200).round()}%',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary),
                                  ),
                                ],
                              ),
                              Slider(
                                value: _settings.speechRate,
                                min: 0.35,
                                max: 0.65,
                                divisions: 6,
                                label:
                                    '${(_settings.speechRate * 200).round()}%',
                                onChanged: (val) {
                                  _settings.setSpeechRate(val);
                                  TtsService.setSpeechRate(val);
                                },
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton.icon(
                                  onPressed: () {
                                    FeedbackService.lightClick();
                                    TtsService.speak(loc.testVoiceSample);
                                  },
                                  icon: const Icon(Icons.volume_up_rounded,
                                      size: 18),
                                  label: Text(loc.testVoiceButton),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Font Scaling
                  SectionHeader(
                    title: loc.fontSizeSectionTitle,
                    subtitle: loc.fontSizeSectionSubtitle,
                  ),
                  AppCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(loc.fontScaleLabel,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text('${(_settings.fontScale * 100).round()}%',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary)),
                          ],
                        ),
                        Slider(
                          value: _settings.fontScale,
                          min: 0.85,
                          max: 1.35,
                          divisions: 5,
                          label: '${(_settings.fontScale * 100).round()}%',
                          onChanged: (val) {
                            _settings.setFontScale(val);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Reset Data
                  SectionHeader(
                    title: loc.appDataSectionTitle,
                  ),
                  AppCard(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: const Icon(Icons.delete_outline_rounded,
                          color: AppColors.error),
                      title: Text(loc.resetProgressTitle,
                          style: const TextStyle(
                              color: AppColors.error,
                              fontWeight: FontWeight.w700)),
                      subtitle: Text(loc.resetProgressSubtitle),
                      onTap: _confirmResetProgress,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // About Gestura
                  Center(
                    child: Column(
                      children: [
                        const GesturaLogoWidget(size: 40),
                        const SizedBox(height: 8),
                        Text(
                          '${AppConstants.appName} v${AppConstants.appVersion}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 14),
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            loc.offlineFirst,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark
                                  ? AppColors.textMutedDark
                                  : AppColors.textMutedLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
