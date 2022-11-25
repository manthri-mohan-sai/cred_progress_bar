import 'package:flutter/material.dart';

class ThumbShapePainter extends CustomPainter {
  ThumbShapePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.4971264);
    path_0.cubicTo(0, size.height * 0.5, size.width * 0.0, size.height * 0.5,
        size.width * 0.0, size.height * 0.5);
    path_0.cubicTo(size.width * 0.25, size.height * 0.5, size.width * 0.5,
        size.height * 0.3, size.width * 0.5, size.height * 0.0);
    path_0.cubicTo(size.width * 0.5, size.height * 0.0, size.width * 0.5,
        size.height * 0.0, size.width * 0.5, 0);
    path_0.cubicTo(size.width * 0.5, size.height * 0.0, size.width * 0.5,
        size.height * 0.0, size.width * 0.5, size.height * 0.0);
    path_0.cubicTo(size.width * 0.5, size.height * 0.3, size.width * 0.7,
        size.height * 0.5, size.width, size.height * 0.5);
    path_0.cubicTo(size.width, size.height * 0.5, size.width, size.height * 0.5,
        size.width, size.height * 0.5);
    path_0.cubicTo(size.width, size.height * 0.5, size.width, size.height * 0.5,
        size.width, size.height * 0.5);
    path_0.cubicTo(size.width * 0.75, size.height * 0.5, size.width * 0.5,
        size.height * 0.7, size.width * 0.5, size.height);
    path_0.cubicTo(size.width * 0.5, size.height, size.width * 0.5, size.height,
        size.width * 0.5, size.height);
    path_0.cubicTo(size.width * 0.5, size.height, size.width * 0.5, size.height,
        size.width * 0.5, size.height);
    path_0.cubicTo(size.width * 0.5, size.height * 0.7, size.width * 0.25,
        size.height * 0.5, size.width * 0.0, size.height * 0.5);
    path_0.cubicTo(size.width * 0.0, size.height * 0.5, size.width * 0.0,
        size.height * 0.5, 0, size.height * 0.5);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
