import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/my_colors.dart';

class TitleSignupWidget extends StatelessWidget {
  const TitleSignupWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "Sign Up",
      style: TextStyle(
        color: MyColors.titleTextColor,
        fontSize: 30.sp,
      ),
    );
  }
}
