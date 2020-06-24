import 'package:flutter/material.dart';

class MedirPesoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    var height = size.height;
    var width = size.width;

    Paint paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1
    ..color = Colors.black12;

    Path path = Path();
    path.moveTo(width, height * .2);
    path.lineTo(width * .55, height * .2);
    path.moveTo(width, height * .6);
    path.lineTo(width * .55, height * .6);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MedirPesoPainter oldDelegate) {
    return true;
  }

  @override
  bool shouldRebuildSemantics(MedirPesoPainter oldDelegate) {
    return true;
  }
}