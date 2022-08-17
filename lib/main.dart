import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'aqsaha.dart';
import 'src/theme/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCcQrikx7KyDNHkjshBwj7fOInndW0EMvY",
        appId: "1:27377405376:web:ba3ffb89d219b4b9430c25",
        messagingSenderId: "27377405376",
        projectId: "aqsahaapp",
        storageBucket: "aqsahaapp.appspot.com",
        measurementId: "G-XE8QRKH365",
        authDomain: "aqsahaapp.firebaseapp.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(Aqsaha(showHome: showHome, aqsahaTheme: AqsahaTheme(),));
}


