import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  Color color1;
  Color color2;
  Color color3;
  CurvePainter({this.color1, this.color2, this.color3});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color1
      //..maskFilter = MaskFilter.blur(BlurStyle.solid, 10.0)
      ..style = PaintingStyle.fill;

    var paint2 = Paint()
      ..color = color2
      // ..maskFilter = MaskFilter.blur(BlurStyle.solid, 10.0)
      ..style = PaintingStyle.fill;

    var paint3 = Paint()
      ..color = color3
      // ..maskFilter = MaskFilter.blur(BlurStyle.solid, 10.0)
      ..style = PaintingStyle.fill;

    var width = size.width;
    var height = size.height;

    var path1 = Path();
    path1.moveTo(0, height * 0.250);

    path1.quadraticBezierTo(
        width * 0.250, height * 0.400, width * 0.50, height * 0.250);

    path1.quadraticBezierTo(
        width * 0.750, height * 0.400, width, height * 0.250);

    path1.lineTo(width, 0);
    path1.lineTo(0, 0);

//-------------------------------------------
    var path2 = Path();

    path2.moveTo(0, height * 0.250);
    // Control point -> End Point
    path2.quadraticBezierTo(
        width * 0.25, height * 0.100, width * 0.50, height * 0.250);

    path2.quadraticBezierTo(width * 0.75, height * 0.0005, width, 0);

    //path2.lineTo(width, 0);
    path2.lineTo(0, 0);

    //-----------------------------------------
    var path3 = Path();
    path3.moveTo(0, height * 0);

    //path3.quadraticBezierTo(
    //    width * 0.250, height * 0.400, width * 0.50, height * 0.250);
    path3.moveTo(width * 0.50, height * 0.250);
    path3.quadraticBezierTo(
        width * 0.750, height * 0.400, width, height * 0.275);

    path3.lineTo(width, 0);
    path3.lineTo(0, 0);

    canvas.drawPath(path3, paint3);
    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
