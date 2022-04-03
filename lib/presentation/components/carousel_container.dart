import 'package:flutter/material.dart';
// import 'package:flutter_news_app/data/models/carousel_model.dart';
import 'package:flutter_news_app/data/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CarouselContainer {
  Widget carouselContainer(
      {required Articles carouselModel, required BuildContext context}) {
    return InkWell(
      onTap: () async {
        await launch(carouselModel.url!);
      },
      child: Container(
        height: 270.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(carouselModel.urlToImage!),
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
                      child: Text(carouselModel.source!.name!,
                          style: Theme.of(context).textTheme.bodyText2)),
                  Row(
                    children: const [
                       Icon(Icons.favorite, color: Colors.blueGrey),
                       Text('3')
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
                  carouselModel.title!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
