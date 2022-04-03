import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/article_bloc/article_bloc.dart';
import 'package:flutter_news_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:flutter_news_app/presentation/components/notification_tile.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  NotificationTile notTile = NotificationTile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
        if (state is InternetDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        } else if (state is InternetConnectedMobile) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        } else if (state is InternetConnectedWifi) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        } else if (state is InternetDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      }, builder: (context, state) {
        if (state is InternetConnectedMobile ||
            state is InternetConnectedWifi) {
          return BlocBuilder<ArticleBloc, ArticleState>(
              builder: (context, state) {
            if (state is ArticleLoaded) {
              return ListView.separated(
                itemCount: state.list.length,
                itemBuilder: ((context, index) {
                  return notTile.tile(
                      articles: state.list[index],
                      onTap: () {},
                      context: context);
                }),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Theme.of(context).primaryColor,
                  );
                },
              );
            } else if (state is ArticleFailure) {
              return Center(
                child: Text(
                  'Fetching data Failed',
                  style: Theme.of(context).textTheme.headline1,
                ),
              );
            } else if (state is ArticleError) {
              return Center(
                child: Text(
                  'Error while fetching articles',
                  style: Theme.of(context).textTheme.headline1,
                ),
              );
            } else if (state is ArticleInitial) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return Center(
                child: Text(
                  'Api Failure',
                  style: Theme.of(context).textTheme.headline1,
                ),
              );
            }
          });
        } else if (state is InternetDisconnected) {
          return Center(
            child: Text(
              'Network not found',
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        } else {
          return Center(
            child: Text(
              'Network Failure',
              style: Theme.of(context).textTheme.headline1,
            ),
          );
        }
      }),
    );
  }
}
