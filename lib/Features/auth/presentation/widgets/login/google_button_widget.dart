import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/colors/my_colors.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({
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
        color: MyColors.googleButtonColor,
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.assetsImagesGooglePlusLogo,
              height: 16.h,
              width: 16.w,
            ),
            SizedBox(width: 10.w),
            Text(
              "Login With Google",
              textAlign: TextAlign.left,
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
