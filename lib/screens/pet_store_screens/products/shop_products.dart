import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/screens/pet_store_screens/products/build_shop_list_product.dart';
import 'package:petcare_app_management/screens/pet_store_screens/services/services_pageview.dart';
import 'package:petcare_app_management/share/Colors/app_color.dart';
import 'package:petcare_app_management/share/Dimens/dimens.dart';
import 'package:petcare_app_management/share/Widgets/apptext.dart';

class ShopProducts extends StatefulWidget {
  final ShopModel shopModel;
  const ShopProducts({super.key, required this.shopModel});

  @override
  State<ShopProducts> createState() => _ShopProductsState();
}

class _ShopProductsState extends State<ShopProducts>
    with TickerProviderStateMixin {
  ScrollController productScrollController = ScrollController();
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    productScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_buildTabBar(), Expanded(child: _buildTabView())],
      ),
    );
  }

  _buildTabBar() {
    return TabBar(controller: tabController, indicatorColor: AppColor.primary, tabs: [
      Tab(
        child: AppText(content: 'Products'),
      ),
      Tab(
        child: AppText(content: 'Services'),
      ),
    ]);
  }

  _buildTabView() {
    return TabBarView(controller: tabController, children: [
      Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.padding_vertical,
            horizontal: Dimens.padding_horizontal),
        child: SingleChildScrollView(
          controller: productScrollController,
          child: BuildShopListProduct(
            shopModel: widget.shopModel,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
            vertical: Dimens.padding_vertical,
            horizontal: Dimens.padding_horizontal),
        child: ServicesPageview(shopModel: widget.shopModel,),
      )
    ]);
  }
}
