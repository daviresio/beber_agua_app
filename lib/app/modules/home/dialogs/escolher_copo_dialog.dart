import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<dynamic> escolherCopoDialog(context) => showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          height: 300.0,
          child: Column(
            children: <Widget>[
              rowItem(cups[0], cups[1]),
              rowItem(cups[2], cups[3]),
              rowItem(cups[4], cups[5]),
            ],
          ),
        ),
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text(
                'CANCELAR',
                style: TextStyle(color: Colors.redAccent),
              )),
          FlatButton(
              onPressed: () {},
              child: Text('OK', style: TextStyle(color: Colors.blueAccent))),
        ],
      );
    });

Widget rowItem(CupItem item1, CupItem item2) {
  return Container(
    padding:
        const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 50.0,
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                item1.imgPath,
                height: 25.0,
              ),
              SizedBox(
                height: 20,
              ),
              Text(item1.label),
            ],
          ),
        ),
        Column(
          children: <Widget>[
            SvgPicture.asset(
              item2.imgPath,
              height: 25.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(item2.label),
          ],
        ),
      ],
    ),
  );
}

List<CupItem> cups = [
  const CupItem(imgPath: "assets/images/cup-.svg", label: '100 ml'),
  const CupItem(imgPath: "assets/images/cup-150.svg", label: '150 ml'),
  const CupItem(imgPath: "assets/images/cup-200.svg", label: '200 ml'),
  const CupItem(imgPath: "assets/images/cup-300.svg", label: '300 ml'),
  const CupItem(imgPath: "assets/images/cup-400.svg", label: '400 ml'),
  CupItem(imgPath: "assets/images/cup-custom.svg", label: 'Customize'),
];

class CupItem {
  final String imgPath;
  final String label;

  const CupItem({this.imgPath, this.label});
}
