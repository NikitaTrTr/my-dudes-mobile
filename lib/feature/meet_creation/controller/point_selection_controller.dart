import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class PointSelectionController extends GetxController {
  late MapController mapController;

  PointSelectionController() {
    mapController = MapController();
  }
}