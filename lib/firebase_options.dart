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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAIjcabG-GhLxf1Re89q2hGEe1nBcgp4o8',
    appId: '1:562031133904:web:18f4f4a96a375ca5830ad5',
    messagingSenderId: '562031133904',
    projectId: 'beta-health-53f7f',
    authDomain: 'beta-health-53f7f.firebaseapp.com',
    storageBucket: 'beta-health-53f7f.appspot.com',
    measurementId: 'G-J8LZD0BGVB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQCWhrc3vG9RW0MQFDmaZL9M8Ww2nCQ0w',
    appId: '1:562031133904:android:f454f9fb3b29c249830ad5',
    messagingSenderId: '562031133904',
    projectId: 'beta-health-53f7f',
    storageBucket: 'beta-health-53f7f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQyDYxoc1QEPF_49zShQ7CcR6tdT9thLc',
    appId: '1:562031133904:ios:7ea283ccbda1090e830ad5',
    messagingSenderId: '562031133904',
    projectId: 'beta-health-53f7f',
    storageBucket: 'beta-health-53f7f.appspot.com',
    iosClientId: '562031133904-vimc7ptlnncto002p3rm15qj4nfdhcgt.apps.googleusercontent.com',
    iosBundleId: 'dev.kiishidart.betahealth',
  );
}
