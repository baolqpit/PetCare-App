import 'package:get/get.dart';
import 'package:petcare_app_management/api/app_api/pet_store_api.dart';
import 'package:petcare_app_management/controllers/app_controller.dart';
import 'package:petcare_app_management/model/pet_store_model/product_model/product_model.dart';
import 'package:petcare_app_management/model/pet_store_model/shop_model/shop_model.dart';

class PetStoreController extends GetxController {
  final AppController appController = Get.find();
  Rx<int> currentCarousel = Rx<int>(0);
  RxList<ProductModel?> productList = RxList<ProductModel?>([]);
  RxList<ShopModel> listShops = RxList<ShopModel>([]);
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

  ///CREATE NEW PRODUCT
  createNewProduct({required ProductModel productModel, required int shopId}) async {
    appController.isLoading.value = true;
    Map<String, dynamic> data = {
      'productName': productModel.productName,
      'shopId': shopId,
      'quantity': productModel.quantity,
      'price': productModel.price,
      'productTypeId': productModel.productTypeId,
      'productTypeName': productModel.productTypeName,
      'productImgURL': productModel.productImgURL
    };
    await PetStoreApi().createNewProduct(data: data);
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
  createNewShop({required ShopModel shopModel}) async {
    appController.isLoading.value = true;
    Map<String, dynamic> data = {
      'shopName': shopModel.shopName,
      'shopImgURL': shopModel.shopImgURL,
      'city': shopModel.city,
      'phone': shopModel.phone,
      'shopMail': shopModel.shopMail,
      'shopServices': shopModel.shopServices
    };
    await PetStoreApi().createNewShop(data: data);
    appController.isLoading.value = false;
  }

  ///GET SHOPS
  getShops() async{
    appController.isLoading.value = true;
    var response = await PetStoreApi().getListShop();
    listShops.value = response.map<ShopModel>((json) => ShopModel.fromJson(json)).toList();
    print(listShops);
    appController.isLoading.value = false;
  }

  ///REGIST SHOP SERVICES
  registShopServices({required bool spaService, required bool injectionService, required sittingService}){
    List<int> services = [];
    if (spaService) {
      services.add(1);
    }
    if (injectionService) {
      services.add(2);
    }
    if (sittingService){
      services.add(3);
    }
    return services;
  }
}
