import 'package:flutter/material.dart';

class SlidingUpPanelState {
  double? snapPoint;
  double minHeight;
  double maxHeight;
  Widget Function(ScrollController) panelBuilder;

  SlidingUpPanelState(
      {this.snapPoint,
      required this.minHeight,
      required this.maxHeight,
      required this.panelBuilder});
}
