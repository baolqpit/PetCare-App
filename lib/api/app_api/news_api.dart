import 'package:petcare_app_management/api/base_api/base_api.dart';

class NewsApi extends BaseApi {
  NewsApi() : super();
  final GET_LIST_NEWS = 'News/GetListNews';
  final CREATE_NEWS = 'News/CreateNews';



  ///GET NEWS
  getNews(){
    return BaseApi().getPetCareAppDataFromAPI(url: GET_LIST_NEWS);
  }

  ///CREATE NEWS
  createNews({required Map<String, dynamic> data}) {
    return BaseApi().postPetCareAppDataFromAPI(url: CREATE_NEWS, data: data);
}

}