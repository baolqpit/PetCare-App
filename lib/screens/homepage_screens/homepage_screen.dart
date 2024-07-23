import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/model/news_model/news_model.dart';
import 'package:petcare_app_management/screens/homepage_screens/hot_news.dart';
import 'package:petcare_app_management/screens/homepage_screens/news_details.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';
import 'package:petcare_app_management/share/format/format.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final AppController appController = Get.find();
  final NewsController newsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newsController.listNews.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => newsController.listNews.isEmpty && appController.isLoading.value
            ? LoadingScreen()
            : Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.padding_horizontal,
                    vertical: Dimens.padding_vertical),
                child: Column(
                  children: <Widget>[
                    HotNews()
                  ],
                ),
              ));
  }

  Future<void> fetchData() async {
    await newsController.getNews();
  }
}
