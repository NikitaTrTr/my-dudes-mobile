import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mydudes/core/widget/map.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controller/sliding_up_panel_controller.dart';

class MapOverlay extends StatelessWidget {
  final SlidingUpPanelController controller = Get.find<SlidingUpPanelController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SlidingUpPanel(
        controller: controller.panelController,
        minHeight: MediaQuery.of(context).size.height *
            controller.slidingUpPanelState.value.minHeight,
        maxHeight: MediaQuery.of(context).size.height *
            controller.slidingUpPanelState.value.maxHeight,
        color: Theme.of(context).scaffoldBackgroundColor,
        parallaxEnabled: true,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
        body: Map(),
        panelBuilder: controller.slidingUpPanelState.value.panelBuilder));
  }
}
