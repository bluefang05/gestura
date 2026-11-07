import 'package:flutter/widgets.dart';
import '../services/tts_service.dart';

final RouteObserver<PageRoute<dynamic>> appRouteObserver =
    RouteObserver<PageRoute<dynamic>>();

/// Includes popup routes: text from a closed dialog must not keep playing.
class SpeechRouteObserver extends NavigatorObserver {
  final changes = ValueNotifier<int>(0);

  void _changed() {
    TtsService.stop();
    changes.value++;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _changed();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _changed();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _changed();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _changed();
  }
}
