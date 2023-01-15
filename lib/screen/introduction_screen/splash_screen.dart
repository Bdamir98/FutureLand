import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_land/screen/introduction_screen/introduction.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Introduction())));
  }

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            'assets/Future Land.png',
            height: 300,
            width: 300,
          ),
        ));
  }
}
