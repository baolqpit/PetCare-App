import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/helper/auth_helper.dart';
import 'package:petcare_app_management/screens/app.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final UserController userController = Get.find();
  final AppController appController = Get.find();

  @override
  void dispose() {
    // TODO: implement dispose
    userController.emailController.clear();
    userController.passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: _buildAppBar(),
          body: SingleChildScrollView(
            child: Container(
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
                      hintText: 'Enter Password',
                      controller: userController.passwordController,
                      showSuffix: true,
                      suffixController:
                          appController.showSuffixPassWord),
                  Dimens.height5,
                  _buildRememberLogin(),
                  Dimens.height15,
                  _buildSignInButton()
                ],
              ),
            ),
          ),
        ));
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
      ),
      title: AppText(
        content: 'Return',
      ),
    );
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
        AppText(
          content: label,
          fontWeight: FontWeight.bold,
        ),
        Dimens.height5,
        TextField(
          obscureText:
              suffixController != null ? !suffixController.value : false,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: showSuffix
                ? IconButton(
                    onPressed: () {
                      if (suffixController != null) {
                        suffixController.value = !suffixController.value;
                      }
                    },
                    icon: suffixController!.value
                        ? Icon(
                            Icons.visibility,
                          )
                        : Icon(Icons.visibility_off, color: AppColor.grey))
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

  _buildRememberLogin() {
    return Row(
      children: <Widget>[
        Checkbox(
            value: appController.rememberAccount.value,
            onChanged: (value) => appController.rememberAccount.value = value!),
        AppText(content: 'Remember my account')
      ],
    );
  }

  _buildSignInButton() {
    return ElevatedButton(
      onPressed: () async {
        await appController.signInButtonAction(context: context);
      },
      child: AppText(
        content: 'Sign In',
        textSize: Dimens.font_size_title,
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      ),
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.orange),
    );
  }
}
