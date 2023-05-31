
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grab_meals/constants/colors.dart';
import 'package:grab_meals/screens/landing_screen.dart';
import 'package:grab_meals/screens/login.dart';
import 'package:grab_meals/screens/onboarding_screens.dart';
import 'package:grab_meals/utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late Timer timer;

  @override
  void initState() {
    timer = Timer(const Duration(milliseconds: 5000), () {
      Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColors.mainColor,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                Helper.getImageAssetName("photo.png")
              ),
            )
          ],
        ),
      ),
    );
  }
}
