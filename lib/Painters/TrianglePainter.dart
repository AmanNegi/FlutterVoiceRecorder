import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.fill});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepOrange;
      //..maskFilter = MaskFilter.blur(BlurStyle.solid, 10.0);

    Paint paint2 = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.solid, 5.0)
      ..color = Colors.orange;

    canvas.drawPath(getTrianglePath(size.width + 10, size.height + 10), paint2);
    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..moveTo(x * 0.25, 0)
      ..lineTo(x * 0.25, y)
      ..lineTo(x * 0.750, y * 0.50)
      ..lineTo(x * 0.25, 0)
      ..close();
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
