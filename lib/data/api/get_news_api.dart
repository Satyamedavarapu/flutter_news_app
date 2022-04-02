import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_news_app/data/models/news_model.dart';
import 'package:flutter_news_app/utilities/constants.dart';

class GetNewsApi {
  String url = Constants.getNewsUrl;

  Dio dio = Dio();

  Future<dynamic> getArticles() async {
    List<Article> articlesList = [];

    final response = await http.get(
      Uri.parse(Constants.getNewsUrl),
    );

    log(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonString = jsonDecode(response.body);
      NewsModel newsData = NewsModel.fromJson(jsonString);

      log('newsData is ' + newsData.toString());

      for (var article in newsData.articles) {
        articlesList.add(article);
      }
      log(articlesList.length.toString());
      return newsData;
    } else {
      return articlesList = [];
    }
  }

  Future<dynamic> getArticleData() async {

    final response = await http.get(
      Uri.parse(Constants.getNewsUrl),
    );

    Map<String, dynamic> jsonString = jsonDecode(response.body);

    List jsonArticle = jsonString['articles'];

    Article newArticle = Article.fromJson(jsonArticle[0]);

    return newArticle;
  }
}
