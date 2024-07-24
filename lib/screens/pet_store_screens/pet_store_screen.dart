import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/screens/pet_store_screens/list_buttons_function.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';

class PetStoreScreen extends StatefulWidget {
  const PetStoreScreen({super.key});

  @override
  State<PetStoreScreen> createState() => _PetStoreScreenState();
}

class _PetStoreScreenState extends State<PetStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: Dimens.padding_vertical, horizontal: Dimens.padding_horizontal),
      child: Column(
        children: <Widget>[
          ListButtonsFunction(),
        ],
      ),
    );
  }
}
