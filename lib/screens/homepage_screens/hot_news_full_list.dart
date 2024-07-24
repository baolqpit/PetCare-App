import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/model/news_model/news_model.dart';
import 'package:petcare_app_management/screens/homepage_screens/news_details.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';
import 'package:petcare_app_management/share/format/format.dart';

import '../../share/Colors/app_color.dart';
import '../../share/Dimens/dimens.dart';
import '../../share/Widgets/apptext.dart';

class HotNewsFullList extends StatefulWidget {
  const HotNewsFullList({super.key});

  @override
  State<HotNewsFullList> createState() => _HotNewsFullListState();
}

class _HotNewsFullListState extends State<HotNewsFullList> {
  final NewsController newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '', showReturnButton: true),
      body: Container(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.padding_vertical,
            horizontal: Dimens.padding_horizontal),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: newsController.listNews
                .map((news) => Padding(
                  padding: const EdgeInsets.only(bottom: Dimens.padding_horizontal),
                  child: GestureDetector(
                    onTap: () => Get.to(() => NewsDetails(newsModel: news)),
                    child: Stack(
                          children: <Widget>[
                            _buildBoxShadow(),
                            _buildNewsComponent(news: news),
                          ],
                        ),
                  ),
                ))
                .toList(),
          ),
        ),
      ),
    );
  }

  _buildBoxShadow() {
    return Container(
      padding: const EdgeInsets.all(Dimens.padding_vertical),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColor.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(3, 3),
        ),
      ]),
    );
  }

  _buildNewsComponent({required NewsModel news}) {
    return Container(
      padding: const EdgeInsets.all(Dimens.padding_vertical),
      decoration: BoxDecoration(
          border: const Border.fromBorderSide(
              BorderSide(width: 2.0, color: AppColor.primary)),
          borderRadius: BorderRadius.circular(Dimens.circular10),
          color: AppColor.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Dimens.circular10),
              topRight: Radius.circular(Dimens.circular10),
            ),
            child: Center(
              child: SizedBox(
                width: Get.width,
                height: 150,
                child: Image.network(
                  news.urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AppText(
            content: news.title,
            fontWeight: FontWeight.bold,
            textSize: Dimens.font_size_title,
            maxLine: 1,
          ),
          Dimens.height5,
          AppText(
            content: news.description,
            maxLine: 1,
          ),
          Dimens.height20,
          AppText(
            content: "@ ${news.author!}",
            maxLine: 1,
          ),
          Dimens.height5,
          AppText(
            content: formatStringToDateTime(datetime: news.publishedAt!),
          ),
          Dimens.height10,
        ],
      ),
    );
  }
}
