import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/my_colors.dart';

class SubtitleTextWidget extends StatefulWidget {
  const SubtitleTextWidget({
    super.key,
  });

  @override
  State<SubtitleTextWidget> createState() => _SubtitleTextWidgetState();
}

class _SubtitleTextWidgetState extends State<SubtitleTextWidget> {
  String subtitle =
      "Discover the best foods from over 1,000\n restaurants and fast delivery to your doorstep";

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 13.sp,
        color: MyColors.subtitleTextColor,
      ),
    );
  }
}
