import 'package:get/get.dart';
import 'package:petcare_app_management/api/app_api/pet_store_api.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/model/pet_store_model/product_model/product_model.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';

class PetStoreController extends GetxController {
  final AppController appController = Get.find();
  Rx<int> currentCarousel = Rx<int>(0);
  RxList<ProductModel?> productList = RxList<ProductModel?>([]);
  Rx<ShopModel?> shop = Rx<ShopModel?>(null);
  RxList<ProductModel?> productListInShop = RxList<ProductModel?>([]);

  ///GET LIST PRODUCTS
  getListProducts() async {
    appController.isLoading.value = true;
    var response = await PetStoreApi().getProductsList();
    productList.value = response
        .map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
    appController.isLoading.value = false;
  }

  ///GET LIST PRODUCTS IN SHOP
  getListProductsInShop({required int shopId}) async {
    appController.isLoading.value = true;
    var response = await PetStoreApi().getProductsListInShop(shopId: shopId);
    productListInShop.value = response
        .map<ProductModel>((json) => ProductModel.fromJson(json))
        .toList();
    appController.isLoading.value = false;
  }

  ///CREATE SHOP
  createNewShop() async {
    appController.isLoading.value = true;
    Map<String, dynamic> data = {

    };
    await PetStoreApi().createNewShop(data: data);
    appController.isLoading.value = false;
  }

}
