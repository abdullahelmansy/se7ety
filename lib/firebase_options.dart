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
    apiKey: 'AIzaSyAGyvN4nmaTqD7Q-EQESVRBunMxcsFIkqo',
    appId: '1:470252814417:web:4b622d6db6e9075e41b870',
    messagingSenderId: '470252814417',
    projectId: 'se7tey-8a680',
    authDomain: 'se7tey-8a680.firebaseapp.com',
    storageBucket: 'se7tey-8a680.appspot.com',
    measurementId: 'G-GXWC7DEK9T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDksDdouIZaOjSPHyJgooCTMnY4GOc6eVc',
    appId: '1:470252814417:android:08d20c65b9b78c1141b870',
    messagingSenderId: '470252814417',
    projectId: 'se7tey-8a680',
    storageBucket: 'se7tey-8a680.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEPRyzWzsI6L-iNPkMwurADQYJBEJTJmw',
    appId: '1:470252814417:ios:ee6479e437bbf8ec41b870',
    messagingSenderId: '470252814417',
    projectId: 'se7tey-8a680',
    storageBucket: 'se7tey-8a680.appspot.com',
    iosBundleId: 'com.example.se7ety',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEPRyzWzsI6L-iNPkMwurADQYJBEJTJmw',
    appId: '1:470252814417:ios:ee6479e437bbf8ec41b870',
    messagingSenderId: '470252814417',
    projectId: 'se7tey-8a680',
    storageBucket: 'se7tey-8a680.appspot.com',
    iosBundleId: 'com.example.se7ety',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAGyvN4nmaTqD7Q-EQESVRBunMxcsFIkqo',
    appId: '1:470252814417:web:342bd9ef03e8f47b41b870',
    messagingSenderId: '470252814417',
    projectId: 'se7tey-8a680',
    authDomain: 'se7tey-8a680.firebaseapp.com',
    storageBucket: 'se7tey-8a680.appspot.com',
    measurementId: 'G-HYNL4BQ0N5',
  );
}