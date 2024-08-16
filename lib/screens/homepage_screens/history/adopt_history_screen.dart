import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/model/news_model/adopt_request_model/adopt_request_model.dart';
import 'package:petcare_app_management/model/news_model/news_model/news_model.dart';
import 'package:petcare_app_management/screens/feature_screens/no_data_found_screen.dart';
import 'package:petcare_app_management/screens/homepage_screens/history/history_page_view_screen.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';
import 'package:petcare_app_management/share/format/format.dart';

import '../../../share/Colors/app_color.dart';

class AdoptHistoryScreen extends StatefulWidget {
  const AdoptHistoryScreen({super.key});

  @override
  State<AdoptHistoryScreen> createState() => _AdoptHistoryScreenState();
}

class _AdoptHistoryScreenState extends State<AdoptHistoryScreen> {
  final NewsController newsController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    newsController.listAdoptRequestsSend.clear();
    newsController.listAdoptRequestsReceive.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'History', showReturnButton: true),
      body: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.padding_horizontal,
                vertical: Dimens.padding_vertical),
            child: _buildHistoryPageView(),
    ));
  }

  _buildHistoryPageView(){
    return const HistoryPageViewScreen();
  }

}
