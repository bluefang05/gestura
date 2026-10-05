import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static const List<Locale> supportedLocales = [
    Locale('es'),
    Locale('en'),
    Locale('fr'),
    Locale('pt'),
    Locale('de'),
  ];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('es'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String get langCode => locale.languageCode;

  /// Exposes dictionaries for automated key symmetry testing.
  @visibleForTesting
  static Map<String, Map<String, String>> get translations => _values;

  // Translation dictionaries
  static final Map<String, Map<String, String>> _values = {
    'es': {
      'appName': 'Gestura',
      'appSubtitle':
          'Decodificador de Lenguaje Corporal y Comunicación No Verbal',
      'home': 'Inicio',
      'manual': 'Manual',
      'practice': 'Práctica',
      'scenarios': 'Escenarios',
      'settings': 'Ajustes',
      'search': 'Buscar',
      'searchHint': 'Buscar señal, microgesto o palabra clave...',
      'all': 'Todos',
      'quickDecoder': 'Decodificador Rápido',
      'quickDecoderDesc':
          'Filtra por parte del cuerpo (ojos, boca, brazos, silencios) y descifra la intención oculta en segundos.',
      'openDecoder': 'Abrir Diccionario de Gestos',
      'dailyQuiz': 'Quiz Visual del Día',
      'dailyQuizDesc':
          'Pon a prueba tu capacidad de reconocimiento de gestos faciales breves y posturas.',
      'startQuiz': 'Comenzar Práctica Diaria',
      'socialTree': 'Árbol de Decisión Social',
      'socialTreeDesc':
          '¿Ves un gesto difícil? Sigue el árbol: Si veo X ➔ Significa Y ➔ Hago Z.',
      'openTree': 'Abrir Árbol de Diagnóstico',
      'compareAB': 'Comparador Visual A/B',
      'compareABDesc':
          'Compara lado a lado gestos que se parecen.',
      'openCompare': 'Abrir Comparador',
      'cheatSheet': 'Guía de Bolsillo (Cheat Sheet)',
      'cheatSheetDesc':
          '20 señales no verbales críticas para negociaciones, entrevistas y ventas.',
      'openCheatSheet': 'Ver Guía de Bolsillo',
      'exploredSignals': 'Señales Exploradas',
      'totalScore': 'Puntos de Maestría',
      'streak': 'Racha de Estudio',
      'categoriesTitle': 'Categorías de Comunicación',
      'facialCat': 'Expresiones Faciales',
      'vocalCat': 'Voz y forma de hablar',
      'bodyCat': 'Posturas y Corporal',
      'proxemicsCat': 'Espacio personal',
      'envCat': 'Entorno y Apariencia',
      'digitalCat': 'Señales Digitales',
      'signalReceptive': 'Luz Verde (Receptividad)',
      'signalCaution': 'Luz Amarilla (Precaución)',
      'signalObjection': 'Luz Roja (Objeción / Barrera)',
      'listenAloud': 'Escuchar Ficha',
      'stopAudio': 'Detener Audio',
      'anatomyClues': 'Señales que puedes observar',
      'probableMeaning': 'Significado Probable',
      'whatToDo': '¿Qué debes hacer / responder tú?',
      'salesTip': 'Táctica de Ventas y Negociación',
      'language': 'Idioma de la Aplicación',
      'systemLanguage': 'Automático (Idioma del Sistema)',
      'appearance': 'Apariencia y Tema',
      'themeLight': 'Modo Claro',
      'themeDark': 'Modo Oscuro',
      'themeSystem': 'Tema del Sistema',
      'highContrast': 'Alto Contraste (Modo Accesibilidad)',
      'reduceMotion': 'Reducir Animaciones y Movimiento',
      'warmFilter': 'Filtro Cálido (Descanso Ocular)',
      'haptics': 'Respuesta Háptica (Vibración)',
      'ttsVoice': 'Lectura de Voz en Voz Alta (TTS)',
      'resetProgress': 'Reiniciar Progreso',
      'resetConfirm': '¿Estás seguro de reiniciar todo tu progreso?',
      'about': 'Acerca de Gestura',
      'version': 'Versión',
      'offlineFirst':
          'Tu progreso y preferencias se almacenan localmente. Las funciones educativas principales funcionan sin conexión.',
      'appearanceSubtitle': 'Elige la apariencia que te resulte más cómoda',
      'themeLightShort': 'Claro',
      'themeDarkShort': 'Oscuro',
      'themeAutoShort': 'Auto',
      'languageSectionTitle': 'Idioma / Language',
      'languageSectionSubtitle':
          'Adopta el idioma del sistema o elige manualmente',
      'systemLanguageDesc': 'Automático (Idioma del Sistema)',
      'accessibilitySectionTitle': 'Accesibilidad y Sensorialidad',
      'accessibilitySectionSubtitle':
          'Ajustes diseñados para evitar sobrecarga sensorial',
      'highContrastSubtitle': 'Bordes reforzados y texto de máxima legibilidad',
      'reduceMotionSubtitle':
          'Desactiva animaciones para evitar sobrecarga visual',
      'warmFilterTitle': 'Filtro Cálido (Descanso Ocular)',
      'warmFilterSubtitle': 'Tinte sepia suave para reducir fatiga',
      'hapticsTitle': 'Respuesta Háptica (Vibración)',
      'hapticsSubtitle': 'Vibración ligera al interactuar y confirmar',
      'soundEffectsTitle': 'Efectos de Sonido (Audio UI)',
      'soundEffectsSubtitle': 'Sonidos suaves de acierto, error y confirmación',
      'ttsSectionTitle': 'Lectura por Voz & Asistencia (TTS)',
      'ttsSectionSubtitle': 'Lectura opcional para todo el contenido educativo',
      'autoNarrationTitle': 'Modo Auto-Narración',
      'autoNarrationSubtitle':
          'Lee automáticamente preguntas, escenarios y tarjetas al entrar',
      'ttsSpeedTitle': 'Velocidad de Lectura TTS:',
      'testVoiceButton': 'Probar Voz',
      'testVoiceSample': 'Esta es una prueba de velocidad de voz en Gestura.',
      'fontSizeSectionTitle': 'Tamaño del Texto',
      'fontSizeSectionSubtitle':
          'Complementa la escala de texto de tu dispositivo',
      'fontScaleLabel': 'Escala:',
      'appDataSectionTitle': 'Datos de la Aplicación',
      'resetProgressTitle': 'Reiniciar Progreso de Aprendizaje',
      'resetProgressSubtitle':
          'Restablece puntos, quizzes y escenarios sin borrar favoritos ni ajustes',
      'resetProgressDialogTitle': '¿Reiniciar Progreso de Aprendizaje?',
      'resetProgressDialogContent':
          'Se restablecerán a cero tus puntos, racha, marcas de señales exploradas y resultados de quizzes y escenarios. Tus favoritos, tema e idioma se conservarán intactos.',
      'resetProgressButton': 'Reiniciar Progreso',
      'progressResetSnackbar':
          'Progreso restablecido correctamente. Tus favoritos y ajustes se conservan.',
      'cancel': 'Cancelar',
      'filterAll': 'Todos',
      'filterEyes': 'Ojos',
      'filterMouth': 'Boca',
      'filterEyebrows': 'Cejas',
      'filterVoice': 'Voz',
      'filterArms': 'Brazos',
      'filterSpace': 'Espacio',
      'filterDigital': 'Digital',
      'filterBookmarks': 'Guardados',
    },
    'en': {
      'appName': 'Gestura',
      'appSubtitle': 'Body Language & Nonverbal Communication Decoder',
      'home': 'Home',
      'manual': 'Manual',
      'practice': 'Practice',
      'scenarios': 'Scenarios',
      'settings': 'Settings',
      'search': 'Search',
      'searchHint': 'Search gesture or word...',
      'all': 'All',
      'quickDecoder': 'Quick Decoder',
      'quickDecoderDesc':
          'Filter by body part (eyes, mouth, arms, pauses) and decode hidden intention in seconds.',
      'openDecoder': 'Open Live Decoder',
      'dailyQuiz': 'Daily Visual Quiz',
      'dailyQuizDesc':
          'Practice recognizing brief facial expressions and body postures.',
      'startQuiz': 'Start Daily Practice',
      'socialTree': 'Social Decision Tree',
      'socialTreeDesc':
          'See a confusing gesture? Follow the tree: If I see X ➔ Means Y ➔ I do Z.',
      'openTree': 'Open Diagnostic Tree',
      'compareAB': 'Visual A/B Comparator',
      'compareABDesc': 'Compare pairs of similar gestures side by side.',
      'openCompare': 'Open Comparator',
      'cheatSheet': 'Pocket Cheat Sheet',
      'cheatSheetDesc':
          '20 critical nonverbal signals for negotiations, interviews, and sales.',
      'openCheatSheet': 'View Cheat Sheet',
      'exploredSignals': 'Explored Signals',
      'totalScore': 'Mastery Points',
      'streak': 'Study Streak',
      'categoriesTitle': 'Communication Categories',
      'facialCat': 'Facial Expressions',
      'vocalCat': 'Voice and speaking style',
      'bodyCat': 'Body Posture & Language',
      'proxemicsCat': 'Personal space',
      'envCat': 'Environment & Appearance',
      'digitalCat': 'Digital Signals',
      'signalReceptive': 'Green Light (Receptivity)',
      'signalCaution': 'Yellow Light (Caution / Hesitation)',
      'signalObjection': 'Red Light (Objection / Barrier)',
      'listenAloud': 'Listen to Card',
      'stopAudio': 'Stop Audio',
      'anatomyClues': 'What you can observe',
      'probableMeaning': 'Probable Meaning',
      'whatToDo': 'What should you do / say?',
      'salesTip': 'Sales & Negotiation Tactic',
      'language': 'App Language',
      'systemLanguage': 'Automatic (System Language)',
      'appearance': 'Appearance & Theme',
      'themeLight': 'Light Mode',
      'themeDark': 'Dark Mode',
      'themeSystem': 'System Default',
      'highContrast': 'High Contrast (Accessibility Mode)',
      'reduceMotion': 'Reduce Motion & Animations',
      'warmFilter': 'Warm Ocular Filter (Eye Comfort)',
      'haptics': 'Haptic Vibration Feedback',
      'ttsVoice': 'Text-to-Speech Narration (TTS)',
      'resetProgress': 'Reset Progress',
      'resetConfirm': 'Are you sure you want to reset all your progress?',
      'about': 'About Gestura',
      'version': 'Version',
      'offlineFirst':
          'Your progress and preferences stay on your device. Core learning features work offline.',
      'appearanceSubtitle': 'Choose the appearance that feels most comfortable',
      'themeLightShort': 'Light',
      'themeDarkShort': 'Dark',
      'themeAutoShort': 'Auto',
      'languageSectionTitle': 'Language',
      'languageSectionSubtitle': 'Follow system language or select manually',
      'systemLanguageDesc': 'Automatic (System Language)',
      'accessibilitySectionTitle': 'Accessibility & Sensory Options',
      'accessibilitySectionSubtitle':
          'Settings tailored to prevent sensory overload',
      'highContrastSubtitle': 'Enhanced borders and high-legibility text',
      'reduceMotionSubtitle': 'Disables animations to reduce visual stress',
      'warmFilterTitle': 'Warm Filter (Eye Comfort)',
      'warmFilterSubtitle': 'Soft sepia tint to ease eye fatigue',
      'hapticsTitle': 'Haptic Feedback (Vibration)',
      'hapticsSubtitle': 'Subtle vibration upon interaction and confirmation',
      'soundEffectsTitle': 'Sound Effects (UI Audio)',
      'soundEffectsSubtitle':
          'Gentle sounds for success, error, and confirmation',
      'ttsSectionTitle': 'Voice Reading & Assistance (TTS)',
      'ttsSectionSubtitle': 'Optional narration for all educational content',
      'autoNarrationTitle': 'Auto-Narration Mode',
      'autoNarrationSubtitle':
          'Automatically reads questions, scenarios, and cards upon opening',
      'ttsSpeedTitle': 'TTS Speech Rate:',
      'testVoiceButton': 'Test Voice',
      'testVoiceSample': 'This is a speech rate test in Gestura.',
      'fontSizeSectionTitle': 'Text Size',
      'fontSizeSectionSubtitle': 'Complements your device font scaling setting',
      'fontScaleLabel': 'Scale:',
      'appDataSectionTitle': 'Application Data',
      'resetProgressTitle': 'Reset Learning Progress',
      'resetProgressSubtitle':
          'Resets points, quizzes, and scenarios without clearing bookmarks or settings',
      'resetProgressDialogTitle': 'Reset Learning Progress?',
      'resetProgressDialogContent':
          'Your points, streak, explored signals, and quiz/scenario results will be reset to zero. Your bookmarks, theme, and language will remain untouched.',
      'resetProgressButton': 'Reset Progress',
      'progressResetSnackbar':
          'Progress successfully reset. Your bookmarks and settings were preserved.',
      'cancel': 'Cancel',
      'filterAll': 'All',
      'filterEyes': 'Eyes',
      'filterMouth': 'Mouth',
      'filterEyebrows': 'Eyebrows',
      'filterVoice': 'Voice',
      'filterArms': 'Arms',
      'filterSpace': 'Space',
      'filterDigital': 'Digital',
      'filterBookmarks': 'Saved',
    },
    'fr': {
      'appName': 'Gestura',
      'appSubtitle':
          'Décodeur de Langage Corporel et Communication Non Verbale',
      'home': 'Accueil',
      'manual': 'Manuel',
      'practice': 'Pratique',
      'scenarios': 'Scénarios',
      'settings': 'Paramètres',
      'search': 'Rechercher',
      'searchHint': 'Rechercher un geste, micro-expression ou mot-clé...',
      'all': 'Tous',
      'quickDecoder': 'Décodeur Rapide',
      'quickDecoderDesc':
          'Filtrez par partie du corps (yeux, bouche, bras, silences) et décodez l\'intention cachée en quelques secondes.',
      'openDecoder': 'Ouvrir le Décodeur',
      'dailyQuiz': 'Quiz Visuel du Jour',
      'dailyQuizDesc':
          'Testez votre reconnaissance des micro-expressions et des postures.',
      'startQuiz': 'Commencer la Pratique',
      'socialTree': 'Arbre de Décision Sociale',
      'socialTreeDesc':
          'Vous voyez un geste difficile ? Suivez l\'arbre : Si je vois X ➔ Signifie Y ➔ Je fais Z.',
      'openTree': 'Ouvrir l\'Arbre de Diagnostic',
      'compareAB': 'Comparateur Visuel A/B',
      'compareABDesc': 'Comparez côte à côte des gestes similaires.',
      'openCompare': 'Ouvrir le Comparateur',
      'cheatSheet': 'Fiche Mémo de Poche',
      'cheatSheetDesc':
          '20 signaux non verbaux essentiels pour les négociations, entretiens et ventes.',
      'openCheatSheet': 'Voir la Fiche Mémo',
      'exploredSignals': 'Signaux Explorés',
      'totalScore': 'Points de Maîtrise',
      'streak': 'Série d\'Étude',
      'categoriesTitle': 'Catégories de Communication',
      'facialCat': 'Expressions Faciales',
      'vocalCat': 'Voix et façon de parler',
      'bodyCat': 'Postures et Corps',
      'proxemicsCat': 'Espace personnel',
      'envCat': 'Environnement et Apparence',
      'digitalCat': 'Signaux Numériques',
      'signalReceptive': 'Feu Vert (Réceptivité)',
      'signalCaution': 'Feu Jaune (Prudence / Hésitation)',
      'signalObjection': 'Feu Rouge (Objection / Barrière)',
      'listenAloud': 'Écouter la Fiche',
      'stopAudio': 'Arrêter l\'Audio',
      'anatomyClues': 'Ce que vous pouvez observer',
      'probableMeaning': 'Signification Probable',
      'whatToDo': 'Que devez-vous faire / répondre ?',
      'salesTip': 'Tactique de Vente et Négociation',
      'language': 'Langue de l\'Application',
      'systemLanguage': 'Automatique (Langue du Système)',
      'appearance': 'Apparence et Thème',
      'themeLight': 'Mode Clair',
      'themeDark': 'Mode Sombre',
      'themeSystem': 'Thème du Système',
      'highContrast': 'Contraste Élevé (Accessibilité)',
      'reduceMotion': 'Réduire les Animations',
      'warmFilter': 'Filtre Chaud (Confort Oculaire)',
      'haptics': 'Retour Haptique (Vibration)',
      'ttsVoice': 'Lecture Vocale (TTS)',
      'resetProgress': 'Réinitialiser la Progression',
      'resetConfirm':
          'Êtes-vous sûr de vouloir réinitialiser votre progression ?',
      'about': 'À propos de Gestura',
      'version': 'Version',
      'offlineFirst':
          'Vos progrès et préférences restent sur votre appareil. Les fonctions éducatives principales fonctionnent hors ligne.',
      'appearanceSubtitle': 'Choisissez l’apparence la plus confortable',
      'themeLightShort': 'Clair',
      'themeDarkShort': 'Sombre',
      'themeAutoShort': 'Auto',
      'languageSectionTitle': 'Langue',
      'languageSectionSubtitle':
          'Suivre la langue du système ou choisir manuellement',
      'systemLanguageDesc': 'Automatique (Langue du Système)',
      'accessibilitySectionTitle': 'Accessibilité & Confort sensoriel',
      'accessibilitySectionSubtitle':
          'Paramètres conçus pour éviter la surcharge sensorielle',
      'highContrastSubtitle': 'Bordures renforcées et texte haute lisibilité',
      'reduceMotionSubtitle':
          'Désactive les animations pour réduire le stress visuel',
      'warmFilterTitle': 'Filtre Chaud (Repos visuel)',
      'warmFilterSubtitle': 'Légère teinte sépia pour apaiser la fatigue',
      'hapticsTitle': 'Retour Haptique (Vibration)',
      'hapticsSubtitle':
          'Légère vibration lors des interactions et confirmations',
      'soundEffectsTitle': 'Effets Sonores (Audio UI)',
      'soundEffectsSubtitle':
          'Sons discrets pour réussite, erreur et validation',
      'ttsSectionTitle': 'Lecture Vocale & Assistance (TTS)',
      'ttsSectionSubtitle':
          'Narration optionnelle pour tout le contenu éducatif',
      'autoNarrationTitle': 'Mode Auto-Narration',
      'autoNarrationSubtitle':
          'Lit automatiquement questions, scénarios et fiches à l’ouverture',
      'ttsSpeedTitle': 'Vitesse de lecture TTS :',
      'testVoiceButton': 'Tester la voix',
      'testVoiceSample': 'Ceci est un test de vitesse vocale dans Gestura.',
      'fontSizeSectionTitle': 'Taille du texte',
      'fontSizeSectionSubtitle':
          'Complète la taille de police de votre appareil',
      'fontScaleLabel': 'Échelle :',
      'appDataSectionTitle': 'Données de l’application',
      'resetProgressTitle': 'Réinitialiser la progression d’apprentissage',
      'resetProgressSubtitle':
          'Réinitialise points, quiz et scénarios sans effacer favoris ni réglages',
      'resetProgressDialogTitle':
          'Réinitialiser la progression d’apprentissage ?',
      'resetProgressDialogContent':
          'Vos points, série, signaux explorés et résultats de quiz/scénarios seront remis à zéro. Vos favoris, thème et langue resteront intacts.',
      'resetProgressButton': 'Réinitialiser le progrès',
      'progressResetSnackbar':
          'Progression réinitialisée avec succès. Vos favoris et réglages sont conservés.',
      'cancel': 'Annuler',
      'filterAll': 'Tous',
      'filterEyes': 'Yeux',
      'filterMouth': 'Bouche',
      'filterEyebrows': 'Sourcils',
      'filterVoice': 'Voix',
      'filterArms': 'Bras',
      'filterSpace': 'Espace',
      'filterDigital': 'Numérique',
      'filterBookmarks': 'Enregistrés',
    },
    'pt': {
      'appName': 'Gestura',
      'appSubtitle':
          'Decodificador de Linguagem Corporal e Comunicação Não Verbal',
      'home': 'Início',
      'manual': 'Manual',
      'practice': 'Prática',
      'scenarios': 'Cenários',
      'settings': 'Ajustes',
      'search': 'Buscar',
      'searchHint': 'Buscar gesto ou palavra-chave...',
      'all': 'Todos',
      'quickDecoder': 'Decodificador Rápido',
      'quickDecoderDesc':
          'Filtre por parte do corpo (olhos, boca, braços, silêncios) e decifre a intenção oculta em segundos.',
      'openDecoder': 'Abrir Decodificador',
      'dailyQuiz': 'Quiz Visual Diário',
      'dailyQuizDesc':
          'Pratique reconhecer expressões faciais breves e posturas.',
      'startQuiz': 'Começar Prática Diária',
      'socialTree': 'Árvore de Decisão Social',
      'socialTreeDesc':
          'Viu um gesto confuso? Siga a árvore: Se vejo X ➔ Significa Y ➔ Faço Z.',
      'openTree': 'Abrir Árvore Diagnóstica',
      'compareAB': 'Comparador Visual A/B',
      'compareABDesc':
          'Contraste pares de gestos lado a lado com tabela de diferenças anatômicas.',
      'openCompare': 'Abrir Comparador',
      'cheatSheet': 'Guia de Bolso (Cheat Sheet)',
      'cheatSheetDesc':
          '20 sinais não verbais críticos para negociações, entrevistas e vendas.',
      'openCheatSheet': 'Ver Guia de Bolso',
      'exploredSignals': 'Sinais Explorados',
      'totalScore': 'Pontos de Maestria',
      'streak': 'Sequência de Estudo',
      'categoriesTitle': 'Categorias de Comunicação',
      'facialCat': 'Expressões Faciais',
      'vocalCat': 'Voz e modo de falar',
      'bodyCat': 'Postura e Linguagem Corporal',
      'proxemicsCat': 'Espaço pessoal',
      'envCat': 'Ambiente e Aparência',
      'digitalCat': 'Sinais Digitais',
      'signalReceptive': 'Sinal Verde (Receptividade)',
      'signalCaution': 'Sinal Amarelo (Atenção / Dúvida)',
      'signalObjection': 'Sinal Vermelho (Objeção / Barreira)',
      'listenAloud': 'Ouvir Ficha',
      'stopAudio': 'Parar Áudio',
      'anatomyClues': 'O que você pode observar',
      'probableMeaning': 'Significado Provável',
      'whatToDo': 'O que você deve fazer / responder?',
      'salesTip': 'Tática de Vendas e Negociação',
      'language': 'Idioma do Aplicativo',
      'systemLanguage': 'Automático (Idioma do Sistema)',
      'appearance': 'Aparência e Tema',
      'themeLight': 'Modo Claro',
      'themeDark': 'Modo Escuro',
      'themeSystem': 'Padrão do Sistema',
      'highContrast': 'Alto Contraste (Acessibilidade)',
      'reduceMotion': 'Reduzir Animações e Movimento',
      'warmFilter': 'Filtro Quente (Descanso Visual)',
      'haptics': 'Resposta Tátil (Vibração)',
      'ttsVoice': 'Leitura em Voz Alta (TTS)',
      'resetProgress': 'Redefinir Progresso',
      'resetConfirm': 'Tem certeza que deseja redefinir seu progresso?',
      'about': 'Sobre o Gestura',
      'version': 'Versão',
      'offlineFirst':
          'Seu progresso e preferências são armazenados localmente. As funções educativas principais funcionam offline.',
      'appearanceSubtitle': 'Escolha a aparência mais confortável',
      'themeLightShort': 'Claro',
      'themeDarkShort': 'Escuro',
      'themeAutoShort': 'Auto',
      'languageSectionTitle': 'Idioma',
      'languageSectionSubtitle':
          'Adotar o idioma do sistema ou escolher manualmente',
      'systemLanguageDesc': 'Automático (Idioma do sistema)',
      'accessibilitySectionTitle': 'Acessibilidade e Conforto Sensorial',
      'accessibilitySectionSubtitle':
          'Configurações para prevenir sobrecarga sensorial',
      'highContrastSubtitle':
          'Bordas reforçadas e texto de máxima legibilidade',
      'reduceMotionSubtitle': 'Desativa animações para reduzir estresse visual',
      'warmFilterTitle': 'Filtro Quente (Descanso Ocular)',
      'warmFilterSubtitle': 'Tom âmbar suave para aliviar o cansaço',
      'hapticsTitle': 'Resposta Háptica (Vibração)',
      'hapticsSubtitle': 'Vibração sutil ao interagir e confirmar',
      'soundEffectsTitle': 'Efeitos Sonoros (Áudio da UI)',
      'soundEffectsSubtitle': 'Sons suaves para acertos, erros e confirmações',
      'ttsSectionTitle': 'Leitura por Voz e Assistência (TTS)',
      'ttsSectionSubtitle':
          'Narração opcional para todo o conteúdo educacional',
      'autoNarrationTitle': 'Modo Auto-Narração',
      'autoNarrationSubtitle':
          'Lê automaticamente perguntas, cenários e fichas ao abrir',
      'ttsSpeedTitle': 'Velocidade de Leitura TTS:',
      'testVoiceButton': 'Testar Voz',
      'testVoiceSample': 'Este é um teste de velocidade de voz no Gestura.',
      'fontSizeSectionTitle': 'Tamanho do Texto',
      'fontSizeSectionSubtitle':
          'Complementa a escala de fonte do seu dispositivo',
      'fontScaleLabel': 'Escala:',
      'appDataSectionTitle': 'Dados do Aplicativo',
      'resetProgressTitle': 'Reiniciar Progresso de Aprendizagem',
      'resetProgressSubtitle':
          'Redefine pontos, quizzes e cenários sem apagar favoritos ou ajustes',
      'resetProgressDialogTitle': 'Reiniciar Progresso de Aprendizagem?',
      'resetProgressDialogContent':
          'Seus pontos, sequência, sinais explorados e resultados de quizzes/cenários serão zerados. Seus favoritos, tema e idioma permanecerão intactos.',
      'resetProgressButton': 'Reiniciar Progresso',
      'progressResetSnackbar':
          'Progresso redefinido com sucesso. Seus favoritos e configurações foram preservados.',
      'cancel': 'Cancelar',
      'filterAll': 'Todos',
      'filterEyes': 'Olhos',
      'filterMouth': 'Boca',
      'filterEyebrows': 'Sobrancelhas',
      'filterVoice': 'Voz',
      'filterArms': 'Braços',
      'filterSpace': 'Espaço',
      'filterDigital': 'Digital',
      'filterBookmarks': 'Salvos',
    },
    'de': {
      'appName': 'Gestura',
      'appSubtitle': 'Körpersprache & Nonverbale Kommunikation Decoder',
      'home': 'Start',
      'manual': 'Handbuch',
      'practice': 'Übung',
      'scenarios': 'Szenarien',
      'settings': 'Einstellungen',
      'search': 'Suchen',
      'searchHint': 'Geste, Mikromimik oder Stichwort suchen...',
      'all': 'Alle',
      'quickDecoder': 'Schnell-Decoder',
      'quickDecoderDesc':
          'Nach Körperteil filtern (Augen, Mund, Arme, Stille) und verborgene Absichten in Sekunden entschlüsseln.',
      'openDecoder': 'Live-Decoder öffnen',
      'dailyQuiz': 'Tägliches Bild-Quiz',
      'dailyQuizDesc':
          'Testen Sie Ihre Erkennung von Mikroausdrücken und Körperhaltungen.',
      'startQuiz': 'Tägliche Übung starten',
      'socialTree': 'Sozialer Entscheidungsbaum',
      'socialTreeDesc':
          'Schwierige Geste? Folgen Sie dem Baum: Sehe ich X ➔ Bedeutet Y ➔ Tue ich Z.',
      'openTree': 'Diagnosebaum öffnen',
      'compareAB': 'Visueller A/B-Vergleich',
      'compareABDesc': 'Vergleichen Sie ähnliche Gesten nebeneinander.',
      'openCompare': 'Vergleich öffnen',
      'cheatSheet': 'Taschen-Spickzettel (Cheat Sheet)',
      'cheatSheetDesc':
          '20 entscheidende nonverbale Signale für Verhandlungen, Vorstellungsgespräche und Vertrieb.',
      'openCheatSheet': 'Spickzettel anzeigen',
      'exploredSignals': 'Erforschte Signale',
      'totalScore': 'Meisterschaftspunkte',
      'streak': 'Lernserie',
      'categoriesTitle': 'Kommunikationskategorien',
      'facialCat': 'Gesichtsausdrücke',
      'vocalCat': 'Stimme und Sprechweise',
      'bodyCat': 'Körperhaltung & Gestik',
      'proxemicsCat': 'Persönlicher Raum',
      'envCat': 'Umgebung & Erscheinung',
      'digitalCat': 'Digitale Signale',
      'signalReceptive': 'Grünes Licht (Aufgeschlossenheit)',
      'signalCaution': 'Gelbes Licht (Vorsicht / Zögern)',
      'signalObjection': 'Rotes Licht (Einwand / Barriere)',
      'listenAloud': 'Karte anhören',
      'stopAudio': 'Audio stoppen',
      'anatomyClues': 'Was Sie beobachten können',
      'probableMeaning': 'Wahrscheinliche Bedeutung',
      'whatToDo': 'Was sollten Sie tun / antworten?',
      'salesTip': 'Verkaufs- & Verhandlungstaktik',
      'language': 'App-Sprache',
      'systemLanguage': 'Automatisch (Systemsprache)',
      'appearance': 'Erscheinungsbild & Design',
      'themeLight': 'Helles Design',
      'themeDark': 'Dunkles Design',
      'themeSystem': 'Systemstandard',
      'highContrast': 'Hoher Kontrast (Barrierefreiheit)',
      'reduceMotion': 'Bewegungen reduzieren',
      'warmFilter': 'Warmfilter (Augenschonung)',
      'haptics': 'Haptisches Feedback (Vibration)',
      'ttsVoice': 'Sprachausgabe (TTS)',
      'resetProgress': 'Fortschritt zurücksetzen',
      'resetConfirm':
          'Möchten Sie Ihren gesamten Fortschritt wirklich zurücksetzen?',
      'about': 'Über Gestura',
      'version': 'Version',
      'offlineFirst':
          'Ihr Fortschritt und Ihre Einstellungen bleiben auf Ihrem Gerät. Die wichtigsten Lernfunktionen funktionieren offline.',
      'appearanceSubtitle':
          'Wählen Sie das für Sie angenehmste Erscheinungsbild',
      'themeLightShort': 'Hell',
      'themeDarkShort': 'Dunkel',
      'themeAutoShort': 'Auto',
      'languageSectionTitle': 'Sprache',
      'languageSectionSubtitle': 'Systemsprache übernehmen oder manuell wählen',
      'systemLanguageDesc': 'Automatisch (Systemsprache)',
      'accessibilitySectionTitle': 'Barrierefreiheit & Sensorik',
      'accessibilitySectionSubtitle':
          'Einstellungen zur Vermeidung von Reizüberflutung',
      'highContrastSubtitle': 'Verstärkte Kanten und kontrastreicher Text',
      'reduceMotionSubtitle':
          'Deaktiviert Animationen zur Beruhigung des Blickfelds',
      'warmFilterTitle': 'Warmer Filter (Augenschonung)',
      'warmFilterSubtitle': 'Sanfter Sepia-Ton gegen Überanstrengung',
      'hapticsTitle': 'Haptisches Feedback (Vibration)',
      'hapticsSubtitle': 'Sanfte Vibration bei Interaktionen und Bestätigungen',
      'soundEffectsTitle': 'Toneffekte (UI-Audio)',
      'soundEffectsSubtitle': 'Dezente Töne für Erfolg, Fehler und Bestätigung',
      'ttsSectionTitle': 'Sprachausgabe & Assistenz (TTS)',
      'ttsSectionSubtitle': 'Optionale Sprachausgabe für alle Lerninhalte',
      'autoNarrationTitle': 'Automatische Vorlesefunktion',
      'autoNarrationSubtitle':
          'Liest Fragen, Szenarien und Karten beim Öffnen automatisch vor',
      'ttsSpeedTitle': 'Vorlesegeschwindigkeit TTS:',
      'testVoiceButton': 'Stimme testen',
      'testVoiceSample':
          'Dies ist ein Test der Sprachgeschwindigkeit in Gestura.',
      'fontSizeSectionTitle': 'Schriftgröße',
      'fontSizeSectionSubtitle':
          'Ergänzt die Schriftgrößeneinstellung Ihres Geräts',
      'fontScaleLabel': 'Skalierung:',
      'appDataSectionTitle': 'Anwendungsdaten',
      'resetProgressTitle': 'Lernfortschritt zurücksetzen',
      'resetProgressSubtitle':
          'Setzt Punkte, Quizzes und Szenarien zurück, behält Lesezeichen und Einstellungen',
      'resetProgressDialogTitle': 'Lernfortschritt zurücksetzen?',
      'resetProgressDialogContent':
          'Ihre Punkte, Serie, erkundeten Signale und Quiz-/Szenario-Ergebnisse werden auf null zurückgesetzt. Ihre Lesezeichen, Design und Sprache bleiben erhalten.',
      'resetProgressButton': 'Fortschritt zurücksetzen',
      'progressResetSnackbar':
          'Fortschritt erfolgreich zurückgesetzt. Ihre Lesezeichen und Einstellungen bleiben erhalten.',
      'cancel': 'Abbrechen',
      'filterAll': 'Alle',
      'filterEyes': 'Augen',
      'filterMouth': 'Mund',
      'filterEyebrows': 'Augenbrauen',
      'filterVoice': 'Stimme',
      'filterArms': 'Arme',
      'filterSpace': 'Raum',
      'filterDigital': 'Digital',
      'filterBookmarks': 'Gespeichert',
    },
  };

  String translate(String key) {
    final lang = _values.containsKey(langCode) ? langCode : 'es';
    return _values[lang]?[key] ?? _values['es']?[key] ?? key;
  }

  // Getters
  String get appName => translate('appName');
  String get appSubtitle => translate('appSubtitle');
  String get home => translate('home');
  String get manual => translate('manual');
  String get practice => translate('practice');
  String get scenarios => translate('scenarios');
  String get settings => translate('settings');
  String get search => translate('search');
  String get searchHint => translate('searchHint');
  String get all => translate('all');
  String get quickDecoder => translate('quickDecoder');
  String get quickDecoderDesc => translate('quickDecoderDesc');
  String get openDecoder => translate('openDecoder');
  String get dailyQuiz => translate('dailyQuiz');
  String get dailyQuizDesc => translate('dailyQuizDesc');
  String get startQuiz => translate('startQuiz');
  String get socialTree => translate('socialTree');
  String get socialTreeDesc => translate('socialTreeDesc');
  String get openTree => translate('openTree');
  String get compareAB => translate('compareAB');
  String get compareABDesc => translate('compareABDesc');
  String get openCompare => translate('openCompare');
  String get cheatSheet => translate('cheatSheet');
  String get cheatSheetDesc => translate('cheatSheetDesc');
  String get openCheatSheet => translate('openCheatSheet');
  String get exploredSignals => translate('exploredSignals');
  String get totalScore => translate('totalScore');
  String get streak => translate('streak');
  String get categoriesTitle => translate('categoriesTitle');
  String get signalReceptive => translate('signalReceptive');
  String get signalCaution => translate('signalCaution');
  String get signalObjection => translate('signalObjection');
  String get listenAloud => translate('listenAloud');
  String get stopAudio => translate('stopAudio');
  String get anatomyClues => translate('anatomyClues');
  String get probableMeaning => translate('probableMeaning');
  String get whatToDo => translate('whatToDo');
  String get salesTip => translate('salesTip');
  String get language => translate('language');
  String get systemLanguage => translate('systemLanguage');
  String get appearance => translate('appearance');
  String get themeLight => translate('themeLight');
  String get themeDark => translate('themeDark');
  String get themeSystem => translate('themeSystem');
  String get highContrast => translate('highContrast');
  String get reduceMotion => translate('reduceMotion');
  String get warmFilter => translate('warmFilter');
  String get haptics => translate('haptics');
  String get ttsVoice => translate('ttsVoice');
  String get resetProgress => translate('resetProgress');
  String get resetConfirm => translate('resetConfirm');
  String get about => translate('about');
  String get version => translate('version');
  String get offlineFirst => translate('offlineFirst');
  String get appearanceSubtitle => translate('appearanceSubtitle');
  String get themeLightShort => translate('themeLightShort');
  String get themeDarkShort => translate('themeDarkShort');
  String get themeAutoShort => translate('themeAutoShort');
  String get languageSectionTitle => translate('languageSectionTitle');
  String get languageSectionSubtitle => translate('languageSectionSubtitle');
  String get systemLanguageDesc => translate('systemLanguageDesc');
  String get accessibilitySectionTitle =>
      translate('accessibilitySectionTitle');
  String get accessibilitySectionSubtitle =>
      translate('accessibilitySectionSubtitle');
  String get highContrastSubtitle => translate('highContrastSubtitle');
  String get reduceMotionSubtitle => translate('reduceMotionSubtitle');
  String get warmFilterTitle => translate('warmFilterTitle');
  String get warmFilterSubtitle => translate('warmFilterSubtitle');
  String get hapticsTitle => translate('hapticsTitle');
  String get hapticsSubtitle => translate('hapticsSubtitle');
  String get soundEffectsTitle => translate('soundEffectsTitle');
  String get soundEffectsSubtitle => translate('soundEffectsSubtitle');
  String get ttsSectionTitle => translate('ttsSectionTitle');
  String get ttsSectionSubtitle => translate('ttsSectionSubtitle');
  String get autoNarrationTitle => translate('autoNarrationTitle');
  String get autoNarrationSubtitle => translate('autoNarrationSubtitle');
  String get ttsSpeedTitle => translate('ttsSpeedTitle');
  String get testVoiceButton => translate('testVoiceButton');
  String get testVoiceSample => translate('testVoiceSample');
  String get fontSizeSectionTitle => translate('fontSizeSectionTitle');
  String get fontSizeSectionSubtitle => translate('fontSizeSectionSubtitle');
  String get fontScaleLabel => translate('fontScaleLabel');
  String get appDataSectionTitle => translate('appDataSectionTitle');
  String get resetProgressTitle => translate('resetProgressTitle');
  String get resetProgressSubtitle => translate('resetProgressSubtitle');
  String get resetProgressDialogTitle => translate('resetProgressDialogTitle');
  String get resetProgressDialogContent =>
      translate('resetProgressDialogContent');
  String get resetProgressButton => translate('resetProgressButton');
  String get progressResetSnackbar => translate('progressResetSnackbar');
  String get cancel => translate('cancel');
  String get filterAll => translate('filterAll');
  String get filterEyes => translate('filterEyes');
  String get filterMouth => translate('filterMouth');
  String get filterEyebrows => translate('filterEyebrows');
  String get filterVoice => translate('filterVoice');
  String get filterArms => translate('filterArms');
  String get filterSpace => translate('filterSpace');
  String get filterDigital => translate('filterDigital');
  String get filterBookmarks => translate('filterBookmarks');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['es', 'en', 'fr', 'pt', 'de'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
