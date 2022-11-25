import 'package:cred_progress_bar/src/utils/thumb_shape.dart';
import 'package:flutter/material.dart';

class CredThumb extends StatelessWidget {
  const CredThumb({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
  }) : super(key: key);

  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ThumbShapePainter(color: color),
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }
}
