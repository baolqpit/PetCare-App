import 'dart:convert';

import 'package:petcare_app_management/api/base_api/base_api.dart';
import 'package:petcare_app_management/model/user_account_model/user_account_model.dart';
import 'package:petcare_app_management/model/user_detail_model/user_detail_model.dart';

class UserApi extends BaseApi{
  UserApi() : super();
  final GET_USER_BY_EMAIL = 'User/GetUserDetailByEmail';

  final CREATE_NEW_USER = 'User/CreateUser';
  
  ///CREATE NEW USER
  createNewUser({required Map<String, dynamic> data}){
    return BaseApi().postPetCareAppDataFromAPI(url: CREATE_NEW_USER, data: data);
  }

  ///GET USER BY ID
  getUserByEmail({required String email}){
    var param = {
      'email': email
    };
    return BaseApi().getPetCareAppDataFromAPI(url: GET_USER_BY_EMAIL, queryParameters: param);
  }
}