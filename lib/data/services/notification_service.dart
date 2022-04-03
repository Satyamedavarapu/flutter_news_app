import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_local_notification');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: ((payload) async {}));
  }

  Future notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          'NHID',
          'NEWS HOUR',
          autoCancel: true,
          channelDescription: 'News Hour App',
          enableVibration: true,
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: IOSNotificationDetails());
  }

  Future showNotification(
      int id, String title, String body, String payload) async {
    await flutterLocalNotificationsPlugin
        .show(id, title, body, await notificationDetails(), payload: payload);

    // await flutterLocalNotificationsPlugin.zonedSchedule(
    //   id,
    //   title,
    //   body,
    //   tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
    //   const NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       'NH',
    //       'News Hour',
    //      playSound: true,
    //       importance: Importance.max,
    //       priority: Priority.max,
    //       icon: '@drawable/ic_local_notification'
    //     ),
    //     iOS: IOSNotificationDetails(
    //       sound: 'default.wav',
    //       presentAlert: true,
    //       presentBadge: true,
    //       presentSound: true,
    //     ),
    //   ),
    //   uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    //   androidAllowWhileIdle: true,
    // );
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
