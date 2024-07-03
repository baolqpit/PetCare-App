import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/helper/auth_helper.dart';
import 'package:petcare_app_management/screens/app.dart';
import 'package:petcare_app_management/screens/introduction_screens/otp_authentication_screen.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';
import 'package:petcare_app_management/share/format/format.dart';

class AppController extends GetxController {
  final UserController userController = Get.find();
  Rx<int> currentAppPageIndex = Rx<int>(0);
  Rx<bool> isAcceptLicense = Rx<bool>(false);
  Rx<bool> showSuffixPassWord = Rx<bool>(false);
  Rx<bool> showSuffixConfirmPassWord = Rx<bool>(false);
  Rx<bool> rememberAccount = Rx<bool>(true);

  ///GET APP BAR TITLE
  getAppBarTitle() {
    switch (currentAppPageIndex.value) {
      case 0:
        return "Home Page";
      case 1:
        return "Personal";
      case 2:
        return "Pet Store";
      default:
        break;
    }
  }

  ///CHECK THE SIGN UP FIELD IS EMPTY
  signUpFieldIsEmpty() {
    if (userController.emailController.text.isEmpty ||
        userController.confirmPasswordController.text.isEmpty ||
        userController.passwordController.text.isEmpty ||
        userController.phoneController.text.isEmpty) {
      return true;
    }
    return false;
  }

  ///CHECK SIGN IN FIELD IS EMPTY
  signInFieldIsEmpty() {
    if (userController.emailController.text.isEmpty ||
        userController.passwordController.text.isEmpty) {
      return true;
    }
    return false;
  }

  ///SIGN IN BUTTON ACTION
  signInButtonAction({required BuildContext context}) async {
    if (signInFieldIsEmpty()) {
      return showAppWarningDialog(
          context: context, content: 'Please fill in all the form!');
    } else {
      try {
        await AuthHelper().signInWithEmail(
            email: userController.emailController.text,
            password: userController.passwordController.text);
        Get.to(() => PetCareAppScreen());
      } catch (e) {
        print('Sign in error ${e}');
      }
    }
  }

  ///SIGN UP BUTTON ACTION
  signUpButtonOnPress({required BuildContext context}) async {
    // Field is empty
    if (signUpFieldIsEmpty()) {
      return showAppWarningDialog(
          context: context, content: 'Please fill in all the form!');
    } else {
      // Password does not match
      if (userController.passwordController.text !=
          userController.confirmPasswordController.text) {
        showAppWarningDialog(
            context: context,
            content:
                'The password you entered does not match, please check again!');
      } else {
        if (isAcceptLicense.value) {
          try {
            await AuthHelper().signUpWithEmail(
                email: userController.emailController.text,
                password: userController.passwordController.text,
                phoneNumber: formatPhoneToE164(
                    phoneNumber: userController.phoneController.text));
          } catch (e) {
            print("Sign Up Failed ${e}");
          }
        }
        // Check the license
        else {
          showAppWarningDialog(
              context: context, content: 'Please accept the license!');
        }
      }
    }
  }
}
