import 'package:flutter/material.dart';
import 'package:flutter_news_app/data/models/category_model.dart';

class GridCardComponent {


 Widget gridCard({required CategoryModel categoryModel, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 270.0,
        width: 270.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Theme.of(context).primaryColor,
          image: DecorationImage(
              image: NetworkImage(categoryModel.categoryUrl),
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4.0),
        child: Text(
          categoryModel.categoryname,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }

}