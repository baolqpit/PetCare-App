import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/helper/auth_helper.dart';
import 'package:petcare_app_management/main.dart';
import 'package:petcare_app_management/screens/introduction_screens/introduction_screen.dart';
import 'package:petcare_app_management/screens/introduction_screens/sign_in_screen.dart';
import 'package:petcare_app_management/screens/introduction_screens/sign_up_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
final AppController appController = Get.find();
final UserController userController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    print(AuthHelper().firebaseAuth.currentUser!.email);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSettingContent(),
      appBar: CustomAppBar(title: "Setting", showReturnButton: true,),
    );
  }

  _buildSettingContent(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_horizontal, vertical: Dimens.padding_vertical),
      child: Column(
        children: <Widget>[
          _buildSettingRow(text: 'Policy', imgesURL: Images.policy_svg),
          Dimens.height15,
          _buildSettingRow(text: 'Language', imgesURL: Images.language_change_svg),
          Dimens.height15,
          _buildSettingRow(text: 'Sign Out', imgesURL: Images.language_change_svg, onTapFunction: () async {
            await AuthHelper().signOut();
            appController.currentAppPageIndex.value = 0;
            userController.emailController.clear();
            userController.passwordController.clear();
            Get.offAll(() => IntroductionScreen());
          }),
        ],
      ),
    );
  }

  _buildSettingRow({required String text, required String imgesURL, Function()? onTapFunction}){
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_horizontal, vertical: Dimens.padding_vertical),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColor.darkCyanGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(Dimens.circular10),
        border: Border.fromBorderSide(BorderSide(color: AppColor.black))
      ),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(imgesURL, width: 30, height: 30,),
            Dimens.width10,
            AppText(content: text, color: AppColor.white, fontWeight: FontWeight.bold,)
        ],
        ),
      ),
    );
  }
}
