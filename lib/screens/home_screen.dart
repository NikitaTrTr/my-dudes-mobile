import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';
import '../widgets/navigation_bar.dart';
import 'map_overlay.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SlidingUpPanelController());

    return Scaffold(
      body: MapOverlay(),
      bottomNavigationBar: NavigationBarWidget(),
      resizeToAvoidBottomInset: false,
    );
  }
}
