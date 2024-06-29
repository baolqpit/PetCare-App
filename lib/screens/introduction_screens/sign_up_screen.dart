import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final UserController userController = Get.find();
  final AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildSignUpContent(),
    );
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
      ),
      title: Center(
        child: Apptext(
          content: 'Return to sign in',
        ),
      ),
    );
  }

  _buildSignUpContent() {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(
              vertical: Dimens.padding_vertical,
              horizontal: Dimens.padding_horizontal),
          child: Column(
            children: <Widget>[
              _buildTextFieldInfo(
                  label: 'Email',
                  hintText: 'email@gmail.com',
                  controller: userController.emailController,
                  showSuffix: false),
              Dimens.height15,
              _buildTextFieldInfo(
                  label: 'Password',
                  hintText: 'Enter New Password',
                  controller: userController.emailController,
                  showSuffix: true,
                  suffixController: appController.showSuffixPassWord),
              Dimens.height15,
              _buildTextFieldInfo(
                  label: 'Confirm password',
                  hintText: 'Enter confirm password',
                  controller: userController.emailController,
                  showSuffix: true,
                  suffixController:
                      appController.showSuffixConfirmPassWord),
              Dimens.height15,
              _buildAcceptLicense(),
              Dimens.height20,
              _buildSignUpButton()
            ],
          ),
        ));
  }

  _buildTextFieldInfo(
      {required String label,
      required String hintText,
      required TextEditingController controller,
      required bool showSuffix,
      Rx<bool>? suffixController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Apptext(
          content: label,
          fontWeight: FontWeight.bold,
        ),
        Dimens.height5,
        TextField(
          onChanged: (value) {
            controller.text = value;
          },
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: showSuffix
                ? IconButton(
                    onPressed: () {
                      if (suffixController != null) {
                        suffixController.value = !suffixController.value;
                      }
                    },
                    icon: suffixController!.value ?  Icon(Icons.visibility,) : Icon(Icons.visibility_off,color: AppColor.grey))
                : null,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0), // Adjust the radius as needed
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildAcceptLicense() {
    return Row(
      children: <Widget>[
        Checkbox(
            value: appController.isAcceptLicense.value,
            onChanged: (value) {
              if (value != null) {
                appController.isAcceptLicense.value = value;
              }
            }),
        Apptext(content: 'I Agree With The Terms And The Conditions')
      ],
    );
  }

  _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Apptext(
        content: 'Sign Up',
        fontWeight: FontWeight.bold,
        textSize: Dimens.font_size_max,
        color: AppColor.white,
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          padding: EdgeInsets.all(Dimens.padding_20)),
    );
  }
}
