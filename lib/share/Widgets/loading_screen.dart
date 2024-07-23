import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

import '../Colors/app_color.dart';
import '../Images/images.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final AppController appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(
        visible: appController.isLoading.value,
        child: Container(
            color: AppColor.white,
            child: Center(
                child: LottieBuilder.asset(Images.loading_lottie,width: 200, height: 200, )))));
  }
}
