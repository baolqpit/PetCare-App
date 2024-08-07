import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';
import 'package:petcare_app_management/screens/pet_store_screens/products/build_shop_list_product.dart';
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
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[_buildTabBar(), Expanded(child: _buildTabView())],
      ),
    );
  }

  _buildTabBar() {
    return TabBar(controller: tabController, tabs: [
      Tab(
        child: AppText(content: 'Product'),
      ),
      Tab(
        child: AppText(content: 'Services'),
      ),
    ]);
  }

  _buildTabView() {
    return TabBarView(
        controller: tabController,
        children: [Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.padding_vertical, horizontal: Dimens.padding_horizontal),
          child: BuildShopListProduct(shopModel: widget.shopModel,),
        ), AppText(content: '2')]);
  }
}
