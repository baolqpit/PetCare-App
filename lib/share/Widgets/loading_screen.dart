import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';

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
                child: Image.asset("lib/assets/AppLogo/app_logo.jpg", width: 100, height: 100, )))));
  }
}
