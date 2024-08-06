import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';
import 'package:petcare_app_management/model/pet_store_model/product_model/product_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/format/format.dart';

class ListNewProducts extends StatefulWidget {
  const ListNewProducts({super.key});

  @override
  State<ListNewProducts> createState() => _ListNewProductsState();
}

class _ListNewProductsState extends State<ListNewProducts> {
  final PetStoreController petStoreController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          content: 'New Products',
          fontWeight: FontWeight.bold,
          textSize: Dimens.font_size_title,
        ),
        _buildProductsList()
      ],
    );
  }

  _buildProductsList() {
    return Obx(() => Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: Dimens.sizeValue10,
      spacing: Dimens.sizeValue10,
      direction: Axis.horizontal,
      children: petStoreController.productList
          .map((product) => Container(
        width: (Get.width / 2.03) - (Dimens.sizeValue10 * 1.5),
        decoration: _buildProductBoxDecoration(),
        child: _buildProductComponent(product: product!),
      ))
          .toList(),
    ));
  }

  _buildProductBoxDecoration() {
    return const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimens.circular10),
            bottomRight: Radius.circular(Dimens.circular10)),
        border: Border.fromBorderSide(
            BorderSide(width: 1.0, color: AppColor.grey)));
  }

  _buildProductComponent({required ProductModel product}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.network(product.productImgURL == "" ? 'https://th.bing.com/th/id/OIP.aKS59jaAmUbl1aOpLh13XQHaHa?rs=1&pid=ImgDetMain' : product.productImgURL!),
        Container(
          padding: EdgeInsets.all(Dimens.sizeValue5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                content: product.productName,
                maxLine: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    content: "đ" + formatNumberToVND(number: product.price!),
                    color: AppColor.orange,
                  ),
                  AppText(content: "Quantity: ${product.quantity}", textSize: Dimens.sizeValue10,)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
