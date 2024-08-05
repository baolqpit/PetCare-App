import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/constants/Constants.dart';
import 'package:petcare_app_management/controllers/pet_store_controller.dart';

import '../../../share/Dimens/dimens.dart';

class PetStoreCarouselSlider extends StatefulWidget {
  const PetStoreCarouselSlider({super.key});

  @override
  State<PetStoreCarouselSlider> createState() => _PetStoreCarouselSliderState();
}

class _PetStoreCarouselSliderState extends State<PetStoreCarouselSlider> {
  final CarouselController carouselController = CarouselController();
  final PetStoreController petStoreController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        Container(
          child: CarouselSlider(
              carouselController: carouselController,
              items: Constants.LIST_CAROUSEL_URL
                  .map((url) => Builder(builder: (BuildContext context) {
                return Container(
                  child: Image.network(url),
                );
              }))
                  .toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason){
                  petStoreController.currentCarousel.value = index;
                },
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: Constants.LIST_CAROUSEL_URL.map((url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(vertical: Dimens.padding_horizontal, horizontal: Dimens.sizeValue2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: petStoreController.currentCarousel.value == Constants.LIST_CAROUSEL_URL.indexOf(url)
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    ));
  }
}
