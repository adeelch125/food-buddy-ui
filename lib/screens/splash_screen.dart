import 'package:flutter/material.dart';
import 'package:food_buddy/assets/asset_paths.dart';
import 'package:food_buddy/screens/next_screen.dart';

import 'home_screen.dart'; // Replace with your next screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  HomeScreen()), // Replace with your next screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPaths.imgBackground),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
