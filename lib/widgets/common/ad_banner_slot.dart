import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerSlot extends StatefulWidget {
  final double height;

  const AdBannerSlot({
    super.key,
    this.height = 50.0,
  });

  @override
  State<AdBannerSlot> createState() => _AdBannerSlotState();
}

class _AdBannerSlotState extends State<AdBannerSlot> {
  BannerAd? _bannerAd;
  bool _isAdLoaded = false;
  bool _isLoadingAd = false;

  // Real AdMob Banner ID provided by user
  static const String _realBannerId = 'ca-app-pub-3322493998376707/2486589736';
  // Official Google Test Banner ID for safe debugging
  static const String _testBannerId = 'ca-app-pub-3940256099942544/6300978111';

  String get _adUnitId => kDebugMode ? _testBannerId : _realBannerId;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    if (_bannerAd != null || _isLoadingAd) {
      return;
    }

    _isLoadingAd = true;

    try {
      _bannerAd = BannerAd(
        adUnitId: _adUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            if (mounted) {
              setState(() {
                _isAdLoaded = true;
                _isLoadingAd = false;
              });
            }
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            if (mounted) {
              setState(() {
                _bannerAd = null;
                _isAdLoaded = false;
                _isLoadingAd = false;
              });
            }
            if (kDebugMode) {
              print('AdMob Banner failed to load: $error');
            }
          },
        ),
      )..load();
    } catch (e) {
      _isLoadingAd = false;
      if (kDebugMode) {
        print('AdMob initialization error: $e');
      }
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
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
                'Gestura • Espacio Publicitario',
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
