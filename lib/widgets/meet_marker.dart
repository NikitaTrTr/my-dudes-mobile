import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mydudes/controllers/controller.dart';
import 'package:mydudes/svg_path/clipper.dart';
import 'package:mydudes/svg_path/painter.dart';

class MeetMarker extends StatelessWidget {
  final String imagePath;
  final LatLng point;
  final double borderWidth = 2.0;
  final double width = 50.0;
  final double height = 50.0;
  final Color borderColor = Colors.black;

  const MeetMarker(
    this.imagePath,
    this.point,
  );

  @override
  Widget build(BuildContext buildContext) {
    SlidingUpPanelController panelController = Get.find();
    return GestureDetector(
      onTap: () {
        panelController.switchSlidingUpPanels("meetPanel");
      },
      child: CustomPaint(
          painter: Painter(),
          child: ClipPath(
              clipper: MeetClipper(),
              child: Container(
                  width: width,
                  height: height,
                  child: Image.asset(
                    imagePath,
                  )))),
    );
  }
}
