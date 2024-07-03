import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../controllers/user_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    print('Initial Controller');
    Get.put(() => AppController());
    Get.put(() => UserController());
    // TODO: implement dependencies
  }

}