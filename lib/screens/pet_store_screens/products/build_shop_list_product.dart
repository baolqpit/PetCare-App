import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';
import 'package:petcare_app_management/model/pet_store_model/product_model/product_model.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';
import 'package:petcare_app_management/share/format/format.dart';

class BuildShopListProduct extends StatefulWidget {
  final ShopModel shopModel;
  const BuildShopListProduct({super.key, required this.shopModel});

  @override
  State<BuildShopListProduct> createState() => _BuildShopListProductState();
}

class _BuildShopListProductState extends State<BuildShopListProduct> {
  final AppController appController = Get.find();
  final PetStoreController petStoreController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async => await petStoreController
        .getListProductsInShop(shopId: widget.shopModel.shopId!));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    petStoreController.productListInShop.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => petStoreController.productListInShop.isEmpty &&
            appController.isLoading.value
        ? const LoadingScreen()
        : Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: Dimens.sizeValue10,
            spacing: Dimens.sizeValue10,
            direction: Axis.horizontal,
            children: petStoreController.productListInShop
                .map((productInShop) => Stack(
                      children: <Widget>[
                        _buildProductBoxShadow(),
                        _buildProductComponent(product: productInShop!),
                        // _buildProductNumberElement(product: productInShop)
                      ],
                    ))
                .toList(),
          ));
  }

  _buildProductBoxShadow() {
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

  _buildProductComponent({required ProductModel product}) {
    return Container(
      width: (Get.width / 2.03) - (Dimens.sizeValue10 * 1.5),
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.padding_8, vertical: Dimens.padding_5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.circular12),
        color: AppColor.white,
        border: const Border.fromBorderSide(
            BorderSide(color: AppColor.colorBorderContainer, width: 2.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            product.productImgURL == ""
                ? 'https://th.bing.com/th/id/OIP.aKS59jaAmUbl1aOpLh13XQHaHa?rs=1&pid=ImgDetMain'
                : product.productImgURL!,
            height: 150,
            fit: BoxFit.cover,
          ),
          AppText(
            content: product.productName,
            maxLine: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                content: "đ" + formatNumberToVND(number: product.price!),
                color: AppColor.orange,
              ),
              AppText(
                content: 'Quantity: ${product.quantity}',
                textSize: Dimens.sizeValue10,
                fontWeight: FontWeight.bold,
              )
            ],
          )
        ],
      ),
    );
  }
}
