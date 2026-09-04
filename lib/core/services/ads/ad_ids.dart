import 'package:flutter/foundation.dart';

/// Centralized repository of AdMob Unit IDs.
///
/// In debug mode, Google's official sample IDs are served to prevent policy violations
/// and invalid traffic strikes during development and automated tests.
/// In release builds, the registered production IDs for Gestura are utilized.
class AdIds {
  AdIds._();

  /// Official Gestura AdMob production banner ID.
  static const String realBannerId = 'ca-app-pub-3322493998376707/2486589736';

  /// Official Google Mobile Ads test banner ID.
  static const String testBannerId = 'ca-app-pub-3940256099942544/6300978111';

  /// Returns the appropriate banner ad unit ID based on the compilation environment.
  static String get bannerAdUnitId => kDebugMode ? testBannerId : realBannerId;
}
