import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/my_colors.dart';

class TitleForgotPassWidget extends StatelessWidget {
  const TitleForgotPassWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "Reset Password",
      style: TextStyle(
        color: MyColors.titleTextColor,
        fontSize: 30.sp,
      ),
    );
  }
}
