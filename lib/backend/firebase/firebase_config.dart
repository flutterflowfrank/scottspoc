import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBofylhA-aNmT6zD1ykWoLAoDYzOJIQMoo",
            authDomain: "scottspoc.firebaseapp.com",
            projectId: "scottspoc",
            storageBucket: "scottspoc.appspot.com",
            messagingSenderId: "176115559488",
            appId: "1:176115559488:web:94d502887752519ebfc3a5",
            measurementId: "G-F8ZJRJ94J4"));
  } else {
    await Firebase.initializeApp();
  }
}
