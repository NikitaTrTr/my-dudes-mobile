import 'package:get/get.dart';
import 'package:mydudes/core/repository/meet_repo_impl.dart';

import '../../../core/model/data/create_meet_form_data.dart';

class MeetCreationController extends GetxController {
  Rx<String> link = Rx("");
  Rx<CreateMeetFormData> formData = CreateMeetFormData().obs;
  Rx<bool> isLoading = false.obs;

  final MeetRepoImpl meetRepo = Get.find<MeetRepoImpl>();

  Future createMeetFromDobro() async {
    try {
      meetRepo.createMeetFromDobro(link.value);
    } finally {}
  }

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
