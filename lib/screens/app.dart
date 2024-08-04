import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/main_controller.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/helper/shared_preferences_helper.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';
import 'package:petcare_app_management/share/screen_and_menu.dart';

import 'setting_screens/setting_screen.dart';

class PetCareAppScreen extends StatefulWidget {
  const PetCareAppScreen({super.key});

  @override
  State<PetCareAppScreen> createState() => _PetCareAppScreenState();
}

class _PetCareAppScreenState extends State<PetCareAppScreen> {
  final UserController userController = Get.find();
  final MainController mainController = Get.find();
  final AppController appController = Get.find();
  final NewsController newsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
      await SharedPreferencesHelper().getUserAccount();
      await userController.getUserByEmail(email: userController.emailController.text);
      mainController.initialSetUp();
      await newsController.getNews();
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildAppBodyStructure(),
      bottomNavigationBar: _buildAppBottomBar(),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.primary[300],
      leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}, color: AppColor.white,),
      title: Center(
          child: AppText(
            content: "",
            textSize: Dimens.font_size_title,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          )),
      actions: [
        IconButton(
            onPressed: () => Get.to(() => SettingScreen()),
            icon: const Icon(
              Icons.settings,
              color: AppColor.white,
            ))
      ],
    );
  }

  _buildAppBodyStructure() {
    return Obx(() => ScreenAndMenu.listCustomerScreens.
        elementAt(appController.currentAppPageIndex.value));
  }

  _buildAppBottomBar() {
    return Obx(() => BottomNavigationBar(
      items: ScreenAndMenu.listCustomerIcons,
      unselectedLabelStyle: const TextStyle(fontSize: Dimens.font_size_min),
      showUnselectedLabels: true,
      unselectedItemColor: AppColor.black,
      selectedItemColor: AppColor.primary,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: Dimens.font_size_min),
      currentIndex: appController.currentAppPageIndex.value,
      onTap: (index) {
        appController.currentAppPageIndex.value = index;
      },
    ));
  }

  Future<void> fetchData() async {
    await SharedPreferencesHelper().getUserAccount();
    await userController.getUserByEmail(email: userController.emailController.text);
  }
}
