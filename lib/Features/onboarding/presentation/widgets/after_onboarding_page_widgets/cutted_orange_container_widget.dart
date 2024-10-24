import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/app_images/app_images.dart';
import '../../../../../core/colors/my_colors.dart';

class CuttedOrangeContainerWidget extends StatelessWidget {
  const CuttedOrangeContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335.h,
      width: 360.w,
      child: Stack(
        children: [
          Container(
            height: 320.h,
            width: 360.w,
            decoration: const BoxDecoration(
              color: MyColors.orangeColor,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100.h,
              width: 160.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 120.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: MyColors.orangeColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 30,
                    color: MyColors.orangeColor,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 120.h,
              width: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: MyColors.orangeColor,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 30,
                    color: MyColors.orangeColor,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            Assets.assetsImagesOnboardingBackgroundObjects,
            fit: BoxFit.cover,
            width: 360.w,
            height: 335.h,
          ),
        ],
      ),
    );
  }
}
