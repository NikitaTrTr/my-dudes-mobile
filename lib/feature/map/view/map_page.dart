import 'package:flutter/material.dart';
import 'package:mydudes/feature/navigation/navigation_bar.dart';
import 'map_overlay.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapOverlay(),
      bottomNavigationBar: NavigationBarWidget(),
      resizeToAvoidBottomInset: false,
    );
  }
}
