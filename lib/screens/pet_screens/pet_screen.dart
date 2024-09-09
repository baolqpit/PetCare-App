import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                          .map<Widget>((pet) => _buildPetInfoPage(pet: pet!))
                          .toList(),
                    ),
                  ),
          ));
  }

  _buildPetInfoPage({required PetModel pet}) {
    return Column(
      children: <Widget>[
        _buildPetInfoContainer(pet: pet),
        _buildPetAlbumn(pet: pet),
      ],
    );
  }

  _buildPetInfoContainer({required PetModel pet}) {
    return Container(
      margin: const EdgeInsets.only(top: Dimens.circular50),
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(Dimens.circular5)),
      child: SizedBox(
        height: 200,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              top: -60, // Adjust as needed
              left: (Get.width - 150) /
                  2, // Center horizontally based on avatar size
              child: _buildPetAvatarAndMainInfo(pet: pet),
            ),
            Positioned(
              child: _buildPetDescriptionContainer(pet: pet),
              bottom: 0,
              left: 0,
              right: 0,
            )
          ],
        ),
      ),
    );
  }

  _buildPetAvatarAndMainInfo({required PetModel pet}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.circular10),
          child: Image.asset(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              Images.no_data_found_jpeg),
        ),
        AppText(
          content: pet.petName,
          fontWeight: FontWeight.bold,
          textSize: Dimens.font_size_title,
          color: AppColor.white,
        ),
        AppText(
          content: "${pet.petAge} years old",
          color: AppColor.white,
        ),
      ],
    );
  }

  _buildPetDescriptionContainer({required PetModel pet}) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.padding_horizontal,
          vertical: Dimens.padding_vertical),
      decoration: const BoxDecoration(
          color: AppColor.colorContainerPink,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.circular12),
              topRight: Radius.circular(Dimens.circular12),
              bottomLeft: Radius.circular(Dimens.circular5),
              bottomRight: Radius.circular(Dimens.circular5))),
      child: Row(
        children: <Widget>[
          Expanded(
              child: _buildPetColumnExperience(
                  petData: formatToBirthday(datetime: pet.petBirthday!),
                  imgDataSVG: Images.birthday_cake,
                  title: "Birthday")),
          Dimens.width10,
          Expanded(
              child: _buildPetColumnExperience(
                  petData: pet.petTypeName!,
                  imgDataSVG: Images.pet_palm,
                  title: "Type"))
        ],
      ),
    );
  }

  _buildPetAlbumn({required PetModel pet}) {
    return Container();
  }

  _buildPetColumnExperience(
      {required String petData, required imgDataSVG, required String title}) {
    return Container(
      padding: const EdgeInsets.all(Dimens.padding_8),
      decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(Dimens.circular10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppText(
            content: petData,
            color: AppColor.white,
            textSize: Dimens.font_size_title,
            fontWeight: FontWeight.bold,
          ),
          Dimens.height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                imgDataSVG,
                width: 25,
                height: 25,
              ),
              Dimens.width10,
              AppText(
                content: title,
                color: AppColor.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}
