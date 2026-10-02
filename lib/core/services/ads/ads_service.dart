import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_ids.dart';

/// Centralized service managing Google Mobile Ads initialization and banner lifecycle.
/// Decouples advertising logic from presentation widgets.
class AdsService {
  AdsService._internal();
  static final AdsService instance = AdsService._internal();

  bool _isInitialized = false;
  Future<void>? _initialization;
  bool get isInitialized => _isInitialized;

  /// Initializes the Google Mobile Ads SDK safely.
  /// Designed to be called asynchronously in background without blocking app startup.
  Future<void> initialize() {
    if (_isInitialized) return Future<void>.value();
    return _initialization ??= _initialize();
  }

  Future<void> _initialize() async {
    try {
      await MobileAds.instance.initialize();
      _isInitialized = true;
      if (kDebugMode) {
        debugPrint('[AdsService] Google Mobile Ads initialized successfully.');
      }
    } catch (e) {
      _initialization = null;
      if (kDebugMode) {
        debugPrint('[AdsService] Failed to initialize Google Mobile Ads: $e');
      }
    }
  }

  /// Creates a [BannerAd] with centralized configurations and error listeners.
  BannerAd createBannerAd({
    required void Function(Ad ad) onAdLoaded,
    required void Function(Ad ad, LoadAdError error) onAdFailedToLoad,
    AdSize size = AdSize.banner,
  }) {
    return BannerAd(
      adUnitId: AdIds.bannerAdUnitId,
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: onAdLoaded,
        onAdFailedToLoad: onAdFailedToLoad,
      ),
    );
  }
}
