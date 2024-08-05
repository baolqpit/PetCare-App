import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';
import 'package:petcare_app_management/screens/pet_store_screens/shops/build_list_shops.dart';
import 'package:petcare_app_management/screens/pet_store_screens/shops/create_shop_dialog.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final PetStoreController petStoreController = Get.find();
  final AppController appController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
      await petStoreController.getShops();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    petStoreController.listShops.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Shops', showReturnButton: true),
      body: Obx(() =>
          petStoreController.listShops.isEmpty && appController.isLoading.value
              ? LoadingScreen()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.padding_horizontal,
                      vertical: Dimens.padding_vertical),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: _buildAddShopButton(),
                      ),
                      Dimens.height10,
                      Expanded(
                          child: SingleChildScrollView(child: BuildListShops()))
                    ],
                  ),
                )),
    );
  }

  _buildAddShopButton() {
    return ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return CreateShopDialog();
              });
        },
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.green),
        child: Icon(
          Icons.add,
          color: AppColor.white,
        ));
  }
}
