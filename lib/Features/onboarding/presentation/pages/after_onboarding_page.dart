import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/buttons/border_button_widget.dart';
import 'package:meal_monkey/core/buttons/filled_button_widget.dart';

import '../../../../core/app_images/app_images.dart';
import '../../../../core/routes/app_route_const.dart';
import '../widgets/after_onboarding_page_widgets/cutted_orange_container_widget.dart';
import '../widgets/after_onboarding_page_widgets/subtitle_text_widget.dart';

class AfterOnboardingPage extends StatefulWidget {
  const AfterOnboardingPage({super.key});

  @override
  State<AfterOnboardingPage> createState() => _AfterOnboardingPageState();
}

class _AfterOnboardingPageState extends State<AfterOnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                const CuttedOrangeContainerWidget(),
                SizedBox(height: 140.h),
                const Expanded(child: SubtitleTextWidget()),
                SizedBox(height: 20.h),
                Expanded(
                  child: FilledButtonWidget(
                    buttonText: "Login",
                    onPressed: () {
                      context.pushReplacementNamed(
                        MyAppRouteConst.loginPage,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: BorderButtonWidget(
                    buttonText: "Create an Account",
                    onPressed: () {
                      context.pushReplacementNamed(
                        MyAppRouteConst.signupPage,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.05),
            child: SvgPicture.asset(
              Assets.assetsImagesLogo,
            ),
          ),
        ],
      ),
    );
  }
}
