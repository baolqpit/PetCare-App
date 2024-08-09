import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/constants/Constants.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class PetTypeList extends StatefulWidget {
  const PetTypeList({super.key});

  @override
  State<PetTypeList> createState() => _PetTypeListState();
}

class _PetTypeListState extends State<PetTypeList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Constants.LIST_PET_TYPE
            .map((petType) => Padding(
              padding: EdgeInsets.only(right: Dimens.sizeValue10),
              child: Stack(
                    children: <Widget>[
                      _buildBoxShadow(),
                      _buildPetTypeComponent(petType: petType)
                    ],
                  ),
            ))
            .toList(),
      ),
    );
  }

  _buildBoxShadow() {
    return Positioned.fill(
      child: Container(
        height: 120,
        width: Get.width / Constants.LIST_PET_TYPE.length,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.circular12),
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ]),
      ),
    );
  }

  _buildPetTypeComponent({required dynamic petType}) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColor.colorBorderContainer),
                borderRadius: BorderRadius.circular(Dimens.circular10)),
            height: 120,
            width: Get.width / Constants.LIST_PET_TYPE.length,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.circular10),
              child: Image.network(
                petType['url'],
                fit: BoxFit.cover,
              ),
            )),
        AppText(content: petType['title'], color: AppColor.colorBorderContainer, fontWeight: FontWeight.bold,)
      ],
    );
  }
}
