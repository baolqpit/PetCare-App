import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/helper/shared_preferences_helper.dart';
import 'package:petcare_app_management/screens/setting_screens/setting_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final AppController appController = Get.find();
  final UserController userController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CustomAppBar(title: 'Hi, ${userController.userInfo.value!.firstName} ${userController.userInfo.value!.lastName!}', showReturnButton: true),
          body: userController.userInfo.value == null
              ? LoadingScreen()
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimens.padding_vertical,
                        horizontal: Dimens.padding_horizontal),
                    child: _buildPersonalContent(),
                  ),
                ),
        ));
  }

  _buildPersonalContent() {
    return Column(
      children: <Widget>[
        _buildPersonalInfoSession(),
        Dimens.height10,
        _buildSetting(),
      ],
    );
  }

  _buildPersonalInfoSession() {
    return Container(
      child: Column(
        children: [_buildUserAvatar(), _buildUserInfo()],
      ),
    );
  }

  _buildUserAvatar() {
    return SvgPicture.asset(
      Images.home_page_svg,
      width: 200,
      height: 200,
    );
  }

  _buildUserInfo() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.phone),
          title: AppText(
            content: userController.userInfo.value!.phone,
          ),
        ),
        ListTile(
          leading: Icon(Icons.email),
          title: AppText(
            content: userController.userInfo.value!.email,
          ),
        ),
        ListTile(
          leading: Icon(Icons.location_city),
          title: AppText(
            content: userController.userInfo.value!.address,
          ),
        )
      ],
    );
  }

  _buildSetting() {
    return Container(
      padding: const EdgeInsets.all(Dimens.padding_horizontal),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        leading: SvgPicture.asset(
          Images.setting_svg,
          width: 50,
          height: 50,
        ),
        title: AppText(
          content: 'Setting',
          color: AppColor.white,
          fontWeight: FontWeight.bold,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.arrow_forward_sharp,
            color: AppColor.white,
          ),
          onPressed: () => Get.to(() => SettingScreen()),
        ),
      ),
    );
  }
}
