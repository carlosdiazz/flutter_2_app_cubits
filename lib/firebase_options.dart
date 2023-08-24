// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAgsMCbXsB2rAoBSDxX8rFPrdermXjuab4',
    appId: '1:253539472853:web:e53022937d87181ab1595c',
    messagingSenderId: '253539472853',
    projectId: 'flutter-notificaciones-ad729',
    authDomain: 'flutter-notificaciones-ad729.firebaseapp.com',
    storageBucket: 'flutter-notificaciones-ad729.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdi7Fp073MB_f2EPZHra05uAazZnwBpBg',
    appId: '1:253539472853:android:e924af176ffeffb4b1595c',
    messagingSenderId: '253539472853',
    projectId: 'flutter-notificaciones-ad729',
    storageBucket: 'flutter-notificaciones-ad729.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpqdD7Nd-sVO6xwc6PzrzOubB1ZY6EFf8',
    appId: '1:253539472853:ios:65bf47d522755950b1595c',
    messagingSenderId: '253539472853',
    projectId: 'flutter-notificaciones-ad729',
    storageBucket: 'flutter-notificaciones-ad729.appspot.com',
    iosClientId: '253539472853-b54gpiggt5u1glcj890ca8kbv80088hn.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutter2FormsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpqdD7Nd-sVO6xwc6PzrzOubB1ZY6EFf8',
    appId: '1:253539472853:ios:30025f7f3d135163b1595c',
    messagingSenderId: '253539472853',
    projectId: 'flutter-notificaciones-ad729',
    storageBucket: 'flutter-notificaciones-ad729.appspot.com',
    iosClientId: '253539472853-kuk4rpadcgq8eqhsscdk9rogs749sbri.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutter2FormsApp.RunnerTests',
  );
}
