import 'package:flutter/material.dart';
import 'package:petcare_app_management/constants/Constants.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

import '../../share/Dimens/dimens.dart';

class ListButtonsFunction extends StatefulWidget {
  const ListButtonsFunction({super.key});

  @override
  State<ListButtonsFunction> createState() => _ListButtonsFunctionState();
}

class _ListButtonsFunctionState extends State<ListButtonsFunction> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      spacing: Dimens.sizeValue10,
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppColor.amber
          ),
          child: Column(
            children: <Widget>[
              AppText(content: 'Sale')
            ],
          ),
        )
      ],
    );
  }
}
