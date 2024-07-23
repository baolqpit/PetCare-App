import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/api/base_api/base_api.dart';
import 'package:petcare_app_management/api/app_api/user_api.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/model/user_detail_model/user_detail_model.dart';

class UserController extends GetxController {
  final AppController appController = Get.find();
  Rx<UserDetailModel?> userInfo = Rx<UserDetailModel?>(null);
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // CREATE NEW USER
  createNewUser() async {
    appController.isLoading.value = true;
    var data = {
      "userAccount": {
        "email": emailController.text,
        "password": passwordController.text
      },
      "userDetail": {
        "phone": phoneController.text,
        "email": emailController.text,
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "city": cityController.text
      }
    };
    var response = await UserApi().createNewUser(data: data);
    appController.isLoading.value = false;
    return response;
  }

  // GET USER DETAIL BY EMAIL
  getUserByEmail({required String email}) async {
    appController.isLoading.value = true;
    var response = await UserApi().getUserByEmail(email: email);
    userInfo.value = UserDetailModel.fromJson(response);
    appController.isLoading.value = false;
  }
}
