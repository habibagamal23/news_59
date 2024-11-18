import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_59/core/network/apiService.dart';
import 'package:news_59/features/home/model/ArticalModel.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  ApiService apiService = ApiService();

  List<Article> articals = [];

  getdata() async {
    emit(NewsLoading());
    try {
      var newsrespone = await apiService.fetchTopheadline();

      articals = newsrespone.articles ?? [];
      emit(NewsSucces(articals));
    } catch (e) {
      emit(NewsFauiler(e.toString()));
    }
  }
}
