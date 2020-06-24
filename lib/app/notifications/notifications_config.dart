import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsConfig {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  var initializationSettingsIos;
  var initializationSettings;


  NotificationsConfig() {
    init();
  }

  init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    initializationSettingsIos = IOSInitializationSettings(onDidReceiveLocalNotification: (id, title, body, payload) => onSelectNotification(payload));

    initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIos);

    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);

  }



  Future showLembreteAt({String title, String body, Time time, int id = 0}) => flutterLocalNotificationsPlugin.showDailyAtTime(id, title, body, time, _notificationDetails);

  Future showNotification({String title, String body, int id = 0}) => flutterLocalNotificationsPlugin.show(id, title, body, _notificationDetails);


  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
//    await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => PageTwo()),
//    );
  }



  NotificationDetails get _notificationDetails {
    final androidChannelSpecifis = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      'your channel description',
      importance: Importance.Max,
      priority: Priority.High,
      ongoing: true,
      autoCancel: true,
    );
    final iosChannelSpecifis = IOSNotificationDetails();
    return NotificationDetails(androidChannelSpecifis, iosChannelSpecifis);
  }


}
