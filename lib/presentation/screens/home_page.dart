import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/bloc/article_bloc.dart';
import 'package:flutter_news_app/data/api/get_news_api.dart';
import 'package:flutter_news_app/data/models/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetNewsApi getNews = GetNewsApi();

  @override
  void initState() {
    getNews.getArticleData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        radius: 28.0,
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        height: 48.0,
                        child: TextFormField(
                          maxLines: 1,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter Username';
                            } else {
                              return null;
                            }
                          },
                          style: Theme.of(context).textTheme.bodyText1,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              errorStyle: Theme.of(context).textTheme.caption,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              hintText: 'Search News',
                              hintStyle: Theme.of(context).textTheme.bodyText1),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12.0)),
                  child: FutureBuilder<dynamic>(
                      future: getNews.getArticleData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          // return Text(snapshot.data.toString());

                          return articleCard(snapshot.data);

                          // return ListView.builder(
                          //     itemCount: snapshot.data.length,
                          //     itemBuilder: ((context, index) {
                          //       return articleCard(snapshot.data[index]);
                          //     }));
                        } else {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      }),
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.amber,
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.orangeAccent,
              )),
        ],
      ),
    );
  }

  BlocBuilder<ArticleBloc, ArticleState> blocBuilder() {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoaded) {
          return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return Text(state.list[index].title);
              });
        } else if (state is ArticleFailure) {
          return const Center(child: Text('Failed to Load Articles'));
        } else if (state is ArticleError) {
          return const Center(child: Text('Error in Loading Articles'));
        } else if (state is ArticleInitial) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return const Center(child: Text('Something Went wrong'));
        }
      },
    );
  }

  // FutureBuilder<List<Article>> futureMethod() {
  //   return FutureBuilder<List<Article>>(
  //                 future: getNews.getArticles(),
  //                 builder: (context, snapshot) {
  //                   if (snapshot.hasData &&
  //                       snapshot.connectionState == ConnectionState.done) {

  //                     return ListView.builder(
  //                         itemCount: snapshot.data!.length,
  //                         itemBuilder: (context, index) {
  //                           return articleCard(snapshot.data![index]);
  //                         });
  //                   } else if (snapshot.connectionState !=
  //                       ConnectionState.done) {
  //                     return const Center(
  //                       child: CircularProgressIndicator.adaptive(),
  //                     );
  //                   } else if (snapshot.hasError) {
  //                     return  Center(
  //                       child: Text('Snapshot Error ${snapshot.hasError.toString()}'),
  //                     );
  //                   } else if (!snapshot.hasData) {
  //                     return const Center(
  //                       child: Text('Snapshot has no data'),
  //                     );
  //                   } else {
  //                     return const Center(
  //                       child: Text('Something went wrong'),
  //                     );
  //                   }
  //                 });
  // }

  Widget articleCard(Article article) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(article.urlToImage),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(12.0)),
        alignment: Alignment.bottomCenter,
        child: Text(article.title));
  }
}
