import 'package:petcare_app_management/api/base_api.dart';

class UserApi extends BaseApi{
  UserApi() : super();

  final GET_LIST_USER = 'UserEntities/GetListUsers';
  final GET_USER_BY_ID = 'UserEntities/GetUserById/';


  ///GET LIST USERS
  getListUser(){
    return BaseApi().getPetCareAppDataFromAPI(url: GET_LIST_USER);
  }

  ///GET USER BY ID
  getUserById({required int userId}){
    var param = {
      'userId': userId
    };
    return BaseApi().getPetCareAppDataFromAPI(url: GET_USER_BY_ID, queryParameters: param);
  }
}