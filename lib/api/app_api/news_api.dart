import 'package:petcare_app_management/api/base_api/outside_api.dart';

class NewsApi extends OutsideApi {
  NewsApi() : super();
  final GET_TECH_CRUNCH_NEWS = 'top-headlines?sources=techcrunch&apiKey=64836ddde96947c7ba99d2359495968b';


  ///GET NEWS
  getNews() async {
    return OutsideApi().getDataFromNewsAPI(url: GET_TECH_CRUNCH_NEWS);
  }

}