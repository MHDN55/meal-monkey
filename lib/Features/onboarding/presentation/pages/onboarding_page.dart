import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/buttons/filled_button_widget.dart';
import '../../../../core/routes/app_route_const.dart';
import '../../data/datasources/onboarding_local_data_source.dart';
import '../widgets/onboarding_page_widgets/custom_smooth_page_indicator_widget.dart';
import '../widgets/onboarding_page_widgets/three_pages_onboarding_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ThreePagesOnboardingWidget(
                index: index,
              );
            },
          ),
          CustomSmoothPageIndicatorWidget(
            controller: _controller,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FilledButtonWidget(
                buttonText: "Next",
                onPressed: () {
                  if (_controller.page!.round() != 2) {
                    _controller.animateToPage(
                      _controller.page!.round() + 1,
                      duration: Durations.extralong4,
                      curve: Curves.bounceOut,
                    );
                  } else {
                    OnboardingLocalDataSourceImpl().cachingOnboarding(true);
                    
                    context.pushReplacementNamed(
                      MyAppRouteConst.afterOnboardingPage,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
