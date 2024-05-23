import 'package:get/get.dart';
import 'package:mydudes/core/repository/meet_repo_impl.dart';

import '../create_meet_form_data.dart';

class MeetCreationController extends GetxController {
  Rx<CreateMeetFormData> formData = CreateMeetFormData().obs;
  Rx<bool> isLoading = false.obs;

  final MeetRepoImpl meetRepo = Get.find<MeetRepoImpl>();

  Future createMeet() async {
    isLoading.value = true;
    try {
      formData.value.startTime = DateTime.now();
      var response = await meetRepo.createMeet(formData.value);
      print(response);
    } finally {
      isLoading.value = false;
    }
  }
}
