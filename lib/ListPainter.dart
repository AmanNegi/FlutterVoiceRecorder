import 'package:flutter/material.dart';

class ListPainter extends CustomPainter {
  Color color1;

  ListPainter({this.color1});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color1
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 10.0)
      ..style = PaintingStyle.fill;

    var width = size.width;
    var height = size.height;

    var path1 = Path()
      ..moveTo(0, 0)
      ..moveTo(0, height * 0.250)
      ..quadraticBezierTo(
          width * 0.250, height * 0.400, width * 0.50, height * 0.250)
      ..quadraticBezierTo(width * 0.750, height * 0.050, width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
