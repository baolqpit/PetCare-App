import 'package:dio/dio.dart';

class OutsideApi {
  final Dio _dio = Dio();
  final _newsURL = "https://newsapi.org/v2/";

  ///GET OUTSIDE API FOR ALL THE API
  getDataFromNewsAPI(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      await Future.delayed(Duration(milliseconds: 1500));
      Response<dynamic> response = await _dio.get(_newsURL + url,
          queryParameters: queryParameters ?? null,
          options: Options(contentType: 'application/json'));
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  ///POST OUTSIDE API FOR ALL THE API
  postDataFromNewsAPI(
      {required String url, Map<String, dynamic>? data}) async {
    try {
      await Future.delayed(Duration(milliseconds: 1500));
      Response<dynamic> response = await _dio.post(_newsURL + url,
          data: data ?? null,
          options: Options(contentType: 'application/json'));
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}