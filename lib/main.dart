import 'package:flutter/material.dart';
import 'package:startup_ninja/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Ninja',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,  // Enables Material3
      ),
      home: SplashScreen(),  // Start with SplashScreen
    );
  }
}