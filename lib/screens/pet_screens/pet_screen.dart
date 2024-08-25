import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Images/images.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  final PetController petController = Get.find();
  final UserController userController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
      await petController.getListPets(userId: userController.userInfo.value!.userId!);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.primary
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.padding_horizontal, vertical: Dimens.padding_vertical),
        child: Column(
          children: <Widget>[
            _buildPetInfoContainer(),
            _buildPetAlbumn()
          ],
        ),
      ),
    );
  }

  _buildPetInfoContainer(){
    return Container(
      decoration: BoxDecoration(

      ),
    );
  }

  _buildPetAlbumn(){
    return Container();
  }
}
