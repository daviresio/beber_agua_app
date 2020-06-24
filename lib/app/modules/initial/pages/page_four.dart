import 'package:beber_agua/app/modules/initial/widgets/hora_acordar_dormir_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import '../initial_controller.dart';

class PageFour extends StatefulWidget {
  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  FixedExtentScrollController _horaScrollController =
      FixedExtentScrollController();
  FixedExtentScrollController _minutoScrollController =
      FixedExtentScrollController();

  final List<String> horas =
      List<int>.generate(24, (i) => (i - 1) + 1).map((v) {
    if (v.toString().length == 1) return '0$v';
    return v.toString();
  }).toList();

  final List<String> minutos =
      List<int>.generate(60, (i) => (i - 1) + 1).map((v) {
    if (v.toString().length == 1) return '0$v';
    return v.toString();
  }).toList();

  final initialController = InitialController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _horaScrollController.jumpToItem(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, top: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Que horas voce acorda?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          CustomPaint(
            foregroundPainter: HoraAcordarDormirPainter(),
            child: Container(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/images/hora_acordar.svg",
                    width: 120.0,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        height: 150.0,
                        width: 80,
                        child: ListWheelScrollView.useDelegate(
                          controller: _horaScrollController,
                          onSelectedItemChanged:
                              initialController.setHoraAcordar,
                          physics: FixedExtentScrollPhysics(),
                          itemExtent: 50.0,
                          diameterRatio: 1.2,
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: horas.length,
                              builder: (context, index) {
                                return Observer(builder: (_) {
                                  return Text(
                                    horas[index].toString(),
                                    style: TextStyle(
                                        color: (index ==
                                                initialController
                                                    .config.horaAcordar
                                            ? Colors.blueAccent
                                            : Colors.black87),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  );
                                });
                              }),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            ':',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 30.0),
                          )),
                      Container(
                        margin: EdgeInsets.only(right: 30.0),
                        alignment: Alignment.centerRight,
                        height: 150.0,
                        width: 80,
                        child: ListWheelScrollView.useDelegate(
                          controller: _minutoScrollController,
                          onSelectedItemChanged:
                              initialController.setMinutoAcordar,
                          physics: FixedExtentScrollPhysics(),
                          itemExtent: 50.0,
                          diameterRatio: 1.2,
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: minutos.length,
                              builder: (context, index) {
                                return Observer(builder: (_) {
                                  return Text(
                                    minutos[index].toString(),
                                    style: TextStyle(
                                        color: (index ==
                                                initialController
                                                    .config.minutoAcordar
                                            ? Colors.blueAccent
                                            : Colors.black87),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  );
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
