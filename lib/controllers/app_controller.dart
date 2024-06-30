import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class AppController extends GetxController {
  final UserController userController = Get.find();
  Rx<int> currentAppPageIndex = Rx<int>(0);
  Rx<bool> isAcceptLicense = Rx<bool>(false);
  Rx<bool> showSuffixPassWord = Rx<bool>(false);
  Rx<bool> showSuffixConfirmPassWord = Rx<bool>(false);

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
        userController.passwordController.text.isEmpty) {
      return true;
    }
    return false;
  }

  ///SIGN UP BUTTON ACTION
  signUpButtonOnPress({required BuildContext context}) {
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
