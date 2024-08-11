import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/screens/homepage_screens/create_news_screen.dart';
import 'package:petcare_app_management/screens/homepage_screens/list_pet_to_adopt.dart';
import 'package:petcare_app_management/screens/homepage_screens/pet_type_list.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';

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
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
      await newsController.getNews();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newsController.listNews.clear();
    petController.listPets.clear();
    scrollController.dispose();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(child: _buildSearchBar()),
                    Dimens.width10,
                    Ink(
                      decoration: const ShapeDecoration(
                        color: AppColor.primary,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.create),
                        color: Colors.white,
                        onPressed: () => Get.to(() => const CreateNewsScreen()),
                      ),
                    ),
                  ],
                ),
                Dimens.height20,
                const PetTypeList(),
                Dimens.height20,
                Expanded(
                    child: SingleChildScrollView( controller: scrollController,scrollDirection: Axis.vertical, child: const ListPetToAdopt())),
                // HotNews()
                // UserPetsContainer()
              ],
            ),
          ));
  }

  _buildBoxShadow() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.circular12),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ]),
      ),
    );
  }

  _buildSearchBar() {
    return Stack(
      children: <Widget>[
        _buildBoxShadow(),
        Container(
          padding: const EdgeInsets.only(left: Dimens.padding_5),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(Dimens.sizeValue10)),
          child: const TextField(
            style: TextStyle(color: AppColor.grey),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: AppColor.grey, fontWeight: FontWeight.bold),
                hintText: 'Search ...',
                icon: Icon(
                  Icons.search,
                  color: AppColor.black,
                )),
          ),
        )
      ],
    );
  }
}
