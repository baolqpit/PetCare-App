import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/model/news_model/adopt_request_model/adopt_request_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class ButtonActionHistory extends StatefulWidget {
  final AdoptRequestModel adoptRequestModel;
  const ButtonActionHistory({super.key, required this.adoptRequestModel});

  @override
  State<ButtonActionHistory> createState() => _ButtonActionHistoryState();
}

class _ButtonActionHistoryState extends State<ButtonActionHistory> {
  final NewsController newsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return _buildActionButtons(request: widget.adoptRequestModel);
  }

  _buildActionButtons({required AdoptRequestModel request}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildAcceptButton(request: request),
        Dimens.width5,
        _buildRejectButton(request: request)
      ],
    );
  }

  _buildAcceptButton({required AdoptRequestModel request}){
    return ElevatedButton(
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
    );
  }

  _buildRejectButton({required AdoptRequestModel request}){
    return ElevatedButton(
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
    );
  }
}
