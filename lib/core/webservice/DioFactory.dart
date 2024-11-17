import 'package:dio/dio.dart';
import 'package:news_59/features/home/model/Artical/ArticalModel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'constantApi.dart';

class NewsService {
  Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
    ))
      ..interceptors.add(PrettyDioLogger(
        responseBody: true,
        requestBody: true,
        error: true,
        request: true,
      ));
    return _dio!;
  }

  Future<List<Article>> fetchTopHeadlines() async {
    try {
      final response = await dio.get(
        ApiConstants.topHeadLine,
        queryParameters: {
          'country': 'us',
          'apiKey': ApiConstants.apiKey,
        },
      );
      if (response.statusCode == 200) {
        final List<dynamic> articles = response.data['articles'];
        return articles.map((artical) => Article.fromJson(artical)).toList();
      } else {
        throw Exception('Failed to fetch top headlines');
      }
    } catch (e) {
      throw Exception('Error fetching top headlines: $e');
    }
  }
}
