import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class CreateShopDialog extends StatefulWidget {
  const CreateShopDialog({super.key});

  @override
  State<CreateShopDialog> createState() => _CreateShopDialogState();
}

class _CreateShopDialogState extends State<CreateShopDialog> {
  final PetStoreController petStoreController = Get.find();
  final UserController userController = Get.find();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopURLController = TextEditingController();
  Rx<bool> petSpa = Rx<bool>(false);
  Rx<bool> petInjection = Rx<bool>(false);
  Rx<bool> petSitting = Rx<bool>(false);
  final TextEditingController spaPriceController = TextEditingController();
  final TextEditingController injectionPriceController =
      TextEditingController();
  final TextEditingController sittingPriceController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    shopNameController.clear();
    shopURLController.clear();
    petSpa.value = false;
    petInjection.value = false;
    petSitting.value = false;
    spaPriceController.clear();
    injectionPriceController.clear();
    sittingPriceController.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return showAlertDialog(
      title: 'Create New Shop',
      context: context,
      onSubmitFunction: () async {
        List<int> services = petStoreController.registShopServices(
            spaService: petSpa.value,
            injectionService: petInjection.value,
            sittingService: petSitting.value);
        ShopModel shopModel = new ShopModel(
            shopName: shopNameController.text,
            shopImgURL: shopURLController.text,
            shopMail: userController.userInfo.value!.email,
            phone: userController.userInfo.value!.phone,
            city: userController.userInfo.value!.address,
            shopServices: services);
        print("Services: ${services}");
        print("Shop Model: ${shopModel}");
        await petStoreController.createNewShop(shopModel: shopModel);
        Get.back();
      },
      widget: Obx(() => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: shopNameController,
                  decoration: InputDecoration(
                      label: AppText(
                        content: 'Shop Name',
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Pet District 7'),
                ),
                Dimens.height10,
                TextField(
                  controller: shopURLController,
                  decoration: InputDecoration(
                      label: AppText(
                        content: 'Shop Image',
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'URL'),
                ),
                Dimens.height20,
                AppText(
                  content: 'Services',
                  fontWeight: FontWeight.bold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildServiceContainer(
                        serviceName: 'Spa', serviceValue: petSpa),
                    _buildServiceContainer(
                        serviceName: 'Injection', serviceValue: petInjection),
                    _buildServiceContainer(
                        serviceName: 'Sitting', serviceValue: petSitting),
                  ],
                ),
                petSpa.value
                    ? _buildPriceField(
                        priceLabel: 'Spa Price', controller: spaPriceController)
                    : SizedBox(),
                Dimens.height10,
                petInjection.value
                    ? _buildPriceField(
                        priceLabel: 'Injection Price',
                        controller: injectionPriceController)
                    : SizedBox(),
                Dimens.height10,
                petSitting.value
                    ? _buildPriceField(
                        priceLabel: 'Sitting Price',
                        controller: sittingPriceController)
                    : SizedBox(),
              ],
            ),
          )),
    );
  }

  _buildServiceContainer(
      {required String serviceName, required Rx<bool> serviceValue}) {
    return Column(
      children: <Widget>[
        AppText(content: serviceName),
        Checkbox(
            value: serviceValue.value,
            onChanged: (value) => serviceValue.value = value!),
      ],
    );
  }

  _buildPriceField(
      {required String priceLabel, required TextEditingController controller}) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
          label: AppText(
        content: '${priceLabel} (vnd)',
        fontWeight: FontWeight.bold,
      )),
    );
  }
}
