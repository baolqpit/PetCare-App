import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/helper/shared_preferences_helper.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
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
    return Obx(() => userController.userInfo.value == null
        ? LoadingScreen()
        : SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: Dimens.padding_vertical,
                  horizontal: Dimens.padding_horizontal),
              child: _buildPersonalContent(),
            ),
          ));
  }

  _buildPersonalContent() {
    return Column(
      children: <Widget>[
        _buildPersonalInfoSession(),
        Dimens.height10,
        _buildPersonalPetSession(),
        Dimens.height10,
        _buildPersonalActivitiesHistory(),
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
          leading: Icon(Icons.person),
          title: AppText(
            content: userController.userInfo.value!.firstName! +
                " " +
                userController.userInfo.value!.lastName!,
          ),
        ),
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

  _buildPersonalPetSession() {
    return Container(
      padding: EdgeInsets.all(Dimens.padding_horizontal),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        leading: SvgPicture.asset(
          Images.personal_pet,
          width: 50,
          height: 50,
        ),
        title: AppText(
          content: 'Your Pets',
          color: AppColor.white,
          fontWeight: FontWeight.bold,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_sharp,
            color: AppColor.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  _buildPersonalActivitiesHistory() {
    return Container(
      padding: EdgeInsets.all(Dimens.padding_horizontal),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        leading: SvgPicture.asset(
          Images.activities_history_svg,
          width: 50,
          height: 50,
        ),
        title: AppText(
          content: 'Activities History',
          color: AppColor.white,
          fontWeight: FontWeight.bold,
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_sharp,
            color: AppColor.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
