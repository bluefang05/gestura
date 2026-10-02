import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// The SDK's channel uses a custom codec for native ad events.
// ignore: implementation_imports
import 'package:google_mobile_ads/src/ad_instance_manager.dart';
import 'package:gestura/core/navigation/app_route_observer.dart';
import 'package:gestura/core/services/ads/ads_service.dart';
import 'package:gestura/widgets/common/ad_banner_slot.dart';

void main() {
  testWidgets(
      'Ads recover initialization and load failures and follow visible routes',
      (tester) async {
    final initialization = Completer<InitializationStatus>();
    var initCalls = 0;
    final loads = <int>[];
    final disposed = <int>[];
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(instanceManager.channel, (call) async {
      if (call.method == 'MobileAds#initialize') {
        initCalls++;
        return initCalls == 1
            ? initialization.future
            : InitializationStatus({});
      }
      if (call.method == 'loadBannerAd') {
        loads.add((call.arguments as Map)['adId'] as int);
        if (loads.length == 1) throw PlatformException(code: 'network');
      }
      if (call.method == 'disposeAd') {
        disposed.add((call.arguments as Map)['adId'] as int);
      }
      return null;
    });
    final navigator = GlobalKey<NavigatorState>();
    await tester.pumpWidget(MaterialApp(
      navigatorKey: navigator,
      navigatorObservers: [appRouteObserver],
      home: const Scaffold(body: AdBannerSlot()),
    ));
    final startup = AdsService.instance.initialize();
    await tester.pump();
    expect(initCalls, 1);
    expect(loads, isEmpty);
    navigator.currentState!.push(MaterialPageRoute<void>(
        builder: (_) => const Scaffold(body: AdBannerSlot())));
    await tester.pumpAndSettle();
    navigator.currentState!.pop();
    await tester.pumpAndSettle();
    initialization.completeError(PlatformException(code: 'initialization'));
    await tester.pump();
    await startup;
    expect(loads, isEmpty);
    await tester.pump(const Duration(seconds: 5));
    await tester.pump();
    expect(initCalls, 2);
    expect(loads.length, 1);
    expect(disposed, contains(loads.first));
    await tester.pump(const Duration(seconds: 10));
    await tester.pump();
    expect(loads.length, 2);

    final event = MethodCall('onAdEvent', {
      'adId': loads.last,
      'eventName': 'onAdFailedToLoad',
      'loadAdError': LoadAdError(3, 'test', 'No fill', null),
    });
    await tester.binding.defaultBinaryMessenger.handlePlatformMessage(
        instanceManager.channel.name,
        instanceManager.channel.codec.encodeMethodCall(event),
        (_) {});
    await tester.pump(const Duration(seconds: 20));
    await tester.pump();
    expect(loads.length, 3);
    final rootAd = loads.last;
    navigator.currentState!.push(MaterialPageRoute<void>(
        builder: (_) => const Scaffold(body: AdBannerSlot())));
    await tester.pumpAndSettle();
    expect(disposed, contains(rootAd));
    expect(loads.length, 4);
    final lessonAd = loads.last;
    navigator.currentState!.pop();
    await tester.pumpAndSettle();
    expect(disposed, contains(lessonAd));
    expect(loads.length, 5);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(minutes: 1));
    expect(loads.length, 5);
    expect(tester.takeException(), isNull);
    messenger.setMockMethodCallHandler(instanceManager.channel, null);
  });
}
