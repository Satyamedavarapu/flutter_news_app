import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child:  Text('Profile Page')),
    );
  }
}