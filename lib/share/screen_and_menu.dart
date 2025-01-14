import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petcare_app_management/screens/user_screen/user_info_screen.dart';
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
        label: 'Personal',
        icon: SvgPicture.asset(
          Images.personal_svg,
          width: 30,
          height: 30,
        )),
    BottomNavigationBarItem(
        label: 'Pet Store',
        icon: SvgPicture.asset(
          Images.pet_store_svg,
          width: 30,
          height: 30,
        ))
  ];

  static List<Widget> listCustomerScreens = [
    Container(child: Apptext(content: 'HomePage'),),
    UserInfoScreen(),
    Container(child: Apptext(content: 'PetStore'),),
  ];
}
