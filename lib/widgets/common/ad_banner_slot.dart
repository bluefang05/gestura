import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../core/services/ads/ads_service.dart';
import '../../core/navigation/app_route_observer.dart';

class AdBannerSlot extends StatefulWidget {
  final double height;

  const AdBannerSlot({
    super.key,
    this.height = 50.0,
  });

  @override
  State<AdBannerSlot> createState() => _AdBannerSlotState();
}

class _AdBannerSlotState extends State<AdBannerSlot> with RouteAware {
  BannerAd? _bannerAd;
  PageRoute<dynamic>? _route;
  bool _isAdLoaded = false;
  bool _isLoadingAd = false;
  int _retryAttempt = 0;
  Timer? _retryTimer;
  bool _isRouteVisible = true;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute<dynamic> && route != _route) {
      if (_route != null) appRouteObserver.unsubscribe(this);
      _route = route;
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void didPush() => _isRouteVisible = true;

  @override
  void didPop() => _isRouteVisible = false;

  @override
  void didPushNext() {
    _isRouteVisible = false;
    _retryTimer?.cancel();
    _retryTimer = null;
    _disposeBanner();
  }

  @override
  void didPopNext() {
    _isRouteVisible = true;
    _loadBannerAd();
  }

  void _disposeBanner() {
    _bannerAd?.dispose();
    _bannerAd = null;
    _isAdLoaded = false;
    _isLoadingAd = false;
  }

  Future<void> _loadBannerAd() async {
    if (!_isRouteVisible || _bannerAd != null || _isLoadingAd) {
      return;
    }

    _isLoadingAd = true;

    try {
      await AdsService.instance.initialize();
      if (!mounted || !_isRouteVisible) {
        _isLoadingAd = false;
        return;
      }
      _bannerAd = AdsService.instance.createBannerAd(
        onAdLoaded: (ad) {
          if (!mounted || !_isRouteVisible || _bannerAd != ad) {
            ad.dispose();
            return;
          }
          if (mounted) {
            setState(() {
              _isAdLoaded = true;
              _isLoadingAd = false;
              _retryAttempt = 0;
            });
          }
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          if (_bannerAd != ad) return;
          if (mounted) {
            setState(() {
              _bannerAd = null;
              _isAdLoaded = false;
              _isLoadingAd = false;
            });
          }
          _scheduleRetry();
          if (kDebugMode) {
            debugPrint('[AdBannerSlot] AdMob Banner failed to load: $error');
          }
        },
      )..load();
    } catch (e) {
      _isLoadingAd = false;
      _scheduleRetry();
      if (kDebugMode) {
        debugPrint('[AdBannerSlot] AdMob initialization error: $e');
      }
    }
  }

  void _scheduleRetry() {
    if (!mounted || _retryTimer?.isActive == true) return;
    _retryAttempt++;
    final seconds = math.min(60, 5 * (1 << math.min(_retryAttempt - 1, 4)));
    _retryTimer = Timer(Duration(seconds: seconds), () {
      _retryTimer = null;
      _loadBannerAd();
    });
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    _retryTimer?.cancel();
    _disposeBanner();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF0F172A) : Colors.white;
    final borderColor = isDark ? Colors.white12 : Colors.black12;

    return Container(
      width: double.infinity,
      height: widget.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(top: BorderSide(color: borderColor, width: 0.8)),
      ),
      alignment: Alignment.center,
      child: _isAdLoaded && _bannerAd != null
          ? SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            )
          : _AdPlaceholder(
              height: widget.height,
              isDark: isDark,
            ),
    );
  }
}

class _AdPlaceholder extends StatelessWidget {
  final double height;
  final bool isDark;

  const _AdPlaceholder({
    required this.height,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final badgeBackground =
        isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155);
    final badgeText = isDark ? const Color(0xFF0F172A) : Colors.white;
    final labelColor =
        isDark ? const Color(0xFFE2E8F0) : const Color(0xFF334155);

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
        border: Border.all(
          color: isDark ? Colors.white12 : Colors.black12,
          width: 0.8,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: badgeBackground,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'AD',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: badgeText,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Anuncio • Gestura',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: labelColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
