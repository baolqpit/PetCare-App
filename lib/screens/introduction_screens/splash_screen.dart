import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/screens/app.dart';
import 'package:petcare_app_management/screens/introduction_screens/introduction_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Images/images.dart';

class SplashScreen extends StatelessWidget {
  final AsyncSnapshot<User?> snapshot;
  const SplashScreen({super.key, required this.snapshot});

  get splash => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash: Column(
      children: [
        Expanded(
          child: Center(
            child: LottieBuilder.asset(Images.app_lottie,),
          ),
        )
      ],

    ), nextScreen: snapshot.hasData ? PetCareAppScreen() : IntroductionScreen(), splashIconSize: 400,backgroundColor: AppColor.primary,);
  }
}
