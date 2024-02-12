import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:jasa_bantu/Settings/constant.dart';


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

Constant constant = Constant();

class DefaultFirebaseOptions {

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
/*      case TargetPlatform.iOS:
        return ios;*/
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

  static  FirebaseOptions android = FirebaseOptions(
    apiKey: constant.apiKey,
    appId: constant.appId,
    messagingSenderId: constant.messagingSenderId,
    projectId:  constant.projectId,
    storageBucket: constant.storageBucket,
  );

/*  static  FirebaseOptions ios = FirebaseOptions(
    apiKey: constant.apiKeyIOS,
    appId:  constant.appIdIOS,
    messagingSenderId: constant.messagingSenderIdIOS,
    projectId:  constant.projectIdIOS,
    storageBucket: constant.storageBucketIOS,
    androidClientId: constant.androidClientId,
    iosClientId:  constant.iosClientId,
    iosBundleId: constantiosBundleId,
  );*/
}
