import 'dart:convert';

import 'package:beber_agua/app/data/dao/bebida_dao.dart';
import 'package:beber_agua/app/data/dao/bebida_ingerida_dao.dart';
import 'package:beber_agua/app/data/database.dart';
import 'package:beber_agua/app/data/models/bebidas_join.dart';
import 'package:beber_agua/app/data/models/config.dart';
import 'package:beber_agua/app/modules/home/home_controller.dart';
import 'package:beber_agua/app/modules/home/widgets/percent_arc.dart';
import 'package:beber_agua/app/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dialogs/escolher_copo_dialog.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) async {
      Config config =
          Config.fromJson(json.decode(prefs.getString(Config.preferenceKey)));
      var bebida =
          await Database.instance.bebidaDao.find(config.copoSelecionadoId);
      Database.instance.bebidaIngeridaDao.dadosDoDia();
      _controller.initConfig(config, bebida);
    });
  }

  final BebidaDao _bebidaDao = Database.instance.bebidaDao;
  final BebidaIngeridaDao _bebidaIngeridaDao =
      Database.instance.bebidaIngeridaDao;
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    var middleContentwidth = MediaQuery.of(context).size.width / 1.2;

    return Scaffold(
      body: Observer(
        builder: (_) => (_controller.bebida == null ||
                _controller.config == null)
            ? Container()
            : ListView(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  CustomPaint(
                    painter: PercentArcPainter(_porcentagemConcluida(
                        _controller.totalIngeridoHoje,
                        _controller.config.metaIngestao)),
                    child: Container(
                      height: middleContentwidth,
                      child: Stack(
                        children: <Widget>[
                          Observer(
                            builder: (_) {
                              return Positioned(
                                bottom: 40,
                                left:
                                    MediaQuery.of(context).size.width / 2 - 15,
                                child: GestureDetector(
                                  onTap: () {
                                    //_controller.bebida.id
                                    _bebidaIngeridaDao.add(BebidaIngerida(
                                        dataIngestao: DateTime.now(),
                                        bebidaId: 1,
                                        quantidadeIngerida: 1));
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Text("${_controller.bebida.ml} ml"),
                                      SvgPicture.asset(
                                        "assets/images/${_controller.bebida.imagemCopo}",
                                        height: 30.0,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * .35,
                            top: middleContentwidth * .35,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                        _controller.totalIngeridoHoje
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.blueAccent)),
                                    Text('/${_controller.config.metaIngestao}',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: Colors.black)),
                                  ],
                                ),
                                Text('Alvo de bebida diaria',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width * .05,
                            top: middleContentwidth / 2 + 10,
                            child: SvgPicture.asset(
                              "assets/images/gota_agua.svg",
                              height: 30.0,
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * .05,
                            top: middleContentwidth / 2 + 10,
                            child: SvgPicture.asset(
                              "assets/images/cactus.svg",
                              height: 30.0,
                            ),
                          ),
                          Positioned(
                            right: 30,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () => escolherCopoDialog(context),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 60,
                                    height: 60,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 5.0, top: 5.0),
                                    width: 45.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 3.0),
                                        ]),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                          "assets/images/${_controller.bebida.imagemCopo}",
                                          height: 25.0,
                                        )),
                                  ),
                                  Positioned(
                                    right: 1,
                                    bottom: 8,
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 2.0,
                                              offset: Offset(2, 1)),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.refresh,
                                        color: Colors.blueAccent,
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -.5,
                            left: MediaQuery.of(context).size.width * .23,
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_upward,
                                  color: Colors.blueAccent,
                                  size: 12,
                                ),
                                Text(
                                  'Confirme que voce acabou de beber agua',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, bottom: 12.0),
                    child: Text(
                      'Registros de hoje',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.only(left: 28.0, right: 28.0),
                    child: Card(
                      elevation: 8.0,
                      child: Observer(
                        builder: (_) => ListView.builder(
                          itemCount: (_controller.bebidasIngeridasHoje == null
                                  ? 0
                                  : _controller.bebidasIngeridasHoje.length) +
                              1,
                          itemBuilder: (context, index) {
                            BebidaComBebidaIngerida item = index > 0
                                ? _controller.bebidasIngeridasHoje[index - 1]
                                : null;
                            if (index == 0) {
                              if (_controller.totalIngeridoHoje <
                                  _controller.config.metaIngestao) {
                                Time hora =
                                    _controller.config.horariosLembretes[0];

                                return ListTile(
                                  contentPadding:
                                      EdgeInsets.only(left: 12.0, right: 20.0),
                                  leading: Icon(
                                    Icons.timer,
                                    color: Colors.black,
                                    size: 15.0,
                                  ),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('${hora.hour}:${hora.minute}'),
                                      Text('Proxima vez'),
                                    ],
                                  ),
                                  trailing: Text('${_controller.bebida.ml} ml'),
                                );
                              }
                              return Container();
                            }
                            return ListTile(
                              contentPadding: EdgeInsets.only(left: 12.0),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                      '${completeZeroDate(item.bebidaIngerida.dataIngestao.hour)}:${completeZeroDate(item.bebidaIngerida.dataIngestao.minute)}'),
                                  Text(
                                      '${item.bebidaIngerida.dataIngestao.day}'),
                                  Text('${item.bebida.ml} ml'),
                                ],
                              ),
                              leading: Column(
                                children: <Widget>[
                                  Text(
                                    '\'',
                                    style: TextStyle(
                                      height: .5,
                                    ),
                                  ),
                                  Text(
                                    '\'',
                                    style: TextStyle(
                                      height: .5,
                                    ),
                                  ),
                                  Text(
                                    '\'',
                                    style: TextStyle(
                                      height: .5,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/images/${item.bebida.imagemCopo}",
                                    height: 15.0,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    '\'',
                                    style: TextStyle(
                                      height: .5,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(child: Text('Editar')),
                                    PopupMenuItem(
                                      child: Text('Excluir'),
                                    ),
                                  ];
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
      ),
    );
  }
}

_porcentagemConcluida(int totalIngeridoHoje, int metaIngestao) {
  if (totalIngeridoHoje == 0.0) return 0.0;
  if (totalIngeridoHoje >= metaIngestao) return 1.0;
  var calc = ((totalIngeridoHoje / metaIngestao) * 100).toInt();
  return double.parse("0.$calc");
}