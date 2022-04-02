part of 'article_bloc.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoaded extends ArticleState {
   List<Article> list = [];

  ArticleLoaded({
    required this.list,
  });
}

class ArticleFailure extends ArticleState {
  
}

class ArticleError extends ArticleState {}
