import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({ Key? key }) : super(key: key);

  @override
  State<CategoriesPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child:  Text('Categories Page')),
    );
  }
}