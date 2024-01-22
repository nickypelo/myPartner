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
    apiKey: 'AIzaSyAp3hpGp-12DfroUb9zpQ5nI3ns6S5mFjk',
    appId: '1:795558130091:web:ff0d7eb260ed8a1167a2ee',
    messagingSenderId: '795558130091',
    projectId: 'girlfriend-translator',
    authDomain: 'girlfriend-translator.firebaseapp.com',
    storageBucket: 'girlfriend-translator.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWUhTveEJAD8YYUFvX4TgK91fdzDzXYPs',
    appId: '1:795558130091:android:bcf5762793cfd7f767a2ee',
    messagingSenderId: '795558130091',
    projectId: 'girlfriend-translator',
    storageBucket: 'girlfriend-translator.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCn-Dd_ZFW4J6q-UdLKG-u2DCANNd7Cj6c',
    appId: '1:795558130091:ios:2abf44055e30e10767a2ee',
    messagingSenderId: '795558130091',
    projectId: 'girlfriend-translator',
    storageBucket: 'girlfriend-translator.appspot.com',
    iosBundleId: 'com.example.girlfriendTranslator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCn-Dd_ZFW4J6q-UdLKG-u2DCANNd7Cj6c',
    appId: '1:795558130091:ios:8d59952525267e3667a2ee',
    messagingSenderId: '795558130091',
    projectId: 'girlfriend-translator',
    storageBucket: 'girlfriend-translator.appspot.com',
    iosBundleId: 'com.example.girlfriendTranslator.RunnerTests',
  );
}
