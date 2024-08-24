import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/news_model/adopt_request_model/adopt_request_model.dart';
import 'package:petcare_app_management/model/news_model/news_model/news_model.dart';
import 'package:petcare_app_management/screens/homepage_screens/history/button_action_history.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';
import 'package:petcare_app_management/share/format/format.dart';

class RequestInfoScreen extends StatefulWidget {
  final AdoptRequestModel request;
  const RequestInfoScreen({super.key, required this.request});

  @override
  State<RequestInfoScreen> createState() => _RequestInfoScreenState();
}

class _RequestInfoScreenState extends State<RequestInfoScreen> {
  final NewsController newsController = Get.find();
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return _buildRequestComponent(request: widget.request);
  }

  _buildRequestComponent({required AdoptRequestModel request}) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(Dimens.padding_8),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(Dimens.circular10),
              border: const Border.fromBorderSide(BorderSide(
                  color: AppColor.colorBorderContainer, width: 2.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
              request.sendByUserId != userController.userInfo.value!.userId
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: ButtonActionHistory(adoptRequestModel: request),
                    )
                  : _buildRequestStatus(request: request)
            ],
          ),
        ));
  }

  _buildRequestStatus({required AdoptRequestModel request}) {
    return AppText(
        content: getRequestStatusName(
            requestStatusId: request.adoptRequestStatusId!),
    fontWeight: FontWeight.w900,
      color: getRequestStatusColor(requestStatusId: request.adoptRequestStatusId!),
    );
  }

  getRequestStatusName({required int requestStatusId}) {
    const map = {
      0: "Waiting",
      1: "Accept",
      2: "Reject",
    };
    return map[requestStatusId] ?? "Not found";
  }

  getRequestStatusColor({required int requestStatusId}) {
    const map = {
      0: AppColor.orange,
      1: AppColor.green,
      2: AppColor.red,
    };
    return map[requestStatusId] ?? AppColor.primary;
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

  NewsModel getNewsByNewsId({required int newsId}) {
    var newsModel =
        newsController.listNews.singleWhere((news) => news.newsId == newsId);
    return newsModel;
  }
}
