import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/screens/homepage_screens/hot_news_full_list.dart';
import 'package:petcare_app_management/screens/homepage_screens/news_details.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/format/format.dart';

import '../../model/news_model/news_model.dart';

class HotNews extends StatefulWidget {
  const HotNews({super.key});

  @override
  State<HotNews> createState() => _HotNewsState();
}

class _HotNewsState extends State<HotNews> {
  final NewsController newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                content: 'Hot',
                textSize: Dimens.font_size_title,
                fontWeight: FontWeight.bold,
                color: AppColor.grey,
              ),
              GestureDetector(
                onTap: () => Get.to(() => const HotNewsFullList()),
                child: Row(
                  children: [
                    AppText(
                      content: 'See more',
                      textSize: Dimens.font_size_title,
                      fontWeight: FontWeight.bold,
                      color: AppColor.grey,
                    ),
                    Dimens.width5,
                    Container(
                      padding: EdgeInsets.all(Dimens.sizeValue5),
                      decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: const Icon(
                        Icons.arrow_forward_sharp,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Dimens.height5,
          _buildHotNewsList()
        ],
      ),
    );
  }

  _buildHotNewsList() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.only(right: Dimens.sizeValue10),
                child: _buildHotNewsComponent(
                    news: newsController.listNews[index]));
          }),
    );
  }

  _buildHotNewsComponent({required NewsModel news}) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(Dimens.padding_vertical),
          width: Get.width / 1.5,
          height: 350,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(3, 3),
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(Dimens.padding_vertical),
          width: Get.width / 1.5,
          height: 350,
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
              GestureDetector(
                onTap: () {
                  Get.to(() => NewsDetails(newsModel: news));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    AppText(content: 'View'),
                    const Icon(Icons.arrow_right_alt_rounded)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
