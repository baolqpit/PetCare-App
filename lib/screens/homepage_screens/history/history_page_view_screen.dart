import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/model/news_model/adopt_request_model/adopt_request_model.dart';
import 'package:petcare_app_management/screens/feature_screens/no_data_found_screen.dart';
import 'package:petcare_app_management/screens/homepage_screens/history/request_info_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class HistoryPageViewScreen extends StatefulWidget {
  const HistoryPageViewScreen({super.key});

  @override
  State<HistoryPageViewScreen> createState() => _HistoryPageViewScreenState();
}

class _HistoryPageViewScreenState extends State<HistoryPageViewScreen>
    with TickerProviderStateMixin {
  final NewsController newsController = Get.find();
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
      await newsController.getListAdoptRequestSend();
      await newsController.getListAdoptRequestReceive();
    });
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTabBar(),
          _buildPageView(),
        ],
      ),
    );
  }

  _buildTabBar() {
    return TabBar(
        controller: tabController,
        indicatorColor: AppColor.primary,
        tabs: [
          Tab(
            child: AppText(content: 'Received'),
          ),
          Tab(
            child: AppText(content: 'Sent'),
          ),
        ]);
  }

  _buildPageView() {
    return Expanded(
      child: TabBarView(children: <Widget>[
        _buildListRequest(listRequest: newsController.listAdoptRequestsReceive),
        _buildListRequest(listRequest: newsController.listAdoptRequestsSend)
      ]),
    );
  }

  _buildListRequest({required RxList<AdoptRequestModel> listRequest}){
    return Obx(() => listRequest.isEmpty ? const NoDataFoundScreen() : Column(
      children: listRequest.map((request) => Stack(
        children: <Widget>[
          _buildBoxShadow(),
          _buildRequestInfo(request: request)
        ],
      )).toList()));
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

  _buildRequestInfo({required AdoptRequestModel request}){
    return RequestInfoScreen(request: request);
  }
}
