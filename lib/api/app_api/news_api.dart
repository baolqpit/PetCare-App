import 'package:flutter/cupertino.dart';
import 'package:petcare_app_management/api/base_api/base_api.dart';

class NewsApi extends BaseApi {
  NewsApi() : super();
  final GET_LIST_NEWS = 'News/GetListNews';
  final CREATE_NEWS = 'News/CreateNews';
  final CREATE_ADOPT_REQUEST = 'News/CreateAdoptRequest';
  final GET_ADOPT_REQUEST_RECEIVE = 'News/GetListAdoptRequestInListUserNews';
  final GET_ADOPT_REQUEST_SEND = 'News/GetListAdoptRequestSendByAppUser';
  final UPDATE_ADOPT_REQUEST = 'News/UpdateAdoptRequest';
  final DELETE_NEWS = 'News/DeleteNewsByNewsId';

  ///GET NEWS
  getNews() {
    return BaseApi().getPetCareAppDataFromAPI(url: GET_LIST_NEWS);
  }

  ///CREATE NEWS
  createNews({required Map<String, dynamic> data}) {
    return BaseApi().postPetCareAppDataFromAPI(url: CREATE_NEWS, data: data);
  }

  ///CREATE ADOPT REQUEST
  createAdoptRequest({required Map<String, dynamic> data}){
    return BaseApi().postPetCareAppDataFromAPI(url: CREATE_ADOPT_REQUEST, data: data);
  }

  ///GET LIST ADOPT REQUESTS RECEIVE
  getAdoptRequestsReceive({required int userId}){
    var param = {
      'shopId': userId
    };
    return BaseApi().getPetCareAppDataFromAPI(url: GET_ADOPT_REQUEST_RECEIVE, queryParameters: param);
  }


  ///GET LIST ADOPT REQUESTS RECEIVE
  getAdoptRequestsSend({required int userId}){
    var param = {
      'userId': userId
    };
    return BaseApi().getPetCareAppDataFromAPI(url: GET_ADOPT_REQUEST_SEND, queryParameters: param);
  }

  ///UPDATE ADOPT REQUESTS
  updateAdoptRequest({required Map<String, dynamic> data, required int adoptRequestId}){
    var param = {
      "AdoptRequestId": adoptRequestId
    };
    return BaseApi().putPetCareAppDataFromApi(url: UPDATE_ADOPT_REQUEST, queryParameters: param, data: data);
  }
  
  ///DELETE USER NEWS
  deleteUserNews({required int newsId}){
    var param = {
      'newsId': newsId
    };
    return BaseApi().deletePetCareAppDataFromApi(url: DELETE_NEWS, queryParameters: param);
  }
}
