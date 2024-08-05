import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/screens/pet_store_screens/shops/shop_detail.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class BuildListShops extends StatefulWidget {
  const BuildListShops({super.key});

  @override
  State<BuildListShops> createState() => _BuildListShopsState();
}

class _BuildListShopsState extends State<BuildListShops> {
  final PetStoreController petStoreController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: petStoreController.listShops
          .map((shop) => Padding(
                padding: const EdgeInsets.only(bottom: Dimens.padding_horizontal),
                child: Stack(
                  children: <Widget>[
                    _buildShopBoxShadow(),
                    _buildShopComponent(shop: shop),
                    _buildShopNumberElement(shop: shop)
                  ],
                ),
              ))
          .toList(),
    );
  }

  _buildShopBoxShadow() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimens.circular12),boxShadow: [
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

  _buildShopComponent({required ShopModel shop}) {
    return GestureDetector(
      onTap: () => Get.to(() => ShopDetail(shopModel: shop,)),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding_8, vertical: Dimens.padding_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.circular12),
          color: AppColor.white,
          border: const Border.fromBorderSide(BorderSide(color: AppColor.grey)),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: shop.shopServices!
                  .map((service) => Padding(
                        padding: const EdgeInsets.only(left: Dimens.padding_5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.purple,
                              borderRadius:
                                  BorderRadius.circular(Dimens.circular12)),
                          padding: const EdgeInsets.all(Dimens.padding_5),
                          child: AppText(
                            content: getServiceName(service: service),
                            color: AppColor.white,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Row(
              children: <Widget>[
                _buildShopAvatar(),
                Dimens.width10,
                Expanded(child: _buildShopInfo(shop: shop))
              ],
            )
          ],
        ),
      ),
    );
  }

  getServiceName({required int service}) {
    switch (service) {
      case 1:
        return "Spa";
      case 2:
        return "Injection";
      case 3:
        return "Sitting";
      default:
        break;
    }
  }

  _buildShopAvatar() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      width: 60,
      height: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          'https://okcredit-blog-images-prod.storage.googleapis.com/2021/04/petshop1.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildShopInfo({required ShopModel shop}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AppText(
          content: '${shop.shopName}',
          fontWeight: FontWeight.bold,
          textSize: Dimens.font_size_title,
          color: AppColor.primary,
        ),
        _buildContactRow(value: shop.city, iconData: Icons.location_city),
        _buildContactRow(value: shop.phone, iconData: Icons.phone),
        _buildContactRow(value: shop.shopMail, iconData: Icons.mail),
      ],
    );
  }

  _buildContactRow({required String? value, required IconData iconData}) {
    return Row(
      children: <Widget>[
        Icon(iconData),
        Dimens.width5,
        AppText(content: value ?? "N/A")
      ],
    );
  }
  
  _buildShopNumberElement({required ShopModel shop}){
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimens.circular12), bottomRight: Radius.circular(Dimens.circular12)),
        border: Border.fromBorderSide(BorderSide(color: AppColor.grey))
      ),
      padding: const EdgeInsets.all(Dimens.padding_5),
      child: AppText(content: '${petStoreController.listShops.indexOf(shop) + 1}', color: AppColor.orange, fontWeight: FontWeight.bold,),
    );
  }
}
