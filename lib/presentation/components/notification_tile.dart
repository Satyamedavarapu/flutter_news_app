import 'package:flutter/material.dart';
import 'package:flutter_news_app/data/models/news_model.dart';

class NotificationTile { 



  Widget tile({
    required Articles articles,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        leading: Image.network(
          articles.urlToImage!,
        ),
        title: Text(
          articles.title!,
          style: Theme.of(context).textTheme.headline1,
        ),
        subtitle: Text(
          articles.source!.name!,
          style: Theme.of(context).textTheme.caption,
        ),
        isThreeLine: true,
        contentPadding: Theme.of(context).listTileTheme.contentPadding,
        dense: Theme.of(context).listTileTheme.dense,
        horizontalTitleGap: Theme.of(context).listTileTheme.horizontalTitleGap,
        shape: Theme.of(context).listTileTheme.shape,
        selectedTileColor: Theme.of(context).listTileTheme.selectedTileColor,
        style: Theme.of(context).listTileTheme.style,
        minVerticalPadding: Theme.of(context).listTileTheme.minVerticalPadding,
        tileColor: Theme.of(context).listTileTheme.tileColor,
        textColor: Theme.of(context).listTileTheme.textColor,
      ),
    );
  }













}