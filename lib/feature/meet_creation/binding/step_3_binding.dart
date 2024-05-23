import 'package:get/get.dart';
import 'package:mydudes/feature/meet_creation/controller/point_selection_controller.dart';

class Step3Binding extends Bindings {
  @override
  void dependencies() {
    Get.put(PointSelectionController());
  }
}
