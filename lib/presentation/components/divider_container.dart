import 'package:flutter/material.dart';

class DividerContainer { 
   Widget dividerContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const VerticalDivider(
                color: Colors.purple,
                thickness: 4.0,
                width: 10.0,
                indent: 20.0,
                endIndent: 20.0,
              ),
              Text(
                'Popular News',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          Text(
            'View All',
            style: Theme.of(context).textTheme.bodyText1,
          )
        ]),
      ),
    );
  }

}