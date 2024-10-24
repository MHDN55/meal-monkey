import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/routes/app_route_const.dart';

import '../../../../../core/colors/my_colors.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(MyAppRouteConst.forgotPasswordPage);
      },
      child: Text(
        textAlign: TextAlign.center,
        "Forgot your password?",
        style: TextStyle(
          color: MyColors.subtitleTextColor,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
