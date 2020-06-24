import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';



class CustomCanvas extends StatefulWidget {
  @override
  _CustomCanvasState createState() => _CustomCanvasState();
}

class _CustomCanvasState extends State<CustomCanvas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          foregroundPainter: CustomCanvasPainter(),
          child: Container(
            height: 400,
            width: 400,
          ),
        ),
      ),
    );
  }
}




class CustomCanvasPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..color = Colors.black
      ..strokeJoin = StrokeJoin.round;

    var width = size.width;
    var height = size.height;

    var beginX = width / 2;
    var beginY = height * .2;
    var endX = width /2;
    var endY = height * .5;

    var x1 = width * .4;
    var y1 = 0.0;
    var x2 = width * .1;
    var y2 = height * .2;

    Path path = Path();
    path.moveTo(beginX, beginY);
    path.cubicTo(width * .6, y1, width * .9, y2, endX, endY);

    path.moveTo(beginX, beginY);
    path.cubicTo(x1, y1, x2, y2, endX, endY);
    path.close();

    Paint paintFill = Paint()
    ..color = Colors.redAccent
    ..style = PaintingStyle.fill
    ..strokeWidth = 0;

    canvas.drawPath(path, paint);
    canvas.drawPath(path, paintFill);


//    paint.color = Colors.green;
//    canvas.drawCircle(Offset(x1, y1), 8, paint);
//    canvas.drawCircle(Offset(x2, y2), 8, paint);

  }

  @override
  bool shouldRepaint(CustomCanvasPainter oldDelegate) {
  return true;
  }

  @override
  bool shouldRebuildSemantics(CustomCanvasPainter oldDelegate) {
    return true;
  }
}