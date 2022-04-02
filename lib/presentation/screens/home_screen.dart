import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/cubits/cubit/theme_cubit.dart';
import 'package:flutter_news_app/presentation/screens/categories_page.dart';
import 'package:flutter_news_app/presentation/screens/home_page.dart';
import 'package:flutter_news_app/presentation/screens/profile_page.dart';
import 'package:flutter_news_app/presentation/screens/videos_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    VideosPage(),
    CategoriesPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            elevation: 10.0,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'News ', style: Theme.of(context).textTheme.headline1),
              TextSpan(
                  text: 'Hour', style: Theme.of(context).textTheme.headline2)
            ])),
            actions: [
              
              IconButton(
                icon: const Icon(
                  Icons.lightbulb,
                  size: 32.0,
                ),
                onPressed: () {
                  BlocProvider.of<ThemeCubit>(context).themeChange();
                
                },
              ),
              const Padding(padding: EdgeInsets.only(right: 8.0)),
              const Icon(Icons.search, size: 32.0),
              const Padding(padding: EdgeInsets.only(right: 8.0)),

              const Icon(Icons.notifications_on, size: 32.0),
            ],
            bottom: const TabBar(tabs: [
              Tab(
                text: 'Explore',
              ),
              Tab(
                text: 'Entertainment',
              ),
              Tab(
                text: 'Politics',
              ),
              Tab(
                text: 'Sports',
              ),
            ]),
          ),
          body: SafeArea(
            child: IndexedStack(
              index: currentPage,
              children: pages,
            ),
          ),
          bottomNavigationBar: bottomNavigationBar(context)),
    );
  }

  Widget bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        elevation: Theme.of(context).bottomNavigationBarTheme.elevation,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        unselectedLabelStyle:
            Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
        selectedLabelStyle:
            Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        showSelectedLabels:
            Theme.of(context).bottomNavigationBarTheme.showSelectedLabels,
        showUnselectedLabels:
            Theme.of(context).bottomNavigationBarTheme.showUnselectedLabels,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.video_settings),
              label: 'Videos',
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.category),
              label: 'Categories',
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: const Icon(Icons.account_box),
              label: 'Profile',
              backgroundColor: Theme.of(context).primaryColor)
        ]);
  }
}
