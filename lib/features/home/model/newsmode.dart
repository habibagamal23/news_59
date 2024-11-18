
import 'ArticalModel.dart';

class NewsResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] ,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((article) => Article.fromJson(article as Map<String, dynamic>))
          .toList(),
    );
  }
}



