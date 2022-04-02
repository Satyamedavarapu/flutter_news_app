import 'package:flutter/material.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({ Key? key }) : super(key: key);

  @override
  State<VideosPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child:  Text('Videos Page')),
    );
  }
}