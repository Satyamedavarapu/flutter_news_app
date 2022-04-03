import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/bloc/article_bloc.dart';
import 'package:flutter_news_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:flutter_news_app/data/services/get_news_api.dart';
import 'package:flutter_news_app/data/models/carousel_model.dart';
import 'package:flutter_news_app/data/models/news_model.dart';
import 'package:flutter_news_app/presentation/components/carousel_container.dart';
import 'package:flutter_news_app/presentation/components/divider_container.dart';
import 'package:flutter_news_app/presentation/components/pop_row.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetNewsApi getNews = GetNewsApi();

  DividerContainer dc = DividerContainer();

  PopRow popRow = PopRow();

  CarouselData carouselData = CarouselData();

  CarouselContainer container = CarouselContainer();

  int activeIndex = 0;

  @override
  void initState() {
    getNews.getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
            if(state is InternetDisconnected) {
             ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.message),) );
            } 
             else if(state is InternetConnectedMobile) {
             ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.message),) );
            }
            else if(state is InternetConnectedWifi) {
             ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.message),) );
            }
            else if(state is InternetDisconnected) {
             ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.message),) );
            }

        },
        builder: (context, state) {
          if (state is InternetConnectedWifi || state is InternetConnectedMobile) {
            return Column(
              children: [
                Expanded(flex: 2, child: popRow.topRow(context)),
                Expanded(flex: 4, child: blocBuilder1()),
                Expanded(flex: 2, child: dc.dividerContainer(context)),
                Expanded(flex: 4, child: blocBuilder()),
              ],
            );
          } else if (state is InternetInitial) {
            return const Text('');
          } else if (state is InternetDisconnected) {
            return const Text('');
          } else {
            return const Center(child: Text('Network Error'));
          }
        },
      ),
    );
  }

  Widget popNews({required BuildContext context, required Articles articles}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          launch(articles.url!);
        },
        child: Card(
          elevation: 5.0,
          color: Theme.of(context).cardColor,
          // color: Colors.blueGrey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(articles.source!.name!,
                              maxLines: 3,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.brown),
                            padding: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            child: Text('Entertainment',
                                style: Theme.of(context).textTheme.bodyText2)),
                      ],
                    ),
                    Container(
                        height: 120.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Theme.of(context).primaryColor,
                            image: DecorationImage(
                              image: NetworkImage(articles.urlToImage!),
                              fit: BoxFit.fill,
                            )))
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.lock_clock),
                          Text(
                            articles.publishedAt.toString().split('T').first,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      const Icon(Icons.favorite)
                    ],
                  ))
            ]),
            // child: blocBuilder(),
          ),
        ),
      ),
    );
  }

  Widget carouselWidget({required List<Articles> articleModel}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
          child: CarouselSlider.builder(
              itemCount: articleModel.length,
              itemBuilder: (context, index, currentIndex) {
                return container.carouselContainer(
                    carouselModel: articleModel[index], context: context);
              },
              options: cOptions())),
    );
  }

  CarouselOptions cOptions() {
    return CarouselOptions(
      enlargeCenterPage: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 1000),
      autoPlay: true,
      reverse: true,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      enableInfiniteScroll: true,
    );
  }

  BlocBuilder<ArticleBloc, ArticleState> blocBuilder() {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoaded) {
          return popNews(context: context, articles: state.list[0]);
          // return Text(
          //     state.list[index].publishedAt.toString().split('T').first);

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

  BlocBuilder<ArticleBloc, ArticleState> blocBuilder1() {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoaded) {
          return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: CarouselSlider.builder(
                          itemCount: state.list.length,
                          itemBuilder: (context, index, currentIndex) {
                            return container.carouselContainer(
                                carouselModel: state.list[index],
                                context: context);
                          },
                          options: cOptions())),
                );
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

  List<CarouselModel> cList = [
    CarouselModel(
        likes: 30,
        categoryName: 'Entertainment',
        headline: 'RRR inches away from 1000Crores',
        image:
            'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cnJyJTIwbW92aWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
    CarouselModel(
        likes: 12,
        categoryName: 'Sports',
        headline: 'KKR beats punjab',
        image:
            'https://images.unsplash.com/photo-1607734834519-d8576ae60ea6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXBsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    CarouselModel(
        likes: 15,
        categoryName: 'International',
        headline: 'Imran khan to lose no motion',
        image:
            'https://images.unsplash.com/photo-1580905325386-dfa16677a1f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGltcmFuJTIwa2hhbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
    CarouselModel(
        likes: 9,
        categoryName: 'Politics',
        headline: 'Congress lashes modi about rising fuel prices',
        image:
            'https://images.unsplash.com/photo-1561995708-904fbc0430fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bmFyZW5kcmElMjBtb2RpfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    CarouselModel(
        likes: 27,
        categoryName: 'International',
        headline: 'Latest news about Russia-Ukraine War',
        image:
            'https://images.unsplash.com/photo-1565711561500-49678a10a63f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dWtyYWluZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
  ];
}
