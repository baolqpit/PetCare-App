import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';
import 'package:petcare_app_management/screens/pet_store_screens/main/list_buttons_function.dart';
import 'package:petcare_app_management/screens/pet_store_screens/main/list_new_products.dart';
import 'package:petcare_app_management/screens/pet_store_screens/main/pet_store_carousel_slider.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';

class PetStoreScreen extends StatefulWidget {
  const PetStoreScreen({super.key});

  @override
  State<PetStoreScreen> createState() => _PetStoreScreenState();
}

class _PetStoreScreenState extends State<PetStoreScreen> {
  final PetStoreController petStoreController = Get.find();
  final AppController appController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async => await petStoreController.getListProducts());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    petStoreController.currentCarousel.value = 0;
    petStoreController.productList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => appController.isLoading.value &&
            petStoreController.productList != null
        ? LoadingScreen()
        : SingleChildScrollView(
          child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(
                  vertical: Dimens.padding_vertical,
                  horizontal: Dimens.padding_horizontal),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListButtonsFunction(),
                  PetStoreCarouselSlider(),
                  ListNewProducts(),
                ],
              ),
            ),
        ));
  }
}
