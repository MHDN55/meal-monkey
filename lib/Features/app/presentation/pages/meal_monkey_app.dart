import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/app_route_config.dart';

class MealMonkey extends StatefulWidget {
  const MealMonkey({super.key});

  @override
  State<MealMonkey> createState() => _MealMonkeyState();
}

class _MealMonkeyState extends State<MealMonkey> {
  @override
  void initState() {
    listenerAuth;

    super.initState();
  }

  StreamSubscription<User?> listenerAuth() {
    return FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MealMonkeyRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
