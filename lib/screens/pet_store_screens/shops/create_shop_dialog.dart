import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/dialog.dart';

class CreateShopDialog extends StatefulWidget {
  const CreateShopDialog({super.key});

  @override
  State<CreateShopDialog> createState() => _CreateShopDialogState();
}

class _CreateShopDialogState extends State<CreateShopDialog> {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopURLController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(
      title: 'Create New Shop',
      context: context,
      onSubmitFunction: () {},
      widget: Column(
        children: <Widget>[
          TextField(
            controller: shopNameController,
            decoration: InputDecoration(label: AppText(content: 'Shop Name')),
          ),
          TextField(
            controller: shopURLController,
            decoration: InputDecoration(label: AppText(content: 'Shop Image')),
          ),
        ],
      ),
    );
  }
}
