import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/screen_and_menu.dart';

import 'share/Dimens/dimens.dart';

void main() {
  runApp(const PetCare());
}

class PetCare extends StatefulWidget {
  const PetCare({super.key});

  @override
  State<PetCare> createState() => _PetCareState();
}

class _PetCareState extends State<PetCare> {
  final AppController appController = Get.put(AppController());
  final UserController userController = Get.put(UserController());


  @override
  void initState() {
    // TODO: implement initState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Raleway'),
      ),
      home: Scaffold(
        appBar: _buildAppBar(),
        body: _buildAppBodyStructure(),
        bottomNavigationBar: _buildAppBottomBar(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.primary[300],
      leading: IconButton(icon: Icon(Icons.menu), onPressed: (){}, color: AppColor.white,),
      title: Center(
          child: Apptext(
        content: "",
        textSize: Dimens.font_size_title,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: AppColor.white,
            ))
      ],
    );
  }

  _buildAppBodyStructure() {
    return Obx(() => ScreenAndMenu.listCustomerScreens
        .elementAt(appController.currentAppPageIndex.value));
  }

  _buildAppBottomBar() {
    return Obx(() => BottomNavigationBar(
          backgroundColor: AppColor.amber[200],
          items: ScreenAndMenu.listCustomerIcons,
          unselectedLabelStyle: const TextStyle(fontSize: Dimens.font_size_min),
          // showUnselectedLabels: false,
          unselectedItemColor: AppColor.black,
          selectedItemColor: AppColor.primary,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: Dimens.font_size_min),
          currentIndex: appController.currentAppPageIndex.value,
          onTap: (index) {
            appController.currentAppPageIndex.value = index;
          },
        ));
  }
}
