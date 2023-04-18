import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/screens/main_screen/app_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(milliseconds: 500),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'Assets/plate.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
