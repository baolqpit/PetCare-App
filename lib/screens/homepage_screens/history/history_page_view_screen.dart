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
  ScrollController scrollController = ScrollController();
  final NewsController newsController = Get.find();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: newsController.currentHistoryIndex.value);
    tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    tabController.removeListener(_handleTabChange);
    tabController.dispose();
    newsController.currentHistoryIndex.value = 0;
    scrollController.dispose();
    super.dispose();
  }

   _handleTabChange() {
    if (tabController.indexIsChanging) {
      newsController.currentHistoryIndex.value = tabController.index;
      print(newsController.currentHistoryIndex.value);
    }
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
        onTap: (index) {
          newsController.currentHistoryIndex.value = index;
        },
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
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          Obx(() => _buildListRequest(
              listRequest: newsController.listAdoptRequestsReceive)),
          Obx(() => _buildListRequest(
              listRequest: newsController.listAdoptRequestsSend)),
        ],
      ),
    );
  }

  _buildListRequest({required List<AdoptRequestModel> listRequest}) {
    return listRequest.isEmpty
        ? const NoDataFoundScreen()
        : SingleChildScrollView(
      controller: scrollController,
          child: Column(
              children: listRequest
                  .map((request) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: Dimens.padding_8),
                        child: Stack(
                          children: <Widget>[
                            _buildBoxShadow(),
                            _buildRequestInfo(request: request),
                          ],
                        ),
                      ))
                  .toList(),
            ),
        );
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

  _buildRequestInfo({required AdoptRequestModel request}) {
    return RequestInfoScreen(request: request);
  }
}
