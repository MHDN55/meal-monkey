// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meal_monkey/firebase_options.dart';
import 'Features/app/presentation/pages/meal_monkey_app.dart';
import 'injection_injectable_package.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MealMonkey());
}
