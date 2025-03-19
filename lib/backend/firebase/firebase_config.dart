import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDSSfr_geKCaOyHCEulLzK8bDumdfoBI20",
            authDomain: "routine305.firebaseapp.com",
            projectId: "routine305",
            storageBucket: "routine305.firebasestorage.app",
            messagingSenderId: "81329824072",
            appId: "1:81329824072:web:3fd965f37f83b5e560537d",
            measurementId: "G-YM4KH1EBYZ"));
  } else {
    await Firebase.initializeApp();
  }
}
