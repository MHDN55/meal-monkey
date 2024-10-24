import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/routes/app_route_const.dart';

import '../../../../../core/colors/my_colors.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          "Already have an Account?",
          style: TextStyle(
            color: MyColors.subtitleTextColor,
            fontSize: 14.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(MyAppRouteConst.loginPage);
          },
          child: Text(
            textAlign: TextAlign.center,
            "Login",
            style: TextStyle(
              color: MyColors.orangeColor,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
        ),
      ],
    );
  }
}
