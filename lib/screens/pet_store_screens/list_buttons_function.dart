import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/constants/Constants.dart';
import 'package:petcare_app_management/screens/pet_store_screens/shops/shop_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

import '../../share/Dimens/dimens.dart';

class ListButtonsFunction extends StatefulWidget {
  const ListButtonsFunction({super.key});

  @override
  State<ListButtonsFunction> createState() => _ListButtonsFunctionState();
}

class _ListButtonsFunctionState extends State<ListButtonsFunction> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        alignment: WrapAlignment.end,
        spacing: Dimens.sizeValue10,
        direction: Axis.horizontal,
        children: <Widget>[
          _buildButtonComponent(
              imgURL: Images.pet_store_svg,
              buttonName: 'Shops',
              function: () => Get.to(() => ShopScreen()),
              textColor: AppColor.white,
              containerColor: AppColor.blue),
          _buildButtonComponent(
              imgURL: Images.sale_svg,
              buttonName: 'Sale',
              svgColor: AppColor.white,
              textColor: AppColor.white,
              containerColor: AppColor.amber),
          _buildButtonComponent(
              imgURL: Images.food_svg,
              buttonName: 'Food',
              textColor: AppColor.white,
              containerColor: AppColor.orange),
          _buildButtonComponent(
              imgURL: Images.services_svg,
              buttonName: 'Services',
              textColor: AppColor.white,
              containerColor: AppColor.purple),
          _buildButtonComponent(
              imgURL: Images.supplies_svg,
              buttonName: 'Supplies',
              textColor: AppColor.white,
              containerColor: AppColor.green),
        ],
      ),
    );
  }

  _buildButtonComponent(
      {required String imgURL,
      required String buttonName,
      Color? svgColor,
      Color? textColor,
      Color? containerColor,
      Function()? function}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 120,
        padding: EdgeInsets.all(Dimens.padding_8),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(width: 1.0)),
            borderRadius: BorderRadius.circular(50.0),
            color: containerColor ?? AppColor.white),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              imgURL,
              color: svgColor ?? null,
              width: 40,
              height: 40,
            ),
            Dimens.height5,
            AppText(
              content: buttonName,
              color: textColor ?? AppColor.black,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
