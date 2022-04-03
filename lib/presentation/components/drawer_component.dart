import 'package:flutter/material.dart';
import 'package:flutter_news_app/utilities/constants.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Expanded(
              flex: 4,
              child: CircleAvatar(
                maxRadius: 90.0,
                minRadius: 60.0,
                backgroundImage: NetworkImage(Constants.profilePicUrl),
              )),
          Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Latest News',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Technology News',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Business News',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Crypto News',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'Sports News',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
