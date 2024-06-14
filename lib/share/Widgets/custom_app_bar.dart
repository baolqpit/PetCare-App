import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  bool showReturnButton;
  final double borderRadius; // Added to control corner radius

  CustomAppBar({
    required this.title,
    required this.showReturnButton,
    this.borderRadius = 16.0, // Default corner radius
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary[300],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_horizontal, vertical: Dimens.padding_vertical),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showReturnButton
                ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back, color: AppColor.white),
            )
                : SizedBox(),
            Expanded(
              child: Center(
                child: Apptext(
                  content: title ?? "",
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                  textSize: Dimens.font_size_title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}