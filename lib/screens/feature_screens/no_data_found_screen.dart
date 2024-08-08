import 'package:flutter/material.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class NoDataFoundScreen extends StatefulWidget {
  const NoDataFoundScreen({super.key});

  @override
  State<NoDataFoundScreen> createState() => _NoDataFoundScreenState();
}

class _NoDataFoundScreenState extends State<NoDataFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Images.no_data_found_jpeg),
        ElevatedButton(onPressed: (){}, child: AppText(content: 'Click to load again!', color: AppColor.white), style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary),)
      ],
    );
  }
}
