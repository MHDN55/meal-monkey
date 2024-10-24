import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/core/colors/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
        onTab: (value) {
          /// perform action here
          // ignore: avoid_print
          print(value);
        },
        activeIcon: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: MyColors.orangeColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.home_rounded,
            size: 50,
            color: Colors.white,
          ),
        ),
        inActiveIcon: Container(
          height: 72.h,
          width: 72.w,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xffB6B7B7),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.home_outlined,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
      activeColor: MyColors.orangeColor,
      navBarBackgroundColor: Colors.white,
      inActiveColor: Colors.black45,
      appBarItems: [
        FABBottomAppBarItem(
          activeIcon: const Icon(
            Icons.menu_rounded,
            color: MyColors.orangeColor,
          ),
          inActiveIcon: const Icon(
            Icons.menu_outlined,
            color: Colors.black26,
          ),
          text: 'Menu',
        ),
        FABBottomAppBarItem(
          activeIcon: const Icon(
            Icons.person_2_rounded,
            color: MyColors.orangeColor,
          ),
          inActiveIcon: const Icon(
            Icons.person_2_outlined,
            color: Colors.black26,
          ),
          text: 'Profile',
        ),
      ],
      bodyItems: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.blue,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: AppBar(
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 24.sp,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const CircleAvatar(
                backgroundColor: Colors.amber,
                maxRadius: 60,
              ),
            ],
          ),
        ),
      ],
      actionBarView: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.orange,
      ),
    );
  }
}
