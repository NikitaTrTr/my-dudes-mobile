import 'package:get/get.dart';
import 'package:mydudes/feature/map/controller/map_controller.dart';
import 'package:mydudes/feature/map/controller/sliding_up_panel_controller.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SlidingUpPanelController());
    Get.put(GlobalMapController());
    Get.put(MeetController());
  }
}
