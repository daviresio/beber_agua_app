import 'package:beber_agua/app/data/database.dart';
import 'package:beber_agua/app/modules/home/home_page.dart';
import 'package:beber_agua/app/modules/initial/initial_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/notifications/notifications_config.dart';

void main() => runApp(MyApp());

FirebaseAnalytics analytics = FirebaseAnalytics();

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //para forcar a database ser criada logo no comeco e popular os dados default na primeira execucao
    Database.instance;

    GetIt.I.registerSingleton<NotificationsConfig>(NotificationsConfig());
    var notifications = GetIt.I<NotificationsConfig>();
    notifications.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          InitialPage.routeName: (context) => InitialPage(),
          HomePage.routeName: (context) => HomePage(),
        },
        initialRoute: InitialPage.routeName,
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ]);
  }
}
