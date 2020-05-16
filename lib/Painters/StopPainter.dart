import 'package:flutter/material.dart';

class StopPainter extends CustomPainter {
  Color color;

  StopPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var width = size.width;
    var height = size.height;

    Paint paint = Paint()
      ..color = Colors.orange;
     // ..maskFilter = MaskFilter.blur(BlurStyle.solid, 2.0);

    Path path1 = Path()
      ..moveTo(0, 0)
      ..moveTo(width * 0.20, 0)
      ..lineTo(width * 0.20, height)
      ..lineTo(width * 0.40, height)
      ..lineTo(width * 0.40, 0)
      ..lineTo(width * 0.20, 0)
      ..close();

    Path path2 = Path()
      ..moveTo(0, 0)
      ..moveTo(width * 0.60, 0)
      ..lineTo(width * 0.60, height)
      ..lineTo(width * 0.80, height)
      ..lineTo(width * 0.80, 0)
      ..lineTo(width * 0.60, 0)
      ..close();

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(StopPainter oldDelegate) {
    return false;
  }
}
