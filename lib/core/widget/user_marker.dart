import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class UserMarker extends StatelessWidget {
  final String imagePath;
  final LatLng point;
  final double borderWidth = 2.0;
  final double width = 50.0;
  final double height = 50.0;
  final Color borderColor = Colors.black;

  const UserMarker(
    this.imagePath,
    this.point,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
