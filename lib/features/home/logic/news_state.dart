part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSucces extends NewsState {
  List<Article> articals;
  NewsSucces(this.articals);
}

final class NewsFauiler extends NewsState {
  final String msg;
  NewsFauiler(this.msg);
}
