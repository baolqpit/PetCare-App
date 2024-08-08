import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/news_model/news_model.dart';
import 'package:petcare_app_management/screens/homepage_screens/hot_news.dart';
import 'package:petcare_app_management/screens/homepage_screens/news_details.dart';
import 'package:petcare_app_management/screens/pet_screens/user_pets_container.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';
import 'package:petcare_app_management/share/format/format.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final UserController userController = Get.find();
  final AppController appController = Get.find();
  final NewsController newsController = Get.find();
  final PetController petController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
      await newsController.getNews();
      await petController.getListPets(userId: userController.userInfo.value!.userId!);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newsController.listNews.clear();
    petController.listPets.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => appController.isLoading.value
        ? const LoadingScreen()
        : Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.padding_horizontal,
                vertical: Dimens.padding_vertical),
            child: Column(
              children: <Widget>[
                // HotNews()
                UserPetsContainer()
              ],
            ),
          ));
  }
}
