import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSettingContent(),
      appBar: CustomAppBar(title: "Setting", showReturnButton: true,),
    );
  }

  _buildSettingContent(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_horizontal, vertical: Dimens.padding_vertical),
      child: Column(
        children: <Widget>[
          _buildSettingRow(text: 'Policy', imgesURL: Images.policy_svg),
          Dimens.height15,
          _buildSettingRow(text: 'Language', imgesURL: Images.language_change_svg),
        ],
      ),
    );
  }

  _buildSettingRow({required String text, required String imgesURL}){
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_horizontal, vertical: Dimens.padding_vertical),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: AppColor.darkCyanGradient,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      color: AppColor.primary,
      borderRadius: BorderRadius.circular(Dimens.circular10),
      border: Border.fromBorderSide(BorderSide(color: AppColor.black))
    ),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(imgesURL, width: 30, height: 30,),
          Dimens.width10,
          Apptext(content: text, color: AppColor.white, fontWeight: FontWeight.bold,)
      ],
      ),
    );
  }
}
