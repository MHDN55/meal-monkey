
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/my_colors.dart';

class SubtitleLoginWidget extends StatelessWidget {
  const SubtitleLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "Add your details to login",
      style: TextStyle(
        color: MyColors.subtitleTextColor,
        fontSize: 14.sp,
      ),
    );
  }
}
