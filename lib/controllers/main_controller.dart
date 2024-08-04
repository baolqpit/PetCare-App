import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/share/screen_and_menu.dart';

class MainController extends GetxController {
  final UserController userController = Get.find();
  List<BottomNavigationBarItem>? menus;
  List<Widget>? screens;


  ///INITIAL SET UP
  initialSetUp(){
    //Customer
    if (userController.userInfo.value!.userRoleId == 1){
      screens = ScreenAndMenu.listCustomerScreens;
    }
    //Admin
    if (userController.userInfo.value!.userRoleId == 0){
      screens = ScreenAndMenu.listAdminScreens;
    }
    //Shop
    if (userController.userInfo.value!.userRoleId == 2){
      screens = ScreenAndMenu.listShopScreens;
    }
  }
}