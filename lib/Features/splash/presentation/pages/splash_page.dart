import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/core/app_images/app_images.dart';

import '../../../../core/routes/app_route_const.dart';
import '../../../../injection_injectable_package.dart';
import '../blocs/splash/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    getIt<SplashBloc>().add(GetCachedSplashEvent());
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        bloc: getIt<SplashBloc>(),
        listener: (context, state) {
          if (state.status == SplashStatus.loaded) {
            if (!state.isOnboarding) {
              context.pushReplacementNamed(MyAppRouteConst.onboardingPage);
            } else {
              if (!state.isAuth) {
                context
                    .pushReplacementNamed(MyAppRouteConst.afterOnboardingPage);
              } else {
                context.pushReplacementNamed(MyAppRouteConst.homePage);
              }
            }
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              Assets.assetsImagesSplashBackground,
              fit: BoxFit.cover,
              width: 360.w,
              height: 690.h,
            ),
            SvgPicture.asset(
              Assets.assetsImagesLogo,
              width: 180.w,
              height: 180.h,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
