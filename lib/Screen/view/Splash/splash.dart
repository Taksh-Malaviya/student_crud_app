import 'dart:async'; // Import Timer class
import 'package:flutter/material.dart';
import '../../../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the Timer here
    Timer(
      const Duration(seconds: 5),
      () {
        // Check if the widget is still in the widget tree
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          "https://media.tenor.com/lyapNc6jF3AAAAAM/h%E1%BB%8Dc-sinh-%C4%91i-h%E1%BB%8Dc.gif",
        ),
      ),
    );
  }
}
