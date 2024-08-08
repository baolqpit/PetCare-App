import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/pet_model/pet_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/Widgets/custom_app_bar.dart';
import 'package:petcare_app_management/share/format/format.dart';

class CreatePetScreen extends StatefulWidget {
  const CreatePetScreen({super.key});

  @override
  State<CreatePetScreen> createState() => _CreatePetScreenState();
}

class _CreatePetScreenState extends State<CreatePetScreen> {
  final UserController userController = Get.find();
  final PetController petController = Get.find();
  Rx<int> petTypeId = Rx<int>(1);
  TextEditingController petNameController = TextEditingController();
  TextEditingController petAgeController = TextEditingController();
  TextEditingController petBirthdayController = TextEditingController();
  TextEditingController petImageURLController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    petNameController.clear();
    petAgeController.clear();
    petBirthdayController.clear();
    petImageURLController.clear();
    petTypeId.value = 1;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '', showReturnButton: true),
      body: _buildCreatePetBody(),
    );
  }

  _buildCreatePetBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.padding_horizontal,
          vertical: Dimens.padding_vertical),
      child: Column(
        children: <Widget>[
          _buildTextField(controller: petNameController, label: 'Pet Name'),
          _buildTextField(
              controller: petAgeController, label: 'Pet Age', isNumeric: true),
          _buildTextField(
              controller: petBirthdayController, label: 'Pet Birthday'),
          _buildTextField(
              controller: petImageURLController, label: 'Pet Avatar'),
          _buildPetTypeRadioButtons(),
          _buildCreatePetButton()
        ],
      ),
    );
  }

  _buildPetTypeRadioButtons(){
    return Obx(() => Row(
      children: <Widget>[
        AppText(content: 'Dog'),
        Radio(value: 1, groupValue: petTypeId.value, onChanged: (value){
          value != null ? petTypeId.value = value : null;
        }),
        AppText(content: 'Cat'),
        Radio(value: 2, groupValue: petTypeId.value, onChanged: (value){
          value != null ? petTypeId.value = value : null;
        }),
      ],
    ));
  }

  _buildTextField(
      {required TextEditingController controller,
      required String label,
      bool? isNumeric}) {
    return Column(
      children: [
        TextField(
          keyboardType: isNumeric != null ? TextInputType.number : null,
          controller: controller,
          decoration: InputDecoration(
              label: AppText(
            content: label,
            fontWeight: FontWeight.bold,
            color: AppColor.colorTextCyan,
            textSize: Dimens.font_size_title,
          )),
        ),
        Dimens.height10
      ],
    );
  }

  _buildCreatePetButton() {
    return ElevatedButton(
      onPressed: () async {
        PetModel petModel = PetModel(
          petName: petNameController.text,
          petAge: int.parse(petAgeController.text),
          petBirthday: petBirthdayController.text,
          petImgURL: petImageURLController.text,
          petTypeId: petTypeId.value,
          petTypeName: petTypeId.value == 1 ? "Dog" : "Cat",
          petAlbumn: []
        );
        await petController.createNewPet(petModel: petModel);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.submitColor,
          side: const BorderSide(color: AppColor.colorBorderContainer)),
      child: AppText(
        content: 'Create',
        fontWeight: FontWeight.bold,
        color: AppColor.colorTextCyan,
      ),
    );
  }
}
