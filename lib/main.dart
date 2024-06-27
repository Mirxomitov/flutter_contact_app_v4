import 'package:contacts_bloc/data/source/local/pref_helper.dart';
import 'package:contacts_bloc/presentation/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Contacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffe72e2e),
          primary: const Color(0xffe72e2e),
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: _textTheme,
      ),
      home: const SplashScreen(),
    );
  }
}

const _textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold, color: Colors.black),
  displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black),
  displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
  headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
  headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
  headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
  titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
  titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
  bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
  bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
  labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
  labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
  labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.black),
);
