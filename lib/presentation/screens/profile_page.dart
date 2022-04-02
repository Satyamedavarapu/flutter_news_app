import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
                    child: CircleAvatar(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                      ),
                      maxRadius: 72.0,
                      minRadius: 48.0,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Hello UserName',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text(
                          'username@gmail.com',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        CupertinoButton(
                          color: Theme.of(context).primaryColor,
                          child: Text('Edit Profile',
                              style: Theme.of(context).textTheme.bodyText2),
                          onPressed: () {},
                          borderRadius: BorderRadius.circular(15.0),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              tile(
                  context: context, tileName: 'Language', icon: Icons.language),
              tile(
                  context: context,
                  tileName: 'Country',
                  icon: Icons.countertops),
              tile(
                  context: context,
                  tileName: 'Notifications',
                  icon: Icons.notification_add),
              tile(
                  context: context,
                  tileName: 'Sign Out',
                  icon: Icons.exit_to_app),
            ],
          ),
        )
      ],
    ));
  }

  Widget tile(
      {required BuildContext context,
      required String tileName,
      required IconData icon}) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
      child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          tileColor: Colors.grey[300],
          leading: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(tileName, style: Theme.of(context).textTheme.bodyText1)),
    );
  }
}
