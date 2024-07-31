import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';

import '../controllers/app_controller.dart';
import '../controllers/user_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    print('Initial Controller');
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<NewsController>(() => NewsController());
    Get.lazyPut<PetStoreController>(() => PetStoreController());
    // TODO: implement dependencies
  }

}