import 'dart:convert';

import 'package:petcare_app_management/api/base_api/base_api.dart';

class PetStoreApi extends BaseApi{
  PetStoreApi() : super();
  final GET_PET_STORE_DETAIL = '';
  final GET_SHOPS = 'Shop/GetShops';
  final CREATE_NEW_SHOP = 'Shop/CreateNewShop';
  final GET_PRODUCTS_LIST = 'Product/GetProductsList';
  final GET_PRODUCT_LIST_IN_SHOP = 'Product/GetProductsListInShop';
  final CREATE_NEW_PRODUCT = 'Product/CreateNewProduct';

  ///GET SHOP DETAIL
  getShopDetail({required int shopId}){
    var params = {
      'shopId': shopId
    };
    return BaseApi().getPetCareAppDataFromAPI(url: GET_PET_STORE_DETAIL, queryParameters: params);
  }
  
  ///GET LIST SHOP
  getListShop(){
    return BaseApi().getPetCareAppDataFromAPI(url: GET_SHOPS);
  }
  
  ///CREATE NEW SHOP
  createNewShop({required Map<String, dynamic> data}){
    return BaseApi().postPetCareAppDataFromAPI(url: CREATE_NEW_SHOP, data: data);
  }
  
  ///GET PRODUCTS LIST
  getProductsList(){
    return BaseApi().getPetCareAppDataFromAPI(url: GET_PRODUCTS_LIST);
  }

  ///GET PRODUCTS LIST IN SHOP
  getProductsListInShop({required int shopId}){
    var param = {
      'ShopId': shopId
    };
    return BaseApi().getPetCareAppDataFromAPI(url: GET_PRODUCT_LIST_IN_SHOP, queryParameters: param);
  }

  ///CREATE NEW PRODUCT
  createNewProduct({required Map<String, dynamic> data}){
    return BaseApi().postPetCareAppDataFromAPI(url: CREATE_NEW_PRODUCT, data: data);
  }
}