import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/colors/my_colors.dart';

class FacbookButtonWidget extends StatelessWidget {
  const FacbookButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: MaterialButton(
        minWidth: 240.w,
        height: 55.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        color: MyColors.facebookButtonColor,
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.assetsImagesFacebook,
              height: 16.h,
              width: 16.w,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10.w),
            Text(
              "Login With Facebook",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
