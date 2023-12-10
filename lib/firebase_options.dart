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
    apiKey: 'AIzaSyAx_TXgwl36rM0OpHt5dy6RbQWi0NOn9ss',
    appId: '1:84919031227:web:c16de3e4691249325f209e',
    messagingSenderId: '84919031227',
    projectId: 'reddit-clone-7d1a1',
    authDomain: 'reddit-clone-7d1a1.firebaseapp.com',
    storageBucket: 'reddit-clone-7d1a1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAt-MWUIaMxe5TlBBQnZcKx9uDlwlFiVjs',
    appId: '1:84919031227:android:e244379be12e4e875f209e',
    messagingSenderId: '84919031227',
    projectId: 'reddit-clone-7d1a1',
    storageBucket: 'reddit-clone-7d1a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUlFSuDHkvTynP8lHf6WenOOA83Z_IoMA',
    appId: '1:84919031227:ios:96b8031b614f38345f209e',
    messagingSenderId: '84919031227',
    projectId: 'reddit-clone-7d1a1',
    storageBucket: 'reddit-clone-7d1a1.appspot.com',
    iosBundleId: 'com.example.flutterRedditClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUlFSuDHkvTynP8lHf6WenOOA83Z_IoMA',
    appId: '1:84919031227:ios:8fd8f3a425c561e45f209e',
    messagingSenderId: '84919031227',
    projectId: 'reddit-clone-7d1a1',
    storageBucket: 'reddit-clone-7d1a1.appspot.com',
    iosBundleId: 'com.example.flutterRedditClone.RunnerTests',
  );
}
