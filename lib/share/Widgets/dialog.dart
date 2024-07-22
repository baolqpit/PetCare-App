import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

/// WARNING DIALOG
showAppWarningDialog({required BuildContext context, required String content}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Center(
                child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: AppText(
                      content: 'Okay',
                      color: AppColor.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary)))
          ],
          content: AppText(content: content),
          title: Center(
              child: AppText(
            content: 'WARNING',
            color: AppColor.amber,
            fontWeight: FontWeight.bold,
            textSize: Dimens.font_size_title,
          )),
        );
      });
}

///ERROR DIALOG
showAppErrorDialog({required BuildContext context, required String content}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Center(
                child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: AppText(
                      content: 'Okay',
                      color: AppColor.white,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary)))
          ],
          content: AppText(content: content),
          title: Center(
              child: AppText(
            content: 'ERROR',
            color: AppColor.red,
            fontWeight: FontWeight.bold,
            textSize: Dimens.font_size_title,
          )),
        );
      });
}

///SNACKBAR
showSnackBar({required BuildContext context, required String content}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: EdgeInsets.all(Dimens.padding_8),
    backgroundColor: AppColor.primary,
    content: AppText(content: content),
  ));
}
