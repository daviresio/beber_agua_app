import 'package:beber_agua/app/modules/home/home_page.dart';
import 'package:beber_agua/app/modules/initial/initial_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

FirebaseAnalytics analytics = FirebaseAnalytics();

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

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
