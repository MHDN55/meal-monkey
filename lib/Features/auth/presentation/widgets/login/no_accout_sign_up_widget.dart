import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/colors/my_colors.dart';
import '../../../../../core/routes/app_route_const.dart';

class NoAccoutSignUpWidget extends StatelessWidget {
  const NoAccoutSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          "Don't have an Account?",
          style: TextStyle(
            color: MyColors.subtitleTextColor,
            fontSize: 14.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(MyAppRouteConst.signUpPage);
          },
          child: Text(
            textAlign: TextAlign.center,
            "Sign Up",
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
