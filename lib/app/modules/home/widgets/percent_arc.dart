import 'package:flutter/material.dart';
import 'dart:math';

class PercentArcPainter extends CustomPainter {

  final double porcentagemConcluida;

  PercentArcPainter(this.porcentagemConcluida);


  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..color = Colors.grey.shade400;

    var height = size.height;
    var width = size.width;

    Offset center = Offset(width / 2, height / 2);
    double radius = min(width / 2, height / 2);


    //desenha a barra nao completa
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi, pi, false, paint);

    //desenha a porcentagem da barra completa
    paint.color = Colors.blueAccent;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi, pi * porcentagemConcluida, false, paint);

    //box shadow do circulo
    Path pathSombra = Path();
    pathSombra.addArc(Rect.fromCircle(center: Offset(width / 2, height / 2.08), radius: radius * .88), pi, pi * 2);
    pathSombra.close();
    canvas.drawShadow(pathSombra, Colors.black, 6.0, true);

    //desenha o circulo
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white;
    canvas.drawCircle(center, radius * .85, paint);

    //desenha a onda abaixo do circulo
    double x1 = width * .4;
    double x2 = width * .6;

    double ondaBeginX = width * .26;
    double ondaBeginY = height * .815;
    double ondaEndX = width * .74;
    double ondaEndY = height * .815;

    paint.style = PaintingStyle.fill;
    paint.color = Colors.blueAccent.withOpacity(.3);
    Path pathOnda = Path();

    pathOnda.moveTo(ondaBeginX, ondaBeginY);
    pathOnda.cubicTo(x1, height * .6, x2, height * .6, ondaEndX, ondaEndY);
    pathOnda.moveTo(ondaBeginX, ondaBeginY);
    pathOnda.cubicTo(x1, height * .962, x2, height * .962, ondaEndX, ondaEndY);
    canvas.drawPath(pathOnda, paint);


//    paint.color = Colors.green;
//    canvas.drawCircle(Offset(x1, y1), 8.0, paint);
//    canvas.drawCircle(Offset(x2, y2), 8.0, paint);

  }


  @override
  bool shouldRepaint(PercentArcPainter oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool shouldRebuildSemantics(PercentArcPainter oldDelegate) {
    return true;
  }

}


