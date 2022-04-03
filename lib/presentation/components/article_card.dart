import 'package:flutter/material.dart';
import 'package:flutter_news_app/data/models/news_model.dart';

class ArticleCard {
  Widget articleCard(BuildContext context, Articles article) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(article.urlToImage!),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(12.0)),
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(12.0),
        child:
            Text(article.title!, style: Theme.of(context).textTheme.bodyText2));
  }
}
