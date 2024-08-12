import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/api/app_api/news_api.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/news_model/adopt_request_model/adopt_request_model.dart';
import 'package:petcare_app_management/model/news_model/news_model/news_model.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class NewsController extends GetxController {
  final AppController appController = Get.find();
  final UserController userController = Get.find();
  RxList<NewsModel> listNews = RxList<NewsModel>([]);
  RxList<AdoptRequestModel> listAdoptRequests = RxList<AdoptRequestModel>([]);

  ///GET NEWS
  getNews() async {
    appController.isLoading.value = true;
    var response = await NewsApi().getNews();
    listNews.value =
        response.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
    appController.isLoading.value = false;
  }

  ///CREATE NEWS
  createNews(
      {required NewsModel newsModel, required BuildContext context}) async {
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
    var res = await NewsApi().createNews(data: data);
    res != null
        ? showSnackBar(context: context, content: 'Create News Successfully!')
        : null;
    appController.isLoading.value = false;
  }

  ///CREATE ADOPT REQUEST
  createAdoptRequest({required int newsId}) async {
    appController.isLoading.value = true;
    Map<String, dynamic> data = {
      "sendByUserId": userController.userInfo.value!.userId,
      "sendByUserName":
          "${userController.userInfo.value!.firstName!} ${userController.userInfo.value!.lastName!}",
      "sendDate": DateTime.now().toUtc().toIso8601String(),
      "adoptRequestStatusId": 0,
      "adoptRequestStatusName": "Waiting",
      "newsId": newsId
    };
    await NewsApi().createAdoptRequest(data: data);
    await getAdoptRequest();
    getBoolValueToDisplayAdoptButton(newsId: newsId);
    appController.isLoading.value = false;
  }

  ///GET ADOPT REQUEST
  getAdoptRequest() async {
    appController.isLoading.value = true;
    var res = await NewsApi()
        .getAdoptRequests(userId: userController.userInfo.value!.userId!);
    listAdoptRequests.value = res
        .map<AdoptRequestModel>((json) => AdoptRequestModel.fromJson(json))
        .toList();
    appController.isLoading.value = false;
  }

  ///GET BOOL VALUE TO DISPLAY ADOPT BUTTON
  Rx<bool> getBoolValueToDisplayAdoptButton({required int newsId}){
    AdoptRequestModel? result = listAdoptRequests.firstWhereOrNull((request) => request.newsId == newsId);
    return result == null ? false.obs : true.obs;
  }

  ///UPDATE ADOPT REQUEST
  updateAdoptRequest({required int adoptRequestId, required int requestStatusId, required String requestStatusName}) async {
    appController.isLoading.value = true;
    var data = {
      'adoptRequestStatusId': requestStatusId,
      'adoptRequestStatusName': requestStatusName
    };
    await NewsApi().updateAdoptRequest(data: data, adoptRequestId: adoptRequestId);
    appController.isLoading.value = false;
  }
}
