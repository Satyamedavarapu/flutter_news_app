import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/data/services/notification_service.dart';
import 'package:flutter_news_app/utilities/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    NotificationService().initNotification();
    super.initState();
  }

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
                  const Expanded(
                    flex: 5,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          Constants.profilePicUrl),
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
                  onTap: () {
                    NotificationService()
                        .showNotification(1, 'Language', 'English', '1');
                  },
                  context: context,
                  tileName: 'Language',
                  icon: Icons.language),
              tile(
                  onTap: () {
                    NotificationService()
                        .showNotification(2, 'Country', 'India', 'payload');
                  },
                  context: context,
                  tileName: 'Country',
                  icon: Icons.countertops),
              tile(
                  onTap: () async {
                    await NotificationService().showNotification(
                        3, 'Notifications', 'Flutter Local Notifications', '');
                  },
                  context: context,
                  tileName: 'Notifications',
                  icon: Icons.notification_add),
              tile(
                  onTap: () {
                    NotificationService().showNotification(4, 'Signout',
                        'User has been signed out successfully', '1');
                  },
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
      required VoidCallback onTap,
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
