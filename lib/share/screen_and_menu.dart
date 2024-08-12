import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/screens/homepage_screens/main/homepage_screen.dart';
import 'package:petcare_app_management/screens/pet_store_screens/main/pet_store_screen.dart';
import 'package:petcare_app_management/screens/user_screen/user_info_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class ScreenAndMenu {
  static List<BottomNavigationBarItem> listCustomerIcons =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        label: 'Home',
        icon: SvgPicture.asset(
          Images.home_page_svg,
          width: 30,
          height: 30,
        )),
    BottomNavigationBarItem(
        label: 'Pets',
        icon: SvgPicture.asset(
          Images.pet_icon,
          width: 30,
          height: 30,
        )),
    BottomNavigationBarItem(
        label: 'Chat',
        icon: SvgPicture.asset(
          color: AppColor.primary,
          Images.messenger_icon,
          width: 30,
          height: 30,
        )),
    BottomNavigationBarItem(
        label: 'Pet Store',
        icon: SvgPicture.asset(
          Images.pet_store_svg,
          width: 30,
          height: 30,
        )),
    BottomNavigationBarItem(
        label: 'Personal',
        icon: SvgPicture.asset(
          Images.personal_svg,
          width: 30,
          height: 30,
        )),
  ];

  static List<Widget> listCustomerScreens = [
    HomepageScreen(),
    Container(
      child: AppText(content: "PET"),
    ),
    Container(
      child: AppText(content: "CHAT"),
    ),
    PetStoreScreen(),
    UserInfoScreen(),
  ];

  static List<Widget> listAdminScreens = [HomepageScreen(), PetStoreScreen()];

  static List<Widget> listShopScreens = [UserInfoScreen()];
}
