//import 'package:cognizone/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:cognizone/landingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // ✅ FIXED
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const LandingPage(),
    );
  }
}
