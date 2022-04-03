import 'package:flutter/material.dart';
import 'package:flutter_news_app/data/models/category_model.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
        itemBuilder: (context, index) {
          return gridCard(categoryModel: categories[index]);
        },
        itemCount: categories.length,
      ),
    );
  }

  Widget gridCard({required CategoryModel categoryModel}) {
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

  List<CategoryModel> categories = [
    CategoryModel(
        categoryname: 'Sports',
        categoryUrl:
            'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3BvcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    CategoryModel(
        categoryname: 'Technology',
        categoryUrl:
            'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
    CategoryModel(
        categoryname: 'Business',
        categoryUrl:
            'https://images.unsplash.com/photo-1512389810321-de6db6e2aba7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YnVzaW5lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
  ];
}
