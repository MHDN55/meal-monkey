import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDataSource {
  Future<Unit> cachingOnboarding(bool chached);
  Future<bool> getCachedOnboarding();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  @override
  Future<Unit> cachingOnboarding(bool chached) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('repeato', chached);

    return Future.value(unit);
  }

  @override
  Future<bool> getCachedOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final bool? isOnboarding = prefs.getBool("repeato");

    return isOnboarding ?? false;
  }
}
