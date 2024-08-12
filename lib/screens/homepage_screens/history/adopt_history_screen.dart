import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/model/news_model/adopt_request_model/adopt_request_model.dart';
import 'package:petcare_app_management/model/news_model/news_model/news_model.dart';
import 'package:petcare_app_management/screens/feature_screens/no_data_found_screen.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'History', showReturnButton: true),
      body: Obx(() => Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimens.padding_horizontal,
                vertical: Dimens.padding_vertical),
            child: newsController.listAdoptRequests.isEmpty
                ? const Center(child: NoDataFoundScreen())
                : SingleChildScrollView(
                    child: Column(
                      children: newsController.listAdoptRequests
                          .map((request) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: Dimens.padding_horizontal),
                                child: Stack(
                                  children: <Widget>[
                                    _buildBoxShadow(),
                                    _buildRequestComponent(request: request)
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
          )),
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

  _buildRequestComponent({required AdoptRequestModel request}) {
    return Container(
      padding: const EdgeInsets.all(Dimens.padding_8),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(Dimens.circular10),
          border: const Border.fromBorderSide(
              BorderSide(color: AppColor.colorBorderContainer, width: 2.0))),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: AppText(
                content: formatToDateTimeWithExactlyTime(
                    datetime: request.sendDate!),
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                textSize: Dimens.font_size_min,
                maxLine: 1,
              )),
              _buildChatButton()
            ],
          ),
          _buildNewsInfo(request: request),
          Align(
            alignment: Alignment.bottomRight,
            child: _buildActionButtons(request: request),
          )
        ],
      ),
    );
  }

  _buildChatButton() {
    return Container(
      padding: const EdgeInsets.all(Dimens.padding_5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.circular10),
          color: AppColor.grey.withOpacity(0.2)),
      child: Row(
        children: [
          const Icon(Icons.chat),
          Dimens.width5,
          AppText(content: 'Chat')
        ],
      ),
    );
  }

  _buildNewsInfo({required AdoptRequestModel request}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          content: getNewsByNewsId(newsId: request.newsId!).newsTitle,
          color: AppColor.colorTextCyan,
          fontWeight: FontWeight.bold,
          textSize: Dimens.font_size_title,
        ),
        Dimens.height5,
        Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                getNewsByNewsId(newsId: request.newsId!).newsURL! != ""
                    ? getNewsByNewsId(newsId: request.newsId!).newsURL!
                    : 'https://th.bing.com/th/id/R.8359b42bbcae99fc2473fb9bdb6e1ae0?rik=FdiaSrRDfG9mAQ&pid=ImgRaw&r=0',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            Dimens.width20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildRowPetInfo(
                    icon: Icons.pets,
                    label: getNewsByNewsId(newsId: request.newsId!)
                        .abandonAnimalTypeName!),
                _buildRowPetInfo(
                    icon: Icons.location_on_outlined,
                    label: getNewsByNewsId(newsId: request.newsId!).location!),
                _buildRowPetInfo(
                    icon: Icons.send, label: request.sendByUserName!)
              ],
            )
          ],
        ),
      ],
    );
  }

  _buildRowPetInfo({required IconData icon, required String label}) {
    return Row(
      children: <Widget>[Icon(icon), Dimens.width5, AppText(content: label)],
    );
  }

  _buildActionButtons({required AdoptRequestModel request}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return showAlertDialog(
                    title: "Accept Request Confirmation",
                      context: context,
                      onSubmitFunction: () async {
                        await newsController.updateAdoptRequest(
                            adoptRequestId: request.adoptRequestId!,
                            requestStatusId: 1,
                            requestStatusName:
                            "Accept");
                        Get.back();
                      },
                      widget: AppText(
                          content:
                              'Are you sure to accept this request? Your post will be remove from news!'));
                });
          },
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColor.submitColor),
          child: AppText(
            content: 'Accept',
            color: AppColor.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Dimens.width5,
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return showAlertDialog(
                    title: 'Reject Request Confirmation',
                      context: context,
                      onSubmitFunction: () async {
                        await newsController.updateAdoptRequest(
                            adoptRequestId: request.adoptRequestId!,
                            requestStatusId: 2,
                            requestStatusName:
                            "Reject");
                        Get.back();
                      },
                      widget: AppText(
                          content:
                          'Are you sure to reject this request? User who sent request will not be seen this news!'));
                });
          },
          style: ElevatedButton.styleFrom(backgroundColor: AppColor.red),
          child: AppText(
            content: 'Reject',
            color: AppColor.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  NewsModel getNewsByNewsId({required int newsId}) {
    var newsModel =
        newsController.listNews.singleWhere((news) => news.newsId == newsId);
    return newsModel;
  }
}
