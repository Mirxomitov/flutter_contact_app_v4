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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgpb8jDKAqsjneOO9OAnMaIRNzvRC_omk',
    appId: '1:1001110228870:android:5cd2bbea899a4401cca607',
    messagingSenderId: '1001110228870',
    projectId: 'flutter-contacts-demo',
    databaseURL: 'https://flutter-contacts-demo-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-contacts-demo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaJ1eX9Ozq4ZLGWFp8S0r7bG8io3pn5WY',
    appId: '1:1001110228870:ios:3b9b7d2cd152243fcca607',
    messagingSenderId: '1001110228870',
    projectId: 'flutter-contacts-demo',
    databaseURL: 'https://flutter-contacts-demo-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-contacts-demo.appspot.com',
    iosBundleId: 'com.example.contactsBloc',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCFA0mKN5S7Wfai6j5lBGpt51VJGJM2kW0',
    appId: '1:1001110228870:web:bd88655799c1482dcca607',
    messagingSenderId: '1001110228870',
    projectId: 'flutter-contacts-demo',
    authDomain: 'flutter-contacts-demo.firebaseapp.com',
    databaseURL: 'https://flutter-contacts-demo-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-contacts-demo.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBaJ1eX9Ozq4ZLGWFp8S0r7bG8io3pn5WY',
    appId: '1:1001110228870:ios:3b9b7d2cd152243fcca607',
    messagingSenderId: '1001110228870',
    projectId: 'flutter-contacts-demo',
    databaseURL: 'https://flutter-contacts-demo-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-contacts-demo.appspot.com',
    iosBundleId: 'com.example.contactsBloc',
  );

}