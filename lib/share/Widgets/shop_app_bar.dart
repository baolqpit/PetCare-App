import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ShopModel shopModel;

  const ShopAppBar({super.key, required this.shopModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          _buildBackGround(),
          _buildShopInfo(),
        ],
      ),
    );
  }

  _buildBackGround() {
    return Container(
      width: Get.width,
      child: Stack(
        children: [
          Image.network(
            'https://okcredit-blog-images-prod.storage.googleapis.com/2021/04/petshop1.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  _buildShopInfo() {
    return Container(
      padding: EdgeInsets.all(Dimens.padding_8),
      child: Column(
        children: <Widget>[
          _buildTaskBar(),
          Dimens.height10,
          Row(
            children: <Widget>[
              _buildShopLogo(),
              Dimens.width10,
              Expanded(child: _buildShopDetail()),
              _buildShopActionButtons(),
            ],
          )
        ],
      ),
    );
  }

  _buildShopLogo() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.black,
      child: ClipOval(
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(
            'https://okcredit-blog-images-prod.storage.googleapis.com/2021/04/petshop1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


  _buildShopDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppText(
          content: this.shopModel.shopName,
          color: AppColor.white,
          fontWeight: FontWeight.bold,
          textSize: Dimens.font_size_title,
        ),
        Dimens.height5,
        Row(
          children: [
            _buildShopRating(),
            VerticalDivider(),
            _buildShopFollower(),
          ],
        )
      ],
    );
  }

  _buildShopRating() {
    return Container(
      padding: EdgeInsets.all(Dimens.sizeValue2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.circular10),
          color: AppColor.black.withOpacity(0.5)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: AppColor.amber,
          ),
          Dimens.width5,
          AppText(
            content: '4.5/5.0',
            color: AppColor.white,
          )
        ],
      ),
    );
  }

  _buildShopFollower() {
    return AppText(
      content: '9,5k Followers',
      color: AppColor.white,
    );
  }

  _buildTaskBar() {
    return Row(
      children: <Widget>[
        IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.white,
            )),
        Expanded(
            child: Container(
          padding: EdgeInsets.only(left: Dimens.padding_5),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(Dimens.sizeValue10)),
          child: TextField(
            style: TextStyle(color: AppColor.white),
            decoration: InputDecoration(
                hintStyle: TextStyle(color: AppColor.white),
                hintText: 'Search Products',
                icon: Icon(
                  Icons.search,
                  color: AppColor.white,
                )),
          ),
        )),
      ],
    );
  }

  _buildShopActionButtons() {
    return Column(
      children: [
        _buildButtonAction(buttonName: 'Follow', iconData: Icons.add),
        Dimens.height5,
        _buildButtonAction(buttonName: 'Chat', iconData: Icons.chat_rounded)
      ],
    );
  }

  _buildButtonAction({required String buttonName, required IconData iconData}) {
    return Container(
      padding: EdgeInsets.all(Dimens.sizeValue5),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColor.white))),
      child: Row(
        children: [
          Icon(
            size: Dimens.font_size_min,
            iconData,
            color: AppColor.white,
          ),
          Dimens.width5,
          AppText(
            content: buttonName,
            color: AppColor.white,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(140);
}
