import 'package:flutter/material.dart';

import 'ad_banner_slot.dart';

class AdBottomBar extends StatelessWidget {
  const AdBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: AdBannerSlot(),
    );
  }
}
