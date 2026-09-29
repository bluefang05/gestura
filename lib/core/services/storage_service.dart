import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../../models/user_progress.dart';

class StorageService {
  static SharedPreferences? _prefs;

  static void _logError(String op, Object e) {
    if (kDebugMode) {
      debugPrint('[StorageService] Error during $op: $e');
    }
  }

  static Future<void> init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      _logError('init', e);
    }
  }

  // Theme & Accessibility
  static String getThemeMode() {
    return _prefs?.getString(AppConstants.keyThemeMode) ?? 'system';
  }

  static Future<bool> setThemeMode(String mode) async {
    try {
      return (await _prefs?.setString(AppConstants.keyThemeMode, mode)) ??
          false;
    } catch (e) {
      _logError('setThemeMode', e);
      return false;
    }
  }

  static bool getHighContrast() {
    return _prefs?.getBool(AppConstants.keyHighContrast) ?? false;
  }

  static Future<bool> setHighContrast(bool value) async {
    try {
      return (await _prefs?.setBool(AppConstants.keyHighContrast, value)) ??
          false;
    } catch (e) {
      _logError('setHighContrast', e);
      return false;
    }
  }

  static double getTextScale() {
    return _prefs?.getDouble(AppConstants.keyTextScale) ?? 1.0;
  }

  static Future<bool> setTextScale(double scale) async {
    try {
      return (await _prefs?.setDouble(AppConstants.keyTextScale, scale)) ??
          false;
    } catch (e) {
      _logError('setTextScale', e);
      return false;
    }
  }

  static bool getHapticsEnabled() {
    return _prefs?.getBool(AppConstants.keyHapticsEnabled) ?? true;
  }

  static Future<bool> setHapticsEnabled(bool enabled) async {
    try {
      return (await _prefs?.setBool(AppConstants.keyHapticsEnabled, enabled)) ??
          false;
    } catch (e) {
      _logError('setHapticsEnabled', e);
      return false;
    }
  }

  static bool getSoundEffectsEnabled() {
    return _prefs?.getBool(AppConstants.keySoundEffects) ?? true;
  }

  static Future<bool> setSoundEffectsEnabled(bool enabled) async {
    try {
      return (await _prefs?.setBool(AppConstants.keySoundEffects, enabled)) ??
          false;
    } catch (e) {
      _logError('setSoundEffectsEnabled', e);
      return false;
    }
  }

  static bool getReduceMotion() {
    return _prefs?.getBool(AppConstants.keyReduceMotion) ?? false;
  }

  static Future<bool> setReduceMotion(bool value) async {
    try {
      return (await _prefs?.setBool(AppConstants.keyReduceMotion, value)) ??
          false;
    } catch (e) {
      _logError('setReduceMotion', e);
      return false;
    }
  }

  static bool getWarmFilter() {
    return _prefs?.getBool(AppConstants.keyWarmFilter) ?? false;
  }

  static Future<bool> setWarmFilter(bool value) async {
    try {
      return (await _prefs?.setBool(AppConstants.keyWarmFilter, value)) ??
          false;
    } catch (e) {
      _logError('setWarmFilter', e);
      return false;
    }
  }

  static bool getAutoNarration() {
    return _prefs?.getBool(AppConstants.keyAutoNarration) ?? false;
  }

  static Future<bool> setAutoNarration(bool value) async {
    try {
      return (await _prefs?.setBool(AppConstants.keyAutoNarration, value)) ??
          false;
    } catch (e) {
      _logError('setAutoNarration', e);
      return false;
    }
  }

  static double getSpeechRate() {
    return _prefs?.getDouble(AppConstants.keySpeechRate) ?? 0.48;
  }

  static Future<bool> setSpeechRate(double rate) async {
    try {
      return (await _prefs?.setDouble(AppConstants.keySpeechRate, rate)) ??
          false;
    } catch (e) {
      _logError('setSpeechRate', e);
      return false;
    }
  }

  static String? getLanguage() {
    return _prefs?.getString(AppConstants.keyLanguage);
  }

  static Future<bool> setLanguage(String? langCode) async {
    try {
      if (langCode == null) {
        return (await _prefs?.remove(AppConstants.keyLanguage)) ?? false;
      }
      return (await _prefs?.setString(AppConstants.keyLanguage, langCode)) ??
          false;
    } catch (e) {
      _logError('setLanguage', e);
      return false;
    }
  }

  // Bookmarks (Gestures saved by user)
  static List<String> getBookmarks() {
    return _prefs?.getStringList(AppConstants.keyBookmarks) ?? [];
  }

  static Future<bool> toggleBookmark(String gestureId) async {
    try {
      final list = getBookmarks().toList();
      if (list.contains(gestureId)) {
        list.remove(gestureId);
      } else {
        list.add(gestureId);
      }
      return (await _prefs?.setStringList(AppConstants.keyBookmarks, list)) ??
          false;
    } catch (e) {
      _logError('toggleBookmark', e);
      return false;
    }
  }

  static bool isBookmarked(String gestureId) {
    return getBookmarks().contains(gestureId);
  }

  // Progress & Stats
  static UserProgress loadProgress() {
    final raw = _prefs?.getString(AppConstants.keyUserProgress);
    if (raw == null || raw.isEmpty) {
      return UserProgress.initial();
    }
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      return UserProgress.fromJson(json);
    } catch (e) {
      _logError('loadProgress', e);
      return UserProgress.initial();
    }
  }

  static Future<bool> saveProgress(UserProgress progress) async {
    try {
      final raw = jsonEncode(progress.toJson());
      return (await _prefs?.setString(AppConstants.keyUserProgress, raw)) ??
          false;
    } catch (e) {
      _logError('saveProgress', e);
      return false;
    }
  }

  /// Clears only user training progress while strictly preserving bookmarks,
  /// theme, language, accessibility, TTS, and other user preferences.
  static Future<bool> clearProgress() async {
    try {
      final r1 = await _prefs?.remove(AppConstants.keyUserProgress) ?? true;
      final r2 = await _prefs?.remove(AppConstants.keyCompletedQuizzes) ?? true;
      final r3 =
          await _prefs?.remove(AppConstants.keyCompletedScenarios) ?? true;
      return r1 && r2 && r3;
    } catch (e) {
      _logError('clearProgress', e);
      return false;
    }
  }

  /// Resets all application data and preferences completely to defaults.
  static Future<bool> resetApplicationData() async {
    try {
      return (await _prefs?.clear()) ?? false;
    } catch (e) {
      _logError('resetApplicationData', e);
      return false;
    }
  }

  /// @deprecated Use [resetApplicationData] instead. Kept for backward compatibility.
  static Future<bool> clearAll() => resetApplicationData();
}
