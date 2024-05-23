import 'package:get/get.dart';
import 'package:mydudes/feature/profile/controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    var nickname = Get.parameters['nickname'];
    ProfileController profileController = Get.put(ProfileController());
    profileController.fetchUser(nickname!);
  }
}