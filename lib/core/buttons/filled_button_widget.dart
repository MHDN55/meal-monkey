import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/my_colors.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 260.w,
      height: 56.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      color: MyColors.orangeColor,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
