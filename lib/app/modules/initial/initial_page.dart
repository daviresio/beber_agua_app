import 'dart:convert';

import 'package:beber_agua/app/data/models/config.dart';
import 'package:beber_agua/app/modules/initial/pages/page_five.dart';
import 'package:beber_agua/app/modules/initial/pages/page_four.dart';
import 'package:beber_agua/app/modules/initial/pages/page_one.dart';
import 'package:beber_agua/app/modules/initial/pages/page_three.dart';
import 'package:beber_agua/app/modules/initial/pages/page_two.dart';
import 'package:beber_agua/app/notifications/notifications_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'initial_controller.dart';

class InitialPage extends StatefulWidget {
  static const routeName = '/initial';

  final String title;
  const InitialPage({Key key, this.title = "Initial"}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  PageController _controller = PageController();

  var pageSelected = 0;

  final initialController = InitialController();

  void avancaPagina() async {
    if (pageSelected == 4) {
      var _config = initialController.config;
      var meta = _config.peso * 35;
      _config = _config.copyWith(
          metaIngestaoRecomendada: meta,
          metaIngestao: meta,
          horariosLembretes: Config.calcIntervals(_config));

      var lembrete = NotificationsConfig();

      _config.horariosLembretes.forEach((v) => lembrete.showLembreteAt(
          title: 'Beber agua',
          body: 'agpra sao a hora de beber agua',
          time: v));

      var prefs = await SharedPreferences.getInstance();
      var _configJson = json.encode(_config.toJson());
      var _configString = _configJson.toString();
      prefs.setString(
        Config.preferenceKey,
        _configString,
      );
      Navigator.of(context).pushNamed('/home');
    } else {
      _controller.nextPage(
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
      setState(() {
        pageSelected++;
      });
    }
  }

  void voltaPagina() {
    _controller.previousPage(
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
    setState(() {
      pageSelected--;
    });
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getString(Config.preferenceKey) != null) {
        //TODO comentar essa linha para sempre fazer o cadastro, util para etapas no desenvolvimento
        Navigator.of(context).pushNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: PageView(
              controller: _controller,
              children: <Widget>[
                PageOne(),
                PageTwo(),
                PageThree(),
                PageFour(),
                PageFive(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ((pageSelected >= 0.9
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        padding: EdgeInsets.all(12.0),
                        color: Colors.blueAccent,
                        shape: CircleBorder(),
                        onPressed: voltaPagina,
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                      ),
                      RaisedButton(
                        padding: EdgeInsets.only(
                            top: 12.0, bottom: 12.0, left: 20.0, right: 20.0),
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: avancaPagina,
                        child: Text(
                          'PROXIMO',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ),
                    ],
                  )
                : ButtonTheme(
                    minWidth: 400.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12.0),
                      color: Colors.blueAccent,
                      onPressed: avancaPagina,
                      child: Text(
                        'VAMOS',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ))),
          ),
        ],
      ),
    );
  }
}
