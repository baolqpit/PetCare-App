import 'package:get/get.dart';


class AppController extends GetxController {
  Rx<int> currentAppPageIndex = Rx<int>(0);

  getAppBarTitle(){
    switch(currentAppPageIndex.value){
      case 0:
        return "Home Page";
      case 1: return "Personal";
      case 2: return "Pet Store";
      default: break;
    }
  }
}