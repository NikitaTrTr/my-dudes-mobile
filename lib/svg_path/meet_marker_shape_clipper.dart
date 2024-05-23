import 'package:flutter/material.dart';

class MeetMarkerShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.58, size.height * 0.02);
    path.cubicTo(size.width * 0.58, size.height * 0.02, size.width * 0.92, size.height * 0.19, size.width * 0.92, size.height * 0.19);
    path.cubicTo(size.width * 0.97, size.height * 0.22, size.width, size.height * 0.27, size.width, size.height / 3);
    path.cubicTo(size.width, size.height / 3, size.width, size.height * 0.67, size.width, size.height * 0.67);
    path.cubicTo(size.width, size.height * 0.73, size.width * 0.97, size.height * 0.78, size.width * 0.92, size.height * 0.81);
    path.cubicTo(size.width * 0.92, size.height * 0.81, size.width * 0.58, size.height * 0.98, size.width * 0.58, size.height * 0.98);
    path.cubicTo(size.width * 0.53, size.height, size.width * 0.47, size.height, size.width * 0.42, size.height * 0.98);
    path.cubicTo(size.width * 0.42, size.height * 0.98, size.width * 0.08, size.height * 0.81, size.width * 0.08, size.height * 0.81);
    path.cubicTo(size.width * 0.03, size.height * 0.78, 0, size.height * 0.73, 0, size.height * 0.67);
    path.cubicTo(0, size.height * 0.67, 0, size.height / 3, 0, size.height / 3);
    path.cubicTo(0, size.height * 0.27, size.width * 0.03, size.height * 0.22, size.width * 0.08, size.height * 0.19);
    path.cubicTo(size.width * 0.08, size.height * 0.19, size.width * 0.42, size.height * 0.02, size.width * 0.42, size.height * 0.02);
    path.cubicTo(size.width * 0.47, -0.01, size.width * 0.53, -0.01, size.width * 0.58, size.height * 0.02);
    path.cubicTo(size.width * 0.58, size.height * 0.02, size.width * 0.58, size.height * 0.02, size.width * 0.58, size.height * 0.02);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}