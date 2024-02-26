import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_test_weather/components/constants/app_constants.dart';

import '../../../../components/entities/blured_circle.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      CustomPaint(
        foregroundPainter: CircleBlurPainter(circleWidth: 20, blurSigma: 30.0),
        child: const SizedBox(
          height: 170,
          width: 170,
        ),
      ),
      SizedBox(
        height: 200,
        width: 200,
        child: Image.asset(AppConstants.cloudImage),
      ),
    ]);
  }
}
