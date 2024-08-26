import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/main_controller.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/helper/shared_preferences_helper.dart';
import 'package:petcare_app_management/screens/homepage_screens/history/adopt_history_screen.dart';
import 'package:petcare_app_management/screens/user_screen/user_info_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
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
  final PetController petController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
        // await SharedPreferencesHelper().getUserAccount();
        // await userController.getUserByEmail(
        //     email: userController.emailController.text);
      await newsController.getNews();
      await newsController.getListAdoptRequestReceive();
      await newsController.getListAdoptRequestSend();
      mainController.initialSetUp();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newsController.listNews.clear();
    newsController.listAdoptRequestsSend.clear();
    newsController.listAdoptRequestsReceive.clear();
    appController.currentAppPageIndex.value = 0;
    super.dispose();
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
      // title: AppText(content: 'Hi, ${userController.userInfo.value!.firstName} ${userController.userInfo.value!.lastName}', fontWeight: FontWeight.bold,),
      backgroundColor: AppColor.white,
      leading: Padding(
        padding: const EdgeInsets.all(Dimens.padding_8),
        child: GestureDetector(
          onTap: () => Get.to(() => const UserInfoScreen()),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                  width: 30, height: 30,
                  'https://scontent.fsgn24-2.fna.fbcdn.net/v/t39.30808-1/452873944_1831713797311947_1766447589029695027_n.jpg?stp=cp6_dst-jpg_s160x160&_nc_cat=106&ccb=1-7&_nc_sid=0ecb9b&_nc_eui2=AeHgi9I1CoomUX7tJMmn5DLHaTIGMmdGR5ppMgYyZ0ZHmuGmegh-NvtgbR7Pwc_tTcr1oDGxX47gsoD4HcmUr80E&_nc_ohc=JTIQgBNcDYwQ7kNvgEaYOvF&_nc_ht=scontent.fsgn24-2.fna&cb_e2o_trans=t&oh=00_AYBEiCZplIJWpwgQzWoTGjDOeZLah8dcPG74g6zCFb3MOg&oe=66CD26E0')),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: Dimens.padding_8),
          child: CircleAvatar(
            backgroundColor: AppColor.primary.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: AppColor.white,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: Dimens.padding_8),
          child: CircleAvatar(
            backgroundColor: AppColor.primary.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.white,
                )),
          ),
        ),

      ],
    );
  }

  _buildAppBodyStructure() {
    return Obx(() => SafeArea(
          child: ScreenAndMenu.listCustomerScreens
              .elementAt(appController.currentAppPageIndex.value),
        ));
  }

  _buildAppBottomBar() {
    return Obx(() => BottomNavigationBar(
          items: ScreenAndMenu.listCustomerIcons,
          unselectedLabelStyle: const TextStyle(fontSize: Dimens.font_size_min),
          showUnselectedLabels: true,
          unselectedItemColor: AppColor.black,
          selectedItemColor: AppColor.primary,
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: Dimens.font_size_min),
          currentIndex: appController.currentAppPageIndex.value,
          onTap: (index) {
            if (mounted) {
              appController.currentAppPageIndex.value = index;
            }
          },
        ));
  }
}
