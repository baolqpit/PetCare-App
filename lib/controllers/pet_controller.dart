import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/api/app_api/pet_api.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/pet_model/pet_model.dart';

class PetController extends GetxController {
  final AppController appController = Get.find();
  final UserController userController = Get.find();
  RxList<PetModel?> listPets = RxList<PetModel?>([]);
  Rx<int> petCurrentCarousel = Rx<int>(1);

  ///GET LIST PETS
  getListPets({required int userId}) async {
    appController.isLoading.value = true;
    var res = await PetApi().getUserPet(userId: userId);
    listPets.value = res.map<PetModel>((json) => PetModel.fromJson(json)).toList();
    appController.isLoading.value = false;
  }

  ///CREATE NEW PET
  createNewPet({required PetModel petModel}) async {
    appController.isLoading.value = true;
    Map<String, dynamic> data = {
      "petName": petModel.petName,
      "petBirthday": petModel.petBirthday,
      "userId": userController.userInfo.value!.userId,
      "petTypeId": petModel.petTypeId,
      "petTypeName": petModel.petTypeName,
      "petAge": petModel.petAge,
      "petImgURL": petModel.petImgURL,
    };
    print(data);
    await PetApi().createUserPet(data: data);
    appController.isLoading.value = false;

  }
}