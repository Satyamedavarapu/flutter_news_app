import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/bloc/article_bloc.dart';
import 'package:flutter_news_app/cubits/cubit/theme_cubit.dart';
import 'package:flutter_news_app/cubits/internet_cubit.dart';
import 'package:flutter_news_app/presentation/screens/home_screen.dart';
import 'package:flutter_news_app/utilities/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(connectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity),
        ),
        BlocProvider<ArticleBloc>(
          create: (context) => ArticleBloc()..add(ArticleEventGet()),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter News Hour',
            theme: state.isDark == true
                ? AppTheme().darkTheme
                : AppTheme().lightTheme,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
