import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/webservice/DioFactory.dart';
import '../model/Artical/ArticalModel.dart';

part 'artical_state.dart';

class ArticalCubit extends Cubit<ArticalState> {
  NewsService newsService;
  ArticalCubit(this.newsService) : super(ArticalInitial()) {
    getNews();
  }
  List<Article> myartical = [];

  Future getNews() async {
    emit(ArticalsLoading());
    try {
      myartical = await newsService.fetchTopHeadlines();
      emit(ArticalsSucuess(myartical));
    } catch (e) {
      emit(ArticalsFaliuere("my error is $e"));
    }
  }
}
