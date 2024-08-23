import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/constants/Constants.dart';
import 'package:petcare_app_management/controllers/news_controller.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class PetTypeList extends StatefulWidget {
  const PetTypeList({super.key});

  @override
  State<PetTypeList> createState() => _PetTypeListState();
}

class _PetTypeListState extends State<PetTypeList> {
  final NewsController newsController = Get.find();
  List<dynamic> petTypesList = [
    {'Title': 'Dog', 'ImageString': Images.dog_type_svg},
    {'Title': 'Cat', 'ImageString': Images.cat_type_svg},
    {'Title': 'Bird', 'ImageString': Images.bird_type_svg},
    {'Title': 'Fish', 'ImageString': Images.fish_type_svg},
    {'Title': 'Another', 'ImageString': Images.another_type_svg},
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: petTypesList
            .map((petType) => Padding(
          padding: const EdgeInsets.only(right: Dimens.sizeValue10),
          child: GestureDetector(
            onTap: () => petTypeOnTap(petType: petType),
            child: Container(
              width: MediaQuery.of(context).size.width / petTypesList.length - Dimens.sizeValue10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.circular50),
                  color: newsController.currentPetTypeIndex.value == petTypesList.indexOf(petType) ? AppColor.colorContainerPink :AppColor.lightGrey),
              padding: const EdgeInsets.all(Dimens.padding_horizontal),
              child: _buildPetTypeDescription(petType: petType),
            ),
          ),
        ))
            .toList(),
      ),
    ));
  }

  _buildPetTypeDescription({required dynamic petType}) {
    return Column(
      children: <Widget>[
        _buildIconContainer(petType: petType),
        Dimens.height10,
        AppText(
          content: petType['Title'],
          maxLine: 1,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }

  _buildIconContainer({required dynamic petType}) {
    return Container(
      padding: const EdgeInsets.all(8), // Add padding around the icon
      decoration: const BoxDecoration(
        color: Colors.white, // Set the background color to white
        shape: BoxShape.circle, // Make the background circular
      ),
      child: ClipOval(
        child: SvgPicture.asset(
          petType['ImageString'],
          width: 30,
          height: 30,
        ),
      ),
    );
  }

  petTypeOnTap({required dynamic petType}) async {
    await newsController.getNews();
      if (newsController.currentPetTypeIndex.value == petTypesList.indexOf(petType)){
        newsController.currentPetTypeIndex.value = -1;
        await newsController.getNews();
      } else {
        await newsController.getNews();
        newsController.currentPetTypeIndex.value = petTypesList.indexOf(petType);
        newsController.listNews.value = newsController.listNews.where((news) => news.abandonAnimalTypeId == newsController.currentPetTypeIndex.value + 1).toList();
      }
    }
}
