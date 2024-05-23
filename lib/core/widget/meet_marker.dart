import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydudes/core/widget/random_gradient_image.dart';
import 'package:mydudes/svg_path/meet_marker_shape_clipper.dart';
import 'package:mydudes/svg_path/painter.dart';

class MeetMarker extends StatelessWidget {
  final XFile? image;
  final double borderWidth = 2.0;
  final double width = 50.0;
  final double height = 50.0;
  final Color borderColor = Colors.black;

  const MeetMarker(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CustomPaint(
          painter: Painter(),
          child: ClipPath(
              clipper: MeetMarkerShapeClipper(),
              child: SizedBox(
                  width: width,
                  height: height,
                  child: const RandomGradientImage()))),
    );
  }
}
