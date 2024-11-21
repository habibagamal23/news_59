import 'package:dio/dio.dart';
import 'package:news_59/core/network/apiConstant.dart';
import 'package:news_59/features/home/model/weatherModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APiService {
  Dio? _dio;

  Dio get getDioObj {
    if (_dio != null) {
      return _dio!;
    }
    _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl))
      ..interceptors.add(PrettyDioLogger(
          responseBody: true, request: true, requestBody: true, error: true));
    return _dio!;
  }

  // fun get current weather

  Future<Weather> getCurrentWeather(String cuntry) async {
    try {
      var responese = await getDioObj.get(ApiConstant.currentweatherEndpoint,
          queryParameters: {'key': ApiConstant.apiKey, 'q': cuntry});
      if (responese.statusCode == 200) {
        return Weather.fromJson(responese.data);
      } else {
        throw Exception("my current weather error ${responese.statusCode}");
      }
    } catch (e) {
      throw Exception("my get weather error ${e.toString()}");
    }
  }
}
