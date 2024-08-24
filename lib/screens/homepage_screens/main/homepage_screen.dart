import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/news_model/news_model/news_model.dart';
import 'package:petcare_app_management/screens/homepage_screens/create_news/create_news_screen.dart';
import 'package:petcare_app_management/screens/homepage_screens/history/adopt_history_screen.dart';
import 'package:petcare_app_management/screens/homepage_screens/main/list_pet_to_adopt.dart';
import 'package:petcare_app_management/screens/homepage_screens/main/pet_type_list.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
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
  TextEditingController searchKeyController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
      await newsController.getNews();
      await newsController.getListAdoptRequestReceive();
      await newsController.getListAdoptRequestSend();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newsController.listNews.clear();
    newsController.listAdoptRequestsReceive.clear();
    newsController.listAdoptRequestsSend.clear();
    scrollController.dispose();
    print("Clear");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => appController.isLoading.value
        ? const LoadingScreen()
        : Stack(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimens.padding_horizontal,
                    vertical: Dimens.padding_vertical),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            onPressed: () =>
                                Get.to(() => const CreateNewsScreen()),
                          ),
                        ),
                      ],
                    ),
                    Dimens.height20,
                    _buildPetCategories(),
                    Dimens.height20,
                    Expanded(
                        child: SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.vertical,
                            child: const ListPetToAdopt())),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                      onPressed: () async {
                        await newsController.getNews();
                        searchKeyController.clear();
                        newsController.currentPetTypeIndex.value = -1;
                        Get.to(() => const AdoptHistoryScreen());
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      backgroundColor: AppColor.primary,
                      child: const Icon(
                        Icons.history,
                        color: AppColor.white,
                      )),
                ),
              ),
            ],
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

  _buildPetCategories(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(content: 'Categories', color: AppColor.black, fontWeight: FontWeight.bold,),
        Dimens.height10,
        const PetTypeList()
      ],
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
          child: TextField(
            controller: searchKeyController,
            style: const TextStyle(color: AppColor.grey),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(
                    color: AppColor.grey, fontWeight: FontWeight.bold),
                hintText: 'Search ...',
                icon: GestureDetector(
                  onTap: () async => await newsController.searchNews(searchKey: searchKeyController.text) ,
                  child: const Icon(
                    Icons.search,
                    color: AppColor.black,
                  ),
                )),
          ),
        )
      ],
    );
  }
}
