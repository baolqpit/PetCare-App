import 'package:petcare_app_management/api/base_api/base_api.dart';

class PetApi extends BaseApi {
  PetApi() : super();
  final GET_USER_PET = 'Pet/GetUserPets';
  final CREATE_USER_PET = 'Pet/CreateUserPet';
  
  ///GET USER PET
  getUserPet({required int userId}){
    var param = {
      'userId': userId
    };
    return BaseApi().getPetCareAppDataFromAPI(url: GET_USER_PET, queryParameters: param);
  }
  
  ///CREATE USER PET
  createUserPet({required Map<String, dynamic> data}){
    return BaseApi().postPetCareAppDataFromAPI(url: CREATE_USER_PET, data: data);
  }
}

