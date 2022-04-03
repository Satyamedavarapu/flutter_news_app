import 'package:bloc/bloc.dart';
import 'package:flutter_news_app/data/services/get_news_api.dart';
import 'package:flutter_news_app/data/models/news_model.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleEventGet>((event, emit) async {
      emit(ArticleInitial());
      final result = await GetNewsApi().getArticles();

      if (result.isNotEmpty) {
        emit(ArticleLoaded(list: result));
      } else if (result.isEmpty) {
        emit(ArticleFailure());
      } else {
        emit(ArticleError());
      }
    });
  }
}
