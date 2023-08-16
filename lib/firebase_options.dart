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
    apiKey: 'AIzaSyC4-79s7hETQiLHmYNqElPur3k1bf4dnZk',
    appId: '1:1015657897666:web:da54acd2e5be3dd07ba55b',
    messagingSenderId: '1015657897666',
    projectId: 'ez-learn-22',
    authDomain: 'ez-learn-22.firebaseapp.com',
    storageBucket: 'ez-learn-22.appspot.com',
    measurementId: 'G-MS974QX99E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyk5vMBTQ5D4xCJC48vHgekJMVYVLx61c',
    appId: '1:1015657897666:android:07451e99b971d9a57ba55b',
    messagingSenderId: '1015657897666',
    projectId: 'ez-learn-22',
    storageBucket: 'ez-learn-22.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiIKGglunnVdANyBE8GGvbdRZHeIOcS-k',
    appId: '1:1015657897666:ios:4928470bfd2788527ba55b',
    messagingSenderId: '1015657897666',
    projectId: 'ez-learn-22',
    storageBucket: 'ez-learn-22.appspot.com',
    iosClientId: '1015657897666-ros1bjni5q1sbrl8ss1b1hluqm4s5gv4.apps.googleusercontent.com',
    iosBundleId: 'com.example.ezLearn',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiIKGglunnVdANyBE8GGvbdRZHeIOcS-k',
    appId: '1:1015657897666:ios:4928470bfd2788527ba55b',
    messagingSenderId: '1015657897666',
    projectId: 'ez-learn-22',
    storageBucket: 'ez-learn-22.appspot.com',
    iosClientId: '1015657897666-ros1bjni5q1sbrl8ss1b1hluqm4s5gv4.apps.googleusercontent.com',
    iosBundleId: 'com.example.ezLearn',
  );
}
