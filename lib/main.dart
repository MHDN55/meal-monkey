// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_monkey/firebase_options.dart';
import 'core/routes/app_route_config.dart';
import 'injection_injectable_package.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      },
    );

    // mySubscribeToTopicFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        // theme: ThemeData(
        //   colorScheme: ColorScheme.dark(
        //     background: Colors.grey.shade900,
        //     primary: Colors.grey.shade600,
        //     secondary: const Color.fromARGB(255, 50, 50, 50),
        //     inversePrimary: Colors.grey.shade300,
        //     tertiary: Colors.black,
        //     tertiaryContainer: Colors.grey.shade800,
        //   ),
        // ),
        routerConfig: MyAppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
