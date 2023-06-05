import 'package:enlabtest/view/congrat_page.dart';
import 'package:enlabtest/view/quiz_page.dart';
import 'package:enlabtest/view/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen());
  }
}
