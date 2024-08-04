import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/screens/pet_store_screens/shops/create_shop_dialog.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Shops', showReturnButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding_horizontal,
            vertical: Dimens.padding_vertical),
        child: Column(
          children: <Widget>[
            Container(
              child: _buildAddShopButton(),
            )
          ],
        ),
      ),
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
