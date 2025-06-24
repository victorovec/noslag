import 'package:flutter/material.dart';
import 'dart:async';
//import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:noslag/core/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 void startTimer() {
    Timer(const Duration(seconds: 3), () async {
      Get.toNamed(RoutesConstant.onboarding);
    });
  }

 @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash.png'),
          fit: BoxFit.cover, 
        ),
      ),
    ),
    );
  }
}