// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDHBWKgtaEYKNjHfG3KQahllPkeGKKoozc',
    appId: '1:707147582809:web:45dc2d4c3d469852271048',
    messagingSenderId: '707147582809',
    projectId: 'meal-monkey-3f0f8',
    authDomain: 'meal-monkey-3f0f8.firebaseapp.com',
    storageBucket: 'meal-monkey-3f0f8.appspot.com',
    measurementId: 'G-TX24PFN8R9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAi-rVFkOg4lFO-P-jXeO6I6AYPWBrInVM',
    appId: '1:707147582809:android:0d953e5ebf7995eb271048',
    messagingSenderId: '707147582809',
    projectId: 'meal-monkey-3f0f8',
    storageBucket: 'meal-monkey-3f0f8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdwZBg2DC34a_mU2eszveVGDXmQjRny9M',
    appId: '1:707147582809:ios:62f1997fbe267e29271048',
    messagingSenderId: '707147582809',
    projectId: 'meal-monkey-3f0f8',
    storageBucket: 'meal-monkey-3f0f8.appspot.com',
    iosBundleId: 'com.example.mealMonkey',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdwZBg2DC34a_mU2eszveVGDXmQjRny9M',
    appId: '1:707147582809:ios:62f1997fbe267e29271048',
    messagingSenderId: '707147582809',
    projectId: 'meal-monkey-3f0f8',
    storageBucket: 'meal-monkey-3f0f8.appspot.com',
    iosBundleId: 'com.example.mealMonkey',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDHBWKgtaEYKNjHfG3KQahllPkeGKKoozc',
    appId: '1:707147582809:web:e509c7357577690b271048',
    messagingSenderId: '707147582809',
    projectId: 'meal-monkey-3f0f8',
    authDomain: 'meal-monkey-3f0f8.firebaseapp.com',
    storageBucket: 'meal-monkey-3f0f8.appspot.com',
    measurementId: 'G-0TBZZM79GY',
  );
}
