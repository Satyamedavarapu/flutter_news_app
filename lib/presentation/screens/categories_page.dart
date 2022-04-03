import 'package:flutter/material.dart';
import 'package:flutter_news_app/data/models/category_model.dart';
import 'package:flutter_news_app/presentation/components/grid_card.dart';
import 'package:flutter_news_app/utilities/constants.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoriesPage> {
  GridCardComponent gridCardComponent = GridCardComponent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
        itemBuilder: (context, index) {
          return gridCardComponent.gridCard(categoryModel: categories[index], context: context);
        },
        itemCount: categories.length,
      ),
    );
  }

  List<CategoryModel> categories = [
    CategoryModel(categoryname: 'Sports', categoryUrl: Constants.sportsUrl),
    CategoryModel(categoryname: 'Technology', categoryUrl: Constants.techUrl),
    CategoryModel(categoryname: 'Business', categoryUrl: Constants.businessurl),
  ];
}
