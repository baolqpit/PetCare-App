import 'package:get/get.dart';
import 'package:petcare_app_management/api/app_api/news_api.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/model/news_model/news_model.dart';

class NewsController extends GetxController {
  final AppController appController = Get.find();
  RxList<NewsModel> listNews = RxList<NewsModel>([]);

  ///GET NEWS
  getNews() async {
    appController.isLoading.value = true;
    var response = await NewsApi().getNews();
    listNews.value = response['articles'].map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
    print(listNews);
    appController.isLoading.value = false;
  }
}