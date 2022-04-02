import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/blocs/bloc/article_bloc.dart';
import 'package:flutter_news_app/data/api/get_news_api.dart';
import 'package:flutter_news_app/data/models/carousel_model.dart';
import 'package:flutter_news_app/presentation/components/article_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetNewsApi getNews = GetNewsApi();

  ArticleCard articleCard = ArticleCard();

  CarouselData carouselData = CarouselData();

  int activeIndex = 0;

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
                        borderRadius: BorderRadius.circular(12.0)),
                    child: CarouselSlider.builder(
                        itemCount: cList.length,
                        itemBuilder: (context, index, currentIndex) {
                          return carouselContainer(carouselModel: cList[index]);
                        },
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 1000),
                          autoPlay: true,
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          pageSnapping: true,
                          enableInfiniteScroll: true,
                        ))),
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
              )),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.amber,
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

  Widget carouselContainer({required CarouselModel carouselModel}) {
    return Container(
      height: 270.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(carouselModel.image),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high),
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.brown),
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Text(carouselModel.categoryName,
                        style: Theme.of(context).textTheme.bodyText2)),
                Row(
                  children: [
                    const Icon(Icons.favorite, color: Colors.blueGrey),
                    Text(carouselModel.likes.toString())
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                carouselModel.headline,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
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
