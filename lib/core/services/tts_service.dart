import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../localization/app_language.dart';
import 'storage_service.dart';

class TtsService {
  static final FlutterTts _tts = FlutterTts();
  static bool _isInitialized = false;
  static int _speechRequest = 0;
  static final ValueNotifier<bool> isSpeakingNotifier =
      ValueNotifier<bool>(false);
  static String? _currentSpeakingId;

  static ValueNotifier<String?> currentSpeakingIdNotifier =
      ValueNotifier<String?>(null);

  static String _currentLanguage = 'es-MX';
  static double _currentRate = 0.48;
  static bool _voiceReady = false;
  static Future<void>? _configuration;
  static final ValueNotifier<String?> errorNotifier = ValueNotifier(null);

  static String get currentLanguage => _currentLanguage;
  static double get currentRate => _currentRate;

  static Future<void> init({String? langCode, double? speechRate}) async {
    final preferred = langCode ?? StorageService.getLanguage();
    final locale = preferred == null
        ? AppLanguage.resolve(
            WidgetsBinding.instance.platformDispatcher.locales)
        : AppLanguage.fromPreference(preferred);
    final desiredTag = AppLanguage.speechTag(locale);
    final rate =
        (speechRate ?? StorageService.getSpeechRate()).clamp(0.25, 1.0);
    final previous = _configuration;
    final completion = Completer<void>();
    _configuration = completion.future;
    try {
      if (previous != null) await previous;
      await _configure(desiredTag, rate);
    } finally {
      if (identical(_configuration, completion.future)) _configuration = null;
      completion.complete();
    }
  }

  static Future<bool> _available(String tag) async {
    final result = await _tts.isLanguageAvailable(tag);
    return result == true || result == 1;
  }

  static Future<String?> _selectVoiceLanguage(String desired) async {
    if (await _available(desired)) return desired;
    final language = desired.split('-').first;
    final languages = await _tts.getLanguages;
    if (languages is Iterable) {
      final candidates = languages
          .whereType<String>()
          .map((tag) => tag.replaceAll('_', '-'))
          .where((tag) => tag.split('-').first.toLowerCase() == language)
          .toList()
        ..sort();
      // Prefer another Latin American voice over Spain for Latin Spanish.
      if (desired == 'es-MX') {
        candidates.sort((a, b) => (a.toLowerCase() == 'es-es' ? 1 : 0)
            .compareTo(b.toLowerCase() == 'es-es' ? 1 : 0));
      }
      for (final candidate in candidates) {
        if (await _available(candidate)) return candidate;
      }
    }
    if (await _available(language)) return language;
    return null;
  }

  static Future<void> _configure(String desiredTag, double rate) async {
    _voiceReady = false;
    errorNotifier.value = null;
    try {
      final availableTag = await _selectVoiceLanguage(desiredTag);
      if (availableTag == null) {
        errorNotifier.value = 'voiceUnavailable';
        return;
      }
      final result = await _tts.setLanguage(availableTag);
      if (result == false || result == 0) {
        errorNotifier.value = 'voiceUnavailable';
        return;
      }
      _currentLanguage = availableTag;
      _currentRate = rate;
      await _tts.setSpeechRate(rate);
      await _tts.setVolume(1.0);
      await _tts.setPitch(1.0);
      if (!_isInitialized) {
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
          errorNotifier.value = 'voiceFailed';
          if (kDebugMode) {
            print('TTS Error: $msg');
          }
        });

        _isInitialized = true;
      }
      _voiceReady = true;
    } catch (e) {
      errorNotifier.value = 'voiceFailed';
      if (kDebugMode) {
        print('TTS Init failed: $e');
      }
    }
  }

  static Future<void> speak(String text,
      {String? gestureId, String? langCode}) async {
    if (text.trim().isEmpty) return;
    if (isSpeakingGesture(gestureId ?? '') && gestureId != null) {
      await stop();
      return;
    }
    final request = ++_speechRequest;
    isSpeakingNotifier.value = false;
    currentSpeakingIdNotifier.value = null;
    _currentSpeakingId = null;
    try {
      await _tts.stop();
    } catch (_) {}
    if (request != _speechRequest) return;
    await init(langCode: langCode);
    if (request != _speechRequest || !_voiceReady) return;
    try {
      _currentSpeakingId = gestureId;
      currentSpeakingIdNotifier.value = gestureId;
      final result = await _tts.speak(text);
      if (result == false || result == 0) {
        isSpeakingNotifier.value = false;
        currentSpeakingIdNotifier.value = null;
        _currentSpeakingId = null;
        errorNotifier.value = 'voiceFailed';
      }
    } catch (e) {
      isSpeakingNotifier.value = false;
      currentSpeakingIdNotifier.value = null;
      _currentSpeakingId = null;
      errorNotifier.value = 'voiceFailed';
      if (kDebugMode) {
        print('TTS Speak Error: $e');
      }
    }
  }

  static Future<void> stop() async {
    ++_speechRequest;
    isSpeakingNotifier.value = false;
    currentSpeakingIdNotifier.value = null;
    _currentSpeakingId = null;
    try {
      await _tts.stop();
    } catch (_) {}
  }

  static bool isSpeakingGesture(String? gestureId) {
    return isSpeakingNotifier.value && _currentSpeakingId == gestureId;
  }

  static Future<void> speakSpanish(String text, {String? gestureId}) {
    final preferred = StorageService.getLanguage();
    final locale = preferred == null
        ? AppLanguage.resolve(
            WidgetsBinding.instance.platformDispatcher.locales)
        : AppLanguage.fromPreference(preferred);
    return speak(text,
        gestureId: gestureId,
        langCode: locale == AppLanguage.spainSpanish ? 'es-ES' : 'es-419');
  }

  static Future<void> setSpeechRate(double rate) async {
    _currentRate = rate.clamp(0.25, 1.0);
    await StorageService.setSpeechRate(_currentRate);
    try {
      await _tts.setSpeechRate(_currentRate);
    } catch (_) {}
  }

  static Future<void> updateLanguage(String? code) async {
    await stop();
    await init(langCode: code);
  }

  // --- High-Level Narration Helpers for 100% Reading-Optional UX ---

  static Future<void> speakQuizQuestion({
    required String question,
    String? scenarioText,
    String? visualClue,
    required List<String> options,
    String? tag,
  }) async {
    final buffer = StringBuffer();
    if (scenarioText != null && scenarioText.trim().isNotEmpty) {
      buffer.write('Contexto: ${scenarioText.trim()}. ');
    }
    buffer.write('Pregunta: $question. ');
    if (visualClue != null && visualClue.isNotEmpty) {
      buffer.write('Pista clave observable: $visualClue. ');
    }
    buffer.write('Opciones: ');
    for (int i = 0; i < options.length; i++) {
      buffer.write('${options[i]}. ');
    }
    await speakSpanish(buffer.toString(), gestureId: tag ?? 'quiz_question');
  }

  static Future<void> speakQuizFeedback({
    required bool isCorrect,
    required String keyVisualClue,
    required String explanation,
    String? correctAnswer,
  }) async {
    final status = isCorrect ? '¡Respuesta correcta!' : 'Respuesta incorrecta.';
    final text =
        '$status ${correctAnswer == null ? "" : "Respuesta: $correctAnswer. "}Qué observar: $keyVisualClue. Explicación: $explanation';
    await speakSpanish(text, gestureId: 'quiz_feedback');
  }

  static Future<void> speakScenarioStep({
    required String narrative,
    String? characterAction,
    required List<String> signals,
    List<String>? choices,
    String? tag,
  }) async {
    final buffer = StringBuffer();
    buffer.write('Situación: $narrative. ');
    if (characterAction != null && characterAction.trim().isNotEmpty) {
      buffer.write('Acción corporal visible: ${characterAction.trim()}. ');
    }
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
    await speakSpanish(buffer.toString(), gestureId: tag ?? 'scenario_step');
  }

  static Future<void> speakScenarioOutcome({
    required bool isBestAction,
    required String resultTitle,
    required String explanation,
    String? learningTakeaway,
  }) async {
    final quality = isBestAction
        ? 'Excelente decisión táctica.'
        : 'Acción con áreas de oportunidad.';
    final buffer = StringBuffer();
    buffer.write(
        '$quality $resultTitle. Explicación psicológica: $explanation. ');
    if (learningTakeaway != null && learningTakeaway.trim().isNotEmpty) {
      buffer.write('Lección clave teórica: ${learningTakeaway.trim()}');
    }
    await speakSpanish(buffer.toString(), gestureId: 'scenario_outcome');
  }

  static Future<void> speakTacticalTip({
    required String name,
    required String rule,
    required String whatToDo,
    String? category,
  }) async {
    final cat = category != null ? 'Categoría: $category. ' : '';
    final text = '$name. $cat Regla rápida: $rule. Qué debes hacer: $whatToDo';
    await speakSpanish(text, gestureId: 'tactical_tip_$name');
  }
}
