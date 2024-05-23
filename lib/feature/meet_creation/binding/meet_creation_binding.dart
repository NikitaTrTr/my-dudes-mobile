import 'package:get/get.dart';

import '../controller/meet_creation_controller.dart';

class MeetCreationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MeetCreationController());
  }
}