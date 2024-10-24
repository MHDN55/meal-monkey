import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_injectable_package.config.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @lazySingleton
  InternetConnection get internetConnection => InternetConnection();

  @lazySingleton
  FirebaseAuth get prefs1 => FirebaseAuth.instance;

  @lazySingleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
  @lazySingleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
}

@InjectableInit(
  initializerName: r'$init',
  preferRelativeImports: true,
  asExtension: false,
)

Future<void> configureDependencies() async => $init(getIt);
