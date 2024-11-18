import 'package:dio/dio.dart';
import 'package:news_59/core/network/apiConstant.dart';
import 'package:news_59/features/home/model/newsmode.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }
    _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl))
      ..interceptors.add(PrettyDioLogger(
          request: true, requestBody: true,
          error: true, responseBody: true));
    return _dio!;
  }

  Future<NewsResponse> fetchTopheadline() async {
    try {
      var response = await dio.get(ApiConstant.topHeadlindsEndpoint,
          queryParameters: {"apiKey": ApiConstant.apiKey, "country": "us"});
      if (response.statusCode == 200) {
        return NewsResponse.fromJson(response.data);
      } else {
        throw Exception(" is Feailer Api Topheadline ${response.statusCode} ");
      }
    } catch (e) {
      throw Exception(" Api service Eroor  ${e.toString()} ");
    }
  }
}
