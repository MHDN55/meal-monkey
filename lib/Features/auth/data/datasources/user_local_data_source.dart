import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<Unit> cachingUserLogedIn(bool chached);
  Future<bool> getCachedLogedIn();
}

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<Unit> cachingUserLogedIn(bool chached) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('repeat', chached);
    return Future.value(unit);
  }

  @override
  Future<bool> getCachedLogedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? inOrNot = prefs.getBool("repeat");
    return inOrNot ?? false;
  }
}
