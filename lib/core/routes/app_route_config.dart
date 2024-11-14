import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_monkey/Features/auth/presentation/pages/forgot_password_page.dart';
import 'package:meal_monkey/Features/onboarding/presentation/pages/after_onboarding_page.dart';
import '../../Features/auth/presentation/pages/login_page.dart';
import '../../Features/auth/presentation/pages/signup_page.dart';
import '../../Features/home/presentation/pages/home_page.dart';
import '../../Features/onboarding/presentation/pages/onboarding_page.dart';
import '../../Features/splash/presentation/pages/splash_page.dart';
import '../../injection_injectable_package.dart';
import 'app_route_const.dart';

class MealMonkeyRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: MyAppRouteConst.splashPage,
        path: '/',
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.homePage,
        path: '/home_page',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.onboardingPage,
        path: '/on_boarding_page',
        builder: (context, state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.afterOnboardingPage,
        path: '/after_onboarding_page',
        builder: (context, state) {
          return const AfterOnboardingPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.loginPage,
        path: '/login_page',
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.signupPage,
        path: '/signup_page',
        builder: (context, state) {
          return const SignupPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.forgotPasswordPage,
        path: '/forgot_password_page',
        builder: (context, state) {
          return const ForgotPasswordPage();
        },
      ),
    ],
  );
}
