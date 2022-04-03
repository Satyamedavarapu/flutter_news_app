import 'package:flutter/material.dart';
import 'package:flutter_news_app/utilities/app_colors.dart';

class AppTheme {
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
    primaryColor: Colors.amber,
    cardColor: Colors.grey,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10.0,
      backgroundColor: AppColors.darkGrey,
      selectedItemColor: Colors.amberAccent,
      unselectedItemColor: Colors.white,
      
      selectedLabelStyle:
          const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          const TextStyle(color: Colors.amber, fontWeight: FontWeight.normal),
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.darkGrey),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey),
        headline2: TextStyle(
            fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.orange),
        bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey),
        bodyText2: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        caption: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent)),
              buttonTheme:  ButtonThemeData(
      buttonColor: Colors.amber, 
      textTheme: ButtonTextTheme.primary,
      padding: const EdgeInsets.all(8.0),
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
    )
  );

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.lightBlue,
    primaryColor: Colors.lightBlue,
    cardColor: Colors.white70,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 10.0,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle:
          TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          TextStyle(color: Colors.blue, fontWeight: FontWeight.normal),
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
      headline2: TextStyle(
          fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.orange),
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      caption: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.redAccent),
      bodyText2: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    buttonTheme:  ButtonThemeData(
      buttonColor: Colors.blue, 
      textTheme: ButtonTextTheme.primary,
      padding: const EdgeInsets.all(8.0),
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))
    )
  );
}
