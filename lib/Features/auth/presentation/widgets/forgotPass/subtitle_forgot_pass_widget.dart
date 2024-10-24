
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/my_colors.dart';

class SubtitleForgotPassWidget extends StatelessWidget {
  const SubtitleForgotPassWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "Please enter your email to receive a\nlink to  create a new password via email",
      style: TextStyle(
        color: MyColors.subtitleTextColor,
        fontSize: 14.sp,
      ),
    );
  }
}
