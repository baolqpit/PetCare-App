import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';
import 'package:petcare_app_management/share/Widgets/shop_app_bar.dart';

class ShopDetail extends StatefulWidget {
  final ShopModel shopModel;
  const ShopDetail({super.key, required this.shopModel});

  @override
  State<ShopDetail> createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(shopModel: widget.shopModel,),
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
