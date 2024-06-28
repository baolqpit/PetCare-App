import 'dart:convert';

import 'package:get/get.dart';
import 'package:petcare_app_management/api/base_api.dart';
import 'package:petcare_app_management/api/user_api.dart';
import 'package:petcare_app_management/model/user_model.dart';

class UserController extends GetxController {
  RxList<UserModel?> listUsers = RxList<UserModel?>([]);
  Rx<UserModel?> userInfo = Rx<UserModel?>(null);


  ///GET USER LIST
  getListUsers() async {
    var response = await UserApi().getListUser();
    listUsers.value = response.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }

  getUserById({required int userId}) async {
    var response = await UserApi().getUserById(userId: userId);
    userInfo.value = UserModel.fromJson(response);
    print(userInfo.toString());
  }


}