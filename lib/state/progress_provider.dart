import 'package:flutter/material.dart';
import '../models/user_progress.dart';
import '../core/services/storage_service.dart';

class ProgressProvider extends ChangeNotifier {
  static final ProgressProvider _instance = ProgressProvider._internal();
  factory ProgressProvider() => _instance;

  ProgressProvider._internal() {
    loadProgress();
  }

  UserProgress _progress = UserProgress.initial();
  List<String> _bookmarks = [];

  UserProgress get progress => _progress;
  List<String> get bookmarks => List.unmodifiable(_bookmarks);

  void loadProgress() {
    _progress = StorageService.loadProgress();
    _bookmarks = StorageService.getBookmarks();
    notifyListeners();
  }

  Future<void> resetProgress() async {
    await StorageService.clearProgress();
    _progress = UserProgress.initial();
    _bookmarks = StorageService.getBookmarks();
    notifyListeners();
  }

  Future<void> markGestureExplored(String gestureId) async {
    _progress = _progress.markGestureExplored(gestureId);
    await StorageService.saveProgress(_progress);
    notifyListeners();
  }

  Future<void> recordQuizResult(String quizId, int score) async {
    _progress = _progress.recordQuizResult(quizId, score);
    await StorageService.saveProgress(_progress);
    notifyListeners();
  }

  Future<void> markScenarioCompleted(String scenarioId) async {
    _progress = _progress.markScenarioCompleted(scenarioId);
    await StorageService.saveProgress(_progress);
    notifyListeners();
  }

  Future<void> toggleBookmark(String gestureId) async {
    await StorageService.toggleBookmark(gestureId);
    _bookmarks = StorageService.getBookmarks();
    notifyListeners();
  }

  bool isBookmarked(String gestureId) {
    return _bookmarks.contains(gestureId);
  }
}
