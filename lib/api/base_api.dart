import 'package:dio/dio.dart';

class BaseApi {
  final Dio _dio = Dio();
  final _baseUrl = "http://10.0.2.2:5000/api/";

  ///GET APP DATA FOR ALL THE API
  getPetCareAppDataFromAPI(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      print(_baseUrl + url);
      Response<dynamic> response = await _dio.get(_baseUrl + url,
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
}
