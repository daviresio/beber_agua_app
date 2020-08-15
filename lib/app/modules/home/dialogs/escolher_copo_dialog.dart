import 'package:beber_agua/app/data/database.dart';
import 'package:beber_agua/app/modules/home/dialogs/bottom_cup_shadow.dart';
import 'package:beber_agua/app/modules/home/dialogs/escolher_copo_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<dynamic> escolherCopoDialog(context) {
  EscolherCopoController _controller = EscolherCopoController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            height: 400.0,
            width: MediaQuery.of(context).size.width,
            child: Observer(builder: (_) {
              return GridView.count(
                crossAxisCount: 2,
                children: _controller.bebidas.map((bebida) {
                  return item(bebida, bebida.id == _controller.cupIdSelected,
                      () {
                    _controller.selectCup(bebida.id);
                  });
                }).toList(),
              );
            }),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'CANCELAR',
                  style: TextStyle(color: Colors.redAccent),
                )),
            FlatButton(
                onPressed: () async {
                  await _controller.salvarNovaBebida();
                  Navigator.of(context).pop();
                },
                child: Text('OK', style: TextStyle(color: Colors.blueAccent))),
          ],
        );
      });
}

Widget item(Bebida bebida, bool bebidaSelecionada, Function selecionaBebida) {
  return GestureDetector(
    onTap: selecionaBebida,
    child: Container(
      padding: const EdgeInsets.only(
          top: 25.0, bottom: 10.0, left: 10.0, right: 10.0),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/${bebida.imagemCopo}',
            height: 25.0,
            color: bebidaSelecionada ? Colors.blueAccent : Colors.black54,
          ),
          (bebidaSelecionada
              ? Container(
                  width: 30,
                  height: 20,
                  child: CustomPaint(
                    painter: BottomCupShadow(),
                  ),
                )
              : Container(
                  height: 10.0,
                )),
          Text('${bebida.ml} ml',
              style: TextStyle(
                  color:
                      bebidaSelecionada ? Colors.blueAccent : Colors.black54)),
        ],
      ),
    ),
  );
}
