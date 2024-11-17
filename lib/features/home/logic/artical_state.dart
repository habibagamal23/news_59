part of 'artical_cubit.dart';

@immutable
sealed class ArticalState {}

final class ArticalInitial extends ArticalState {}

final class ArticalsLoading extends ArticalState {}

final class ArticalsSucuess extends ArticalState {
  final List<Article> articals;
  ArticalsSucuess(this.articals);
}

final class ArticalsFaliuere extends ArticalState {
  final String err;
  ArticalsFaliuere(this.err);
}
