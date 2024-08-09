import 'package:petcare_app_management/api/base_api/base_api.dart';

class NewsApi extends BaseApi {
  NewsApi() : super();
  final GET_LIST_NEWS = 'News/GetListNews';


  ///GET NEWS
  getNews() async {
    return BaseApi().getPetCareAppDataFromAPI(url: GET_LIST_NEWS);
  }

}