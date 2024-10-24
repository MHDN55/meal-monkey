import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/my_colors.dart';

class OrLoginWithWidget extends StatelessWidget {
  const OrLoginWithWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      "Or Login With",
      style: TextStyle(
        color: MyColors.subtitleTextColor,
        fontSize: 16.sp,
      ),
    );
  }
}
