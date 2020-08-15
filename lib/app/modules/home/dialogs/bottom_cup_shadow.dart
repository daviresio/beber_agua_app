import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomCupShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent
      ..isAntiAlias = true;

    var width = size.width;
    var height = size.height;

    var path = Path();
    var path2 = Path();

    path.moveTo(0, height / 2);
    path2.moveTo(0, height / 2);

    path.cubicTo(
        width * .3, height * .7, width * .6, height * .7, width, height / 2);

    path2.cubicTo(
        width * .3, height * .3, width * .6, height * .3, width, height / 2);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
    canvas.drawShadow(path, Colors.black87, 1.0, true);
    canvas.drawShadow(path2, Colors.black87, 1.0, true);

    path.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
