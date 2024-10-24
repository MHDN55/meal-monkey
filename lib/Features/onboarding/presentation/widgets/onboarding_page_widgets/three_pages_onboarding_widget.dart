import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_images/app_images.dart';
import '../../../domain/entities/onboarding_object.dart';

class ThreePagesOnboardingWidget extends StatefulWidget {
  const ThreePagesOnboardingWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<ThreePagesOnboardingWidget> createState() =>
      _ThreePagesOnboardingWidgetState();
}

class _ThreePagesOnboardingWidgetState
    extends State<ThreePagesOnboardingWidget> {
  List<OnboardingObject> onboardingobjects = [
    OnboardingObject(
      image: Assets.assetsImagesFindFoodYouLoveVector,
      title: "Find Food You Love",
      subtitle:
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your doorstep",
    ),
    OnboardingObject(
      image: Assets.assetsImagesDeliveryVector,
      title: "Fast Delivery",
      subtitle: "Fast food delivery to your home, office\nwherever you are",
    ),
    OnboardingObject(
      image: Assets.assetsImagesLiveTrackingVector,
      title: "Live Tracking",
      subtitle:
          "Real time tracking of your food on the app\nonce you placed the order",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Image.asset(
            onboardingobjects[widget.index].image,
            width: 250.w,
            height: 250.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Text(
            onboardingobjects[widget.index].title,
            style: TextStyle(
              fontSize: 25.sp,
              color: const Color(0xff4A4B4D),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 80.h),
          child: Text(
            onboardingobjects[widget.index].subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              color: const Color(0xff7C7D7E),
            ),
          ),
        ),
      ],
    );
  }
}
