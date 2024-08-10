import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/api/app_api/news_api.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/model/news_model/news_model.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class NewsController extends GetxController {
  final AppController appController = Get.find();
  RxList<NewsModel> listNews = RxList<NewsModel>([]);

  ///GET NEWS
  getNews() async {
    appController.isLoading.value = true;
    var response = await NewsApi().getNews();
    listNews.value = response.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
    appController.isLoading.value = false;
  }

  ///CREATE NEWS
  createNews({required NewsModel newsModel, required BuildContext context}) async {
    appController.isLoading.value = true;
    Map<String, dynamic> data = {
      "newsTitle": newsModel.newsTitle,
      "newsURL": newsModel.newsURL,
      "newsTypeName": newsModel.newsTypeName,
      "newsTypeId": newsModel.newsTypeId,
      "publicDate": DateTime.now().toUtc().toIso8601String(),
      "publicByShopId": newsModel.publicByShopId,
      "newsData": jsonEncode(newsModel.newsData),
      "location": newsModel.location,
      "abandonAnimalTypeId": newsModel.abandonAnimalTypeId,
      "abandonAnimalTypeName": newsModel.abandonAnimalTypeName
    };
    print(DateTime.now());
    var res = await NewsApi().createNews(data: data);
    res != null ? showSnackBar(context: context, content: 'Create News Successfully!') : null;
    appController.isLoading.value = false;
  }
}