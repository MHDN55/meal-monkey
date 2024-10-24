import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/colors/my_colors.dart';

class CustomSmoothPageIndicatorWidget extends StatelessWidget {
  const CustomSmoothPageIndicatorWidget({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.1),
      child: SmoothPageIndicator(
        effect: const WormEffect(
          dotWidth: 8,
          dotHeight: 8,
          activeDotColor: MyColors.orangeColor,
        ),
        controller: _controller,
        count: 3,
        onDotClicked: (index) {
          _controller.animateToPage(
            index,
            duration: Durations.extralong4,
            curve: Curves.bounceOut,
          );
        },
      ),
    );
  }
}
