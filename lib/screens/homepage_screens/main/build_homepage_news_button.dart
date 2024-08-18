import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/news_model/adopt_request_model/adopt_request_model.dart';
import 'package:petcare_app_management/model/news_model/news_model/news_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class BuildHomepageNewsButton extends StatefulWidget {
  final NewsModel newsModel;
  const BuildHomepageNewsButton({super.key, required this.newsModel});

  @override
  State<BuildHomepageNewsButton> createState() =>
      _BuildHomepageNewsButtonState();
}

class _BuildHomepageNewsButtonState extends State<BuildHomepageNewsButton> {
  final UserController userController = Get.find();
  final NewsController newsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.newsModel.publicByShopId ==
            userController.userInfo.value!.userId!
        ? ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return showAlertDialog(
                        title: 'Confirm Delete News',
                        context: context,
                        onSubmitFunction: () async {
                          await newsController.deleteUserNews(
                              newsId: widget.newsModel.newsId!);
                          Get.back();
                        },
                        widget: AppText(
                            content:
                                'Make sure to delete this news! All the request to this post will be delete!'));
                  });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.grey.withOpacity(0.5)),
            child: AppText(
              content: 'Delete',
              color: AppColor.white,
              fontWeight: FontWeight.bold,
            ),
          )
        : newsController.listAdoptRequestsSend.firstWhereOrNull(
                    (request) => request.newsId == widget.newsModel.newsId!) ==
                null
            ? ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return showAlertDialog(
                            title: 'Confirm Adopt Request',
                            context: context,
                            onSubmitFunction: () async {
                              await newsController.createAdoptRequest(
                                  newsId: widget.newsModel.newsId!,
                                  newsCreatedByUserId:
                                      widget.newsModel.publicByShopId!);
                              Get.back();
                            },
                            widget: AppText(
                                content:
                                    'Make sure to adopt this pet! Your request will be sent to the owner'));
                      });
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColor.black),
                child: AppText(
                  content: 'Adopt',
                  color: AppColor.white,
                  fontWeight: FontWeight.bold,
                ))
            : ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: getButtonColor(
                        requestStatusId:
                            getButtonAction(newsId: widget.newsModel.newsId!)
                                .value)),
                child: AppText(
                  content: getButtonName(
                          requestStatusId:
                              getButtonAction(newsId: widget.newsModel.newsId!)
                                  .value)
                      .value,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                )));
  }

  getButtonColor({required int requestStatusId}) {
    const map = {
      0: AppColor.orange,
      1: AppColor.green,
      2: AppColor.red,
    };
    return map[requestStatusId] ?? AppColor.primary.obs;
  }

  Rx<String?> getButtonName({required int requestStatusId}) {
    const map = {
      0: "Sent",
      1: "Accept",
      2: "Reject",
    };
    return map[requestStatusId].obs;
  }

  Rx<int> getButtonAction({required int newsId}) {
    AdoptRequestModel result = newsController.listAdoptRequestsSend
        .firstWhere((request) => request.newsId == newsId);
    return result.adoptRequestStatusId!.obs;
  }
}
