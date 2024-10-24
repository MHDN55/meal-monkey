// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/my_colors.dart';

class BorderButtonWidget extends StatelessWidget {
  const BorderButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  final String buttonText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 260.w,
      height: 56.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: const BorderSide(
          color: MyColors.orangeColor,
        ),
      ),
      color: Colors.white,
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          color: MyColors.orangeColor,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
