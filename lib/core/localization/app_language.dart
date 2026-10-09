import 'package:flutter/widgets.dart';

/// One resolution policy for the interface, preferences and speech.
class AppLanguage {
  static const latinSpanish = Locale('es', '419');
  static const spainSpanish = Locale('es', 'ES');
  static const supportedLocales = [
    latinSpanish,
    spainSpanish,
    Locale('en'),
    Locale('fr'),
    Locale('pt', 'BR'),
    Locale('de'),
  ];

  static Locale fromPreference(String code) {
    // The old explicit Spanish option displayed a Spain flag and used es-ES.
    if (code == 'es') return spainSpanish;
    final parts = code.replaceAll('_', '-').split('-');
    return resolve([
      Locale(parts.first.toLowerCase(),
          parts.length > 1 ? parts.last.toUpperCase() : null)
    ]);
  }

  static Locale resolve(List<Locale>? preferred) {
    for (final locale in preferred ?? const <Locale>[]) {
      switch (locale.languageCode.toLowerCase()) {
        case 'es':
          return locale.countryCode?.toUpperCase() == 'ES'
              ? spainSpanish
              : latinSpanish;
        case 'pt':
          return const Locale('pt', 'BR');
        case 'en':
          return const Locale('en');
        case 'fr':
          return const Locale('fr');
        case 'de':
          return const Locale('de');
      }
    }
    return latinSpanish;
  }

  static String speechTag(Locale locale) => switch (locale.languageCode) {
        'es' => locale.countryCode == 'ES' ? 'es-ES' : 'es-MX',
        'en' => 'en-US',
        'fr' => 'fr-FR',
        'pt' => 'pt-BR',
        'de' => 'de-DE',
        _ => 'es-MX',
      };
}
