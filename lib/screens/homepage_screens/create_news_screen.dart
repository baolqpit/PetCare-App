import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:petcare_app_management/constants/Constants.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/news_model/news_model/news_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';

class CreateNewsScreen extends StatefulWidget {
  const CreateNewsScreen({super.key});

  @override
  State<CreateNewsScreen> createState() => _CreateNewsScreenState();
}

class _CreateNewsScreenState extends State<CreateNewsScreen> {
  final UserController userController = Get.find();
  final NewsController newsController = Get.find();
  ScrollController scrollController = ScrollController();
  TextEditingController newsTitleController = TextEditingController();
  TextEditingController newsContentController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  Rx<int> petTypeGroupId = Rx<int>(1);


  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    newsTitleController.clear();
    newsContentController.clear();
    locationController.clear();
    petTypeGroupId.value = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Create News', showReturnButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.padding_vertical,
            horizontal: Dimens.padding_horizontal),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: <Widget>[
              _buildTextField(controller: newsTitleController, label: 'Title'),
              _buildTextField(
                  controller: newsContentController, label: 'Content'),
              _buildTextField(controller: locationController, label: 'Location'),
              Row(
                children: <Widget>[
                  _buildRadioButtons(label: 'Dog', radioValue: 1),
                  _buildRadioButtons(label: 'Cat', radioValue: 2),
                ],
              ),
              _buildMultiChoice(),
              Dimens.height10,
              _buildCreateButton()
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField(
      {required TextEditingController controller, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          content: label,
          fontWeight: FontWeight.bold,
          textSize: Dimens.font_size_title,
          color: AppColor.colorTextCyan,
        ),
        Stack(
          children: <Widget>[
            _buildBoxShadow(),
            Container(
              padding: const EdgeInsets.all(Dimens.sizeValue5),
              decoration: BoxDecoration(
                  border: const Border.fromBorderSide(BorderSide(
                      color: AppColor.colorBorderContainer, width: 2)),
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(Dimens.sizeValue10)),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        Dimens.height10,
      ],
    );
  }

  _buildBoxShadow() {
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

  _buildRadioButtons({required String label, required int radioValue}) {
    return Obx(() => Row(
          children: <Widget>[
            AppText(
              content: label,
              color: AppColor.colorTextCyan,
            ),
            Radio(
                value: radioValue,
                groupValue: petTypeGroupId.value,
                onChanged: (value) {
                  value != null ? petTypeGroupId.value = value : null;
                }),
          ],
        ));
  }

  _buildMultiChoice() {
    return Obx(() => Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: Dimens.sizeValue5,
          runSpacing: Dimens.sizeValue5,
          children: Constants.LIST_PET_ABOUT_ATTRIBUTES
              .map((atrribute) => GestureDetector(
                    onTap: () {
                      setState(() {
                        atrribute['isSelected'] = !atrribute['isSelected'];
                      });
                    },
                    child: Container(
                      width: (Get.width - (Dimens.sizeValue10 * 4)) / 3,
                      padding: const EdgeInsets.all(Dimens.padding_8),
                      decoration: BoxDecoration(
                          border: const Border.fromBorderSide(
                              BorderSide(color: AppColor.colorBorderContainer)),
                          borderRadius:
                              BorderRadius.circular(Dimens.circular10),
                          color: atrribute['isSelected']
                              ? AppColor.primary
                              : AppColor.white),
                      child: Row(
                        children: [
                          atrribute['isSelected']
                              ? const Icon(
                                  Icons.check,
                                  color: AppColor.white,
                                )
                              : const SizedBox(),
                          Dimens.width10,
                          Expanded(
                            child: AppText(
                              content: atrribute['label'],
                              color: atrribute['isSelected']
                                  ? AppColor.white
                                  : AppColor.colorTextCyan,
                              fontWeight: FontWeight.bold,
                              maxLine: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ));
  }

  _buildCreateButton() {
    return ElevatedButton(
      onPressed: () {
        var newsData = {
          'listAttributes': Constants.LIST_PET_ABOUT_ATTRIBUTES,
          'content': newsContentController.text
        };
        NewsModel newsModel = NewsModel(
          newsTitle: newsTitleController.text,
          newsURL: "",
          newsTypeId: 1,
          newsTypeName: 'Adopt',
          location: locationController.text,
          abandonAnimalTypeId: petTypeGroupId.value,
          abandonAnimalTypeName: petTypeGroupId.value == 1 ? 'Dog' : 'Cat',
          publicByShopId: userController.userInfo.value!.userId,
          newsData: jsonEncode(newsData)
        );
        newsController.createNews(newsModel: newsModel, context: context);
      },
      style: ElevatedButton.styleFrom(backgroundColor: AppColor.submitColor),
      child: AppText(
        content: 'Create',
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
