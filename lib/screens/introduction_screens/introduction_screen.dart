import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/screens/introduction_screens/auth_screens/sign_in_screen.dart';
import 'package:petcare_app_management/screens/introduction_screens/auth_screens/sign_up_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAuthenticationSelectionScreen(),
    );
  }

  _buildAuthenticationSelectionScreen() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.padding_horizontal,
          vertical: Dimens.padding_vertical),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildActionButton(
              title: 'Sign In', functionOnPress: () => Get.to(() => SignIn())),
          _buildActionButton(
              title: 'Sign Up',
              functionOnPress: () => Get.to(() => SignUpScreen()))
        ],
      ),
    );
  }

  _buildActionButton(
      {required String title, required Function()? functionOnPress}) {
    return ElevatedButton(
        onPressed: functionOnPress,
        child: AppText(
          content: title,
          color: AppColor.white,
          fontWeight: FontWeight.bold,
        ),
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary));
  }
}
