import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/controllers/pet_controller.dart';
import 'package:petcare_app_management/controllers/user_controller.dart';
import 'package:petcare_app_management/model/pet_model/pet_model.dart';
import 'package:petcare_app_management/screens/pet_screens/create_pet_screen.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Images/images.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';
import 'package:petcare_app_management/share/format/format.dart';

class UserPetsContainer extends StatefulWidget {
  const UserPetsContainer({super.key});

  @override
  State<UserPetsContainer> createState() => _UserPetsContainerState();
}

class _UserPetsContainerState extends State<UserPetsContainer> {
  final AppController appController = Get.find();
  final UserController userController = Get.find();
  final PetController petController = Get.find();
  @override
  void initState() {
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
    return Obx(() => petController.listPets.isEmpty
        ? _buildPetEmptyContainer()
        : _buildListPetCarousel());
  }

  _buildPetEmptyContainer() {
    return Stack(
      children: <Widget>[
        _buildBoxShadow(),
        _buildEmptyPetComponent(),
      ],
    );
  }

  _buildListPetCarousel() {
    return CarouselSlider(
        items: petController.listPets
            .map((pet) => Builder(builder: (BuildContext context) {
          return Stack(
            children: <Widget>[
              _buildBoxShadow(),
              _buildPetComponent(pet: pet!)
            ],
          );
        }))
            .toList(),
        options: CarouselOptions(
          height: 100,
          onPageChanged: (index, reason) {
            petController.petCurrentCarousel.value = index;
          },
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: petController.listPets.length > 1 ? true : false,
          reverse: false,
          autoPlay: petController.listPets.length > 1 ? true : false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }

  _buildPetComponent({required PetModel pet}){
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.padding_8, vertical: Dimens.padding_5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.circular12),
          color: AppColor.white,
          border: const Border.fromBorderSide(
              BorderSide(color: AppColor.colorBorderContainer, width: 2.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildPetLogo(imgURL: Images.no_pet_found_jpeg),
            _buildPetInfo(pet: pet)
          ],
        ));
  }

  _buildPetInfo({required PetModel pet}){
    return Column(
      children: <Widget>[
        AppText(content: pet.petName, color: AppColor.primary, fontWeight: FontWeight.bold, textSize: Dimens.font_size_title,),
        Row(
          children: [
            SvgPicture.asset(Images.birthday_cake, width: 30, height: 30,),
            Dimens.width5,
            AppText(content: formatToBirthday(datetime: pet.petBirthday!), color: AppColor.colorTextCyan,),
          ],
        )
      ],
    );
  }

  _buildBoxShadow() {
    return Positioned.fill(
      child: Container(
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

  _buildEmptyPetComponent() {
    return GestureDetector(
      onTap: () => Get.to(() => const CreatePetScreen()),
      child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.padding_8, vertical: Dimens.padding_5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.circular12),
            color: AppColor.colorContainerCyan,
            border: const Border.fromBorderSide(
                BorderSide(color: AppColor.colorBorderContainer, width: 2.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildPetLogo(imgURL: Images.no_pet_found_jpeg),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.warning,
                        color: AppColor.amber,
                      ),
                      Dimens.width5,
                      AppText(
                        content: 'No Pet',
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  AppText(
                    content: 'Press here to create pet profile',
                    color: AppColor.black,
                  )
                ],
              )
            ],
          )),
    );
  }

  _buildPetLogo({required String imgURL}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: AppColor.primary,
      child: ClipOval(
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            imgURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
