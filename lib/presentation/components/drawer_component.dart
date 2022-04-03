
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
                'Text 1',
                style: Theme.of(context).textTheme.headline1,
              ), 
              Text(
                'Text 2',
                style: Theme.of(context).textTheme.headline1,
              ), 
              Text(
                'Text 3',
                style: Theme.of(context).textTheme.headline1,
              ), 
              Text(
                'Text 4',
                style: Theme.of(context).textTheme.headline1,
              ), 
               Text(
                'Text 5',
                style: Theme.of(context).textTheme.headline1,
              ), 
            ],
          ))
        ],
      ),
    );
  }
}