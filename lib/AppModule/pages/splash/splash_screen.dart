import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/AppModule/pages/location/enter_location_screen.dart';
import 'package:weather_app/AppModule/utils/app_colors.dart';
import 'package:weather_app/AppModule/utils/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    goToHomeScreen();
    super.initState();
  }
  void goToHomeScreen(){
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const EnterLocationScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:Lottie.asset(
            AppImages.splashAnimation,
            fit: BoxFit.cover,
            height: 150.w,
          ),
        ),
      ),
    );
  }
}