import 'package:petcare_app_management/api/base_api/base_api.dart';

class NewsApi extends BaseApi {
  NewsApi() : super();
  final GET_LIST_NEWS = 'News/GetListNews';
  final CREATE_NEWS = 'News/CreateNews';
  final CREATE_ADOPT_REQUEST = 'News/CreateAdoptRequest';
  final GET_ADOPT_REQUEST = 'News/GetAdoptRequestByUserId';
  final UPDATE_ADOPT_REQUEST = 'News/UpdateAdoptRequest';

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

  ///GET ADOPT REQUESTS
  getAdoptRequests({required int userId}){
    var param = {
      'userId': userId
    };
    return BaseApi().getPetCareAppDataFromAPI(url: GET_ADOPT_REQUEST, queryParameters: param);
  }

  ///UPDATE ADOPT REQUESTS
  updateAdoptRequest({required Map<String, dynamic> data, required int adoptRequestId}){
    var param = {
      "AdoptRequestId": adoptRequestId
    };
    return BaseApi().putPetCareAppDataFromApi(url: UPDATE_ADOPT_REQUEST, queryParameters: param, data: data);
  }
}
