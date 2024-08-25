import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/pet_model/pet_model.dart';
import 'package:petcare_app_management/screens/feature_screens/no_data_found_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Functions/functions.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/loading_screen.dart';
import 'package:petcare_app_management/share/format/format.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  final AppController appController = Get.find();
  final PetController petController = Get.find();
  final UserController userController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    onWidgetBuildDone(() async {
      await petController.getListPets(
          userId: userController.userInfo.value!.userId!);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    petController.listPets.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => appController.isLoading.value
        ? const LoadingScreen()
        : Container(
            decoration: const BoxDecoration(color: AppColor.primary),
            child: petController.listPets.isEmpty
                ? const Center(child: NoDataFoundScreen())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.padding_horizontal,
                        vertical: Dimens.padding_vertical),
                    child: PageView(
                      onPageChanged: (pageNumber) {
                        print(pageNumber);
                      },
                      children: petController.listPets
                          .map<Widget>((pet) => _buildPetInforPage(pet: pet!))
                          .toList(),
                    ),
                  ),
          ));
  }

  _buildPetInforPage({required PetModel pet}) {
    return Column(
      children: <Widget>[
        _buildPetInforContainer(pet: pet),
        _buildPetAlbumn(pet: pet),
      ],
    );
  }

  _buildPetInforContainer({required PetModel pet}) {
    return Container(
      padding: const EdgeInsets.all(Dimens.padding_8),
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(Dimens.circular5)
      ),
      child: Row(
        children: [
          _buildPetAvatar(imgURL: pet.petImgURL!),
          _buildPetInfoDescription(pet: pet)
          
        ],
      ),
    );
  }

  _buildPetAvatar({required String imgURL}) {
    return Image.network(
      width: 200, height: 200,
      fit: BoxFit.cover,
        'https://scontent.fsgn24-1.fna.fbcdn.net/v/t39.30808-6/326721111_698833901734548_9001580760964871690_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFL0r6AUXubU9hGuy2vqixZZAnGK5_JXbxkCcYrn8ldvMydc2yNh_84kWZur3hcsUYkQRK8bQLuzWCDreMvLTcI&_nc_ohc=fP6t-xV_Fw4Q7kNvgHX4iyG&_nc_ht=scontent.fsgn24-1.fna&cb_e2o_trans=t&oh=00_AYAe06ISpeNtqRg4yr9dqJ2YqieQUGHkqFK7GeldIsqk1w&oe=66D1178E');
  }
  
  _buildPetInfoDescription({required PetModel pet}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(content: pet.petName, fontWeight: FontWeight.bold, textSize: Dimens.font_size_title,),
        AppText(content: formatToBirthday(datetime: pet.petBirthday!)),
        AppText(content: pet.petTypeName),
      ],
    );
  }

  _buildPetAlbumn({required PetModel pet}) {
    return Container();
  }
}
