import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class ServicesPageview extends StatefulWidget {
  final ShopModel shopModel;
  const ServicesPageview({super.key, required this.shopModel});

  @override
  State<ServicesPageview> createState() => _ServicesPageviewState();
}

class _ServicesPageviewState extends State<ServicesPageview> {
  Rx<int> selectedIndex = Rx(0);

  @override
  void dispose() {
    // TODO: implement dispose
    selectedIndex.value = 0;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildServicesChoiceChip(),
        _buildShift(icon: Icons.sunny, label: 'Morning', color: AppColor.amber),
        _buildShift(icon: Icons.sunny_snowing, label: 'Evening', color: AppColor.colorBorderContainer),
      ],
    ));
  }

  _buildShift({required IconData icon, required String label, required Color color}){
    return Row(
      children: <Widget>[
        Icon(icon, color: color,),
        Dimens.width5,
        AppText(content: label, fontWeight: FontWeight.bold, textSize: Dimens.font_size_title,)
      ],
    );
  }

  getServicesName({required int serviceValue}) {
    const map = {1: 'Spa', 2: 'Injection', 3: 'Sitting'};
    return map[serviceValue] ?? "Not Found";
  }
  
  _buildServicesChoiceChip(){
    return Center(
      child: Wrap(
          spacing: Dimens.sizeValue10,
          children:
          List.generate(widget.shopModel.shopServices!.length, (int index) {
            return ChoiceChip(
              label: AppText(
                color: selectedIndex.value == index ? AppColor.white : AppColor.black,
                fontWeight: FontWeight.bold,
                content: getServicesName(
                    serviceValue: widget.shopModel.shopServices![index]),
              ),
              checkmarkColor: selectedIndex.value == index ? AppColor.white : AppColor.black,
              selectedColor: AppColor.colorContainerCyan,
              selected: selectedIndex.value == index,
              side: BorderSide(color: selectedIndex.value == index ? AppColor.colorContainerPink : AppColor.colorBorderContainer),
              onSelected: (bool selected) {
                if (selected) {
                  selectedIndex.value = index;
                }
              },
            );
          })),
    );
  }
}
