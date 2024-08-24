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
  Rx<int> currentHistoryIndex = Rx<int>(0);
  RxList<AdoptRequestModel> listAdoptRequestsReceive =
      RxList<AdoptRequestModel>([]);
  RxList<AdoptRequestModel> listAdoptRequestsSend =
      RxList<AdoptRequestModel>([]);
  Rx<int> currentPetTypeIndex = Rx<int>(-1);

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
  createAdoptRequest(
      {required int newsId, required int newsCreatedByUserId}) async {
    appController.isLoading.value = true;
    Map<String, dynamic> data = {
      "sendByUserId": userController.userInfo.value!.userId,
      "sendByUserName":
          "${userController.userInfo.value!.firstName!} ${userController.userInfo.value!.lastName!}",
      "sendDate": DateTime.now().toUtc().toIso8601String(),
      "adoptRequestStatusId": 0,
      "adoptRequestStatusName": "Waiting",
      "newsId": newsId,
      "newsCreatedByUserId": newsCreatedByUserId
    };
    await NewsApi().createAdoptRequest(data: data);
    await getListAdoptRequestSend();
    getBoolValueToDisplayAdoptButton(newsId: newsId);
    appController.isLoading.value = false;
  }

  ///GET LIST ADOPT REQUEST RECEIVE
  getListAdoptRequestReceive() async {
    appController.isLoading.value = true;
    if (userController.userInfo.value != null) {
      var res = await NewsApi().getAdoptRequestsReceive(
          shopId: userController.userInfo.value!.userId!);
      listAdoptRequestsReceive.value = res
          .map<AdoptRequestModel>((json) => AdoptRequestModel.fromJson(json))
          .toList();
    }
    appController.isLoading.value = false;
  }

  ///GET LIST ADOPT REQUEST SEND
  getListAdoptRequestSend() async {
    appController.isLoading.value = true;
    if (userController.userInfo.value != null) {
      var res = await NewsApi()
          .getAdoptRequestsSend(userId: userController.userInfo.value!.userId!);
      listAdoptRequestsSend.value = res
          .map<AdoptRequestModel>((json) => AdoptRequestModel.fromJson(json))
          .toList();
    }
    appController.isLoading.value = false;
  }

  ///GET BOOL VALUE TO DISPLAY ADOPT BUTTON
  Rx<bool> getBoolValueToDisplayAdoptButton({required int newsId}) {
    AdoptRequestModel? result = listAdoptRequestsReceive
        .firstWhereOrNull((request) => request.newsId == newsId);
    return result == null ? false.obs : true.obs;
  }

  ///UPDATE ADOPT REQUEST
  updateAdoptRequest(
      {required int adoptRequestId,
      required int requestStatusId,
      required String requestStatusName}) async {
    appController.isLoading.value = true;
    var data = {
      'adoptRequestStatusId': requestStatusId,
      'adoptRequestStatusName': requestStatusName
    };
    await NewsApi()
        .updateAdoptRequest(data: data, adoptRequestId: adoptRequestId);
    await getListAdoptRequestReceive();
    appController.isLoading.value = false;
  }

  ///DELETE USER NEWS
  deleteUserNews({required int newsId}) async {
    appController.isLoading.value = true;
    await NewsApi().deleteUserNews(newsId: newsId);
    await getNews();
    appController.isLoading.value = false;
  }

  ///SEARCH NEWS
  searchNews({required String? searchKey}) async {
    appController.isLoading.value = true;
    currentPetTypeIndex.value = -1;
    if (searchKey == null || searchKey.isEmpty) {
      await getNews();
    } else {
      await getNews();
      listNews.value = listNews
          .where((news) =>
              news.newsTitle != null && news.newsTitle!.toLowerCase().contains(searchKey))
          .toList();
    }
    appController.isLoading.value = false;
  }
}
