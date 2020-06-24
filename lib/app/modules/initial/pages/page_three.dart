import 'package:beber_agua/app/modules/initial/initial_controller.dart';
import 'package:beber_agua/app/modules/initial/widgets/medir_peso_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  FixedExtentScrollController _fixedExtentScrollController =
      FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (initialController.config.sexo == 'M') {
        _fixedExtentScrollController.jumpToItem(69);
      } else {
        _fixedExtentScrollController.jumpToItem(59);
      }
    });
  }

  final List<int> pesos = List<int>.generate(400, (i) => i + 1).toList();
  final initialController = InitialController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, top: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Seu peso',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          CustomPaint(
            foregroundPainter: MedirPesoPainter(),
            child: Container(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/images/peso.svg",
                    width: 120.0,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 150.0,
                    width:
                        MediaQuery.of(context).size.width - (120.0 + 50 + 50),
                    child: ListWheelScrollView.useDelegate(
                      controller: _fixedExtentScrollController,
                      onSelectedItemChanged: (v) =>
                          initialController.setPeso(v + 1),
                      physics: FixedExtentScrollPhysics(),
                      itemExtent: 50.0,
                      diameterRatio: 1.2,
                      childDelegate: ListWheelChildBuilderDelegate(
                          childCount: pesos.length,
                          builder: (context, index) {
                            return Observer(builder: (_) {
                              return Text(
                                pesos[index].toString(),
                                style: TextStyle(
                                    color: (index ==
                                            initialController.config.peso - 1
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
                    margin: EdgeInsets.only(bottom: 25.0),
                    padding: EdgeInsets.only(right: 20.0),
                    child: Text(
                      'KG',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0),
                    ),
                  )
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
