import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:petcare_app_management/model/news_model/news_model/news_model.dart';
import 'package:petcare_app_management/screens/feature_screens/no_data_found_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/format/format.dart';

class PetDetail extends StatefulWidget {
  final NewsModel newsModel;
  const PetDetail({super.key, required this.newsModel});

  @override
  State<PetDetail> createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  List<dynamic>? listAttribute;
  String? content;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.newsModel.newsData != "") {
      var newsModel = jsonDecode(widget.newsModel.newsData!);
      content = jsonDecode(newsModel)['content'];
      listAttribute = jsonDecode(newsModel)['listAttributes'];
      listAttribute!.removeWhere((atribute) => atribute['isSelected'] == false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            widget.newsModel.newsURL == ""
                ? 'https://th.bing.com/th/id/R.8359b42bbcae99fc2473fb9bdb6e1ae0?rik=FdiaSrRDfG9mAQ&pid=ImgRaw&r=0'
                : widget.newsModel.newsURL!,
            width: Get.width,
            height: 400,
            fit: BoxFit.cover,
          ),
          Dimens.height10,
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                _buildPetInfo(),
                _buildPetAttributesAbout(),
              ],),
            ),
          ),
          _buildSendInquiryButton()
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: AppText(
        content: 'Details',
        fontWeight: FontWeight.bold,
        textSize: Dimens.font_size_title,
      ),
    );
  }

  _buildPetInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Dimens.padding_vertical,
          horizontal: Dimens.padding_horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText(
            content:
                formatStringToDateTime(datetime: widget.newsModel.publicDate!),
            color: AppColor.grey,
          ),
          AppText(
            content: widget.newsModel.newsTitle,
            color: AppColor.colorTextCyan,
            fontWeight: FontWeight.bold,
            textSize: Dimens.font_size_title,
          ),
          Dimens.height10,
          Row(
            children: <Widget>[
              SvgPicture.asset(
                Images.location_svg,
                color: AppColor.colorTextCyan,
              ),
              Dimens.width10,
              AppText(
                content: widget.newsModel.location,
                color: AppColor.colorTextCyan,
              )
            ],
          ),
          Dimens.height5,
          Row(
            children: <Widget>[
              SvgPicture.asset(
                Images.services_svg,
                color: AppColor.colorTextCyan,
              ),
              Dimens.width10,
              AppText(
                content: widget.newsModel.abandonAnimalTypeName,
                color: AppColor.colorTextCyan,
              )
            ],
          )
        ],
      ),
    );
  }

  _buildPetAttributesAbout() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.padding_horizontal,
          vertical: Dimens.padding_vertical),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.colorContainerCyan,
          borderRadius: BorderRadius.circular(Dimens.circular12),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding_horizontal,
            vertical: Dimens.padding_vertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppText(
              content: 'About',
              fontWeight: FontWeight.bold,
              textSize: Dimens.font_size_title,
            ),
            Dimens.height10,
            widget.newsModel.newsData == ""
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AppText(content: content),
                      MultiSelectChipDisplay(
                        decoration: BoxDecoration(
                        ),
                        // icon: const Icon(Icons.pets),
                        textStyle:
                            const TextStyle(color: AppColor.colorTextCyan),
                        chipColor: AppColor.white,
                        items: listAttribute!
                            .map((atribute) =>
                                MultiSelectItem(atribute, atribute['label']))
                            .toList(),
                      )
                    ],
                  )
          ],
        ),
      ),
    );


  }

  _buildSendInquiryButton(){
    return Center(child: ElevatedButton(onPressed: (){}, child: AppText(content: 'Send Inquiry', color: AppColor.white, fontWeight: FontWeight.bold,), style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary),));
  }
}
