import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gestura/widgets/illustrations/illustration_widget.dart';

void main() {
  for (final requestedWidth in [300.0, double.infinity]) {
    testWidgets('Constrained illustrations decode within their display bounds '
        '(requested width $requestedWidth)', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: MediaQuery(
          data: const MediaQueryData(devicePixelRatio: 3),
          child: Center(
            child: SizedBox(
              width: 80,
              height: 56,
              child: ConoVeIllustration(
                illustrationKey: 'logo',
                width: requestedWidth,
                height: double.infinity,
                enableHoldPreview: false,
              ),
            ),
          ),
        ),
      ));

      final image = tester.widget<Image>(find.byType(Image));
      final provider = image.image as ResizeImage;
      // The 80x56 display has four logical pixels of padding on each side.
      // A larger request or an infinite preview must not decode at 512x512.
      expect(provider.width, 216);
      expect(provider.height, 144);
      expect(provider.policy, ResizeImagePolicy.fit);
      expect(tester.getSize(find.byType(Image)), const Size(72, 48));
      expect(tester.takeException(), isNull);
    });
  }
}
