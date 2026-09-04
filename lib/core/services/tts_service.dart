import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'storage_service.dart';

class TtsService {
  static final FlutterTts _tts = FlutterTts();
  static bool _isInitialized = false;
  static final ValueNotifier<bool> isSpeakingNotifier =
      ValueNotifier<bool>(false);
  static String? _currentSpeakingId;

  static ValueNotifier<String?> currentSpeakingIdNotifier =
      ValueNotifier<String?>(null);

  static String _currentLanguage = 'es-ES';
  static double _currentRate = 0.48;

  static String get currentLanguage => _currentLanguage;
  static double get currentRate => _currentRate;

  static Future<void> init({String? langCode, double? speechRate}) async {
    // 1. Language: prioritize explicit parameter, then persisted preference, fallback to es
    final effectiveLang = langCode ?? StorageService.getLanguage();
    if (effectiveLang != null) {
      _setLanguageTag(effectiveLang);
    } else {
      _setLanguageTag('es');
    }

    // 2. Speech Rate: prioritize explicit parameter, then persisted preference with clamp
    final rawRate = speechRate ?? StorageService.getSpeechRate();
    _currentRate = rawRate.clamp(0.25, 1.0);

    if (_isInitialized) {
      try {
        await _tts.setLanguage(_currentLanguage);
        await _tts.setSpeechRate(_currentRate);
      } catch (_) {}
      return;
    }
    try {
      final isAvail = await _tts.isLanguageAvailable(_currentLanguage);
      if (isAvail != 1 && isAvail != true) {
        _currentLanguage = 'es-ES';
      }

      await _tts.setLanguage(_currentLanguage);
      await _tts.setSpeechRate(_currentRate);
      await _tts.setVolume(1.0);
      await _tts.setPitch(1.0);

      _tts.setStartHandler(() {
        isSpeakingNotifier.value = true;
      });

      _tts.setCompletionHandler(() {
        isSpeakingNotifier.value = false;
        currentSpeakingIdNotifier.value = null;
        _currentSpeakingId = null;
      });

      _tts.setCancelHandler(() {
        isSpeakingNotifier.value = false;
        currentSpeakingIdNotifier.value = null;
        _currentSpeakingId = null;
      });

      _tts.setErrorHandler((msg) {
        isSpeakingNotifier.value = false;
        currentSpeakingIdNotifier.value = null;
        _currentSpeakingId = null;
        if (kDebugMode) {
          print('TTS Error: $msg');
        }
      });

      _isInitialized = true;
    } catch (e) {
      if (kDebugMode) {
        print('TTS Init failed: $e');
      }
    }
  }

  static Future<void> speak(String text, {String? gestureId}) async {
    await init();
    try {
      // If currently speaking this exact gesture, stop it (toggle)
      if (isSpeakingNotifier.value &&
          _currentSpeakingId == gestureId &&
          gestureId != null) {
        await stop();
        return;
      }

      await stop();
      _currentSpeakingId = gestureId;
      currentSpeakingIdNotifier.value = gestureId;
      await _tts.speak(text);
    } catch (e) {
      if (kDebugMode) {
        print('TTS Speak Error: $e');
      }
    }
  }

  static Future<void> stop() async {
    try {
      await _tts.stop();
      isSpeakingNotifier.value = false;
      currentSpeakingIdNotifier.value = null;
      _currentSpeakingId = null;
    } catch (_) {}
  }

  static bool isSpeakingGesture(String? gestureId) {
    return isSpeakingNotifier.value && _currentSpeakingId == gestureId;
  }

  static void _setLanguageTag(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        _currentLanguage = 'en-US';
        break;
      case 'fr':
        _currentLanguage = 'fr-FR';
        break;
      case 'pt':
        _currentLanguage = 'pt-BR';
        break;
      case 'de':
        _currentLanguage = 'de-DE';
        break;
      case 'es':
      default:
        _currentLanguage = 'es-ES';
        break;
    }
  }

  static Future<void> setSpeechRate(double rate) async {
    _currentRate = rate.clamp(0.25, 1.0);
    await StorageService.setSpeechRate(_currentRate);
    try {
      await _tts.setSpeechRate(_currentRate);
    } catch (_) {}
  }

  static Future<void> updateLanguage(String code) async {
    _setLanguageTag(code);
    try {
      await _tts.setLanguage(_currentLanguage);
    } catch (_) {}
  }

  // --- High-Level Narration Helpers for 100% Reading-Optional UX ---

  static Future<void> speakQuizQuestion({
    required String question,
    String? visualClue,
    required List<String> options,
    String? tag,
  }) async {
    final buffer = StringBuffer();
    buffer.write('Pregunta: $question. ');
    if (visualClue != null && visualClue.isNotEmpty) {
      buffer.write('Pista visual: $visualClue. ');
    }
    buffer.write('Opciones: ');
    for (int i = 0; i < options.length; i++) {
      final letter = String.fromCharCode(65 + i);
      buffer.write('Opción $letter: ${options[i]}. ');
    }
    await speak(buffer.toString(), gestureId: tag ?? 'quiz_question');
  }

  static Future<void> speakQuizFeedback({
    required bool isCorrect,
    required String keyVisualClue,
    required String explanation,
  }) async {
    final status = isCorrect ? '¡Respuesta correcta!' : 'Respuesta incorrecta.';
    final text =
        '$status Pista clave: $keyVisualClue. Explicación: $explanation';
    await speak(text, gestureId: 'quiz_feedback');
  }

  static Future<void> speakScenarioStep({
    required String narrative,
    required List<String> signals,
    List<String>? choices,
    String? tag,
  }) async {
    final buffer = StringBuffer();
    buffer.write('Situación: $narrative. ');
    if (signals.isNotEmpty) {
      buffer.write('Señales corporales detectadas: ${signals.join(", ")}. ');
    }
    if (choices != null && choices.isNotEmpty) {
      buffer.write('¿Qué decides hacer? ');
      for (int i = 0; i < choices.length; i++) {
        final letter = String.fromCharCode(65 + i);
        buffer.write('Opción $letter: ${choices[i]}. ');
      }
    }
    await speak(buffer.toString(), gestureId: tag ?? 'scenario_step');
  }

  static Future<void> speakScenarioOutcome({
    required bool isBestAction,
    required String resultTitle,
    required String explanation,
  }) async {
    final quality = isBestAction
        ? 'Excelente decisión táctica.'
        : 'Acción con áreas de oportunidad.';
    final text = '$quality $resultTitle. Explicación psicológica: $explanation';
    await speak(text, gestureId: 'scenario_outcome');
  }

  static Future<void> speakTacticalTip({
    required String name,
    required String rule,
    required String whatToDo,
    String? category,
  }) async {
    final cat = category != null ? 'Categoría: $category. ' : '';
    final text = '$name. $cat Regla rápida: $rule. Qué debes hacer: $whatToDo';
    await speak(text, gestureId: 'tactical_tip_$name');
  }
}
