import 'package:get/get.dart';
import 'package:mydudes/core/model/meet_data.dart';
import 'package:mydudes/core/model/short_meet_data.dart';
import 'package:mydudes/core/model/user.dart';
import 'package:mydudes/core/repository/meet_repo_impl.dart';
import 'package:mydudes/core/repository/user_repo_impl.dart';

class MeetController extends GetxController {
  Rx<ShortMeetData?> meet = Rx<ShortMeetData?>(null);

  Rx<MeetData?> fullMeet = Rx<MeetData?>(null);

  Rx<List<User>?> participants = Rx<List<User>?>(null);

  Rx<String> link = Rx("");

  //FIXME
  Rx<bool> isLoading = true.obs;
  Rx<bool> participantsLoading = true.obs;

  final MeetRepoImpl meetRepo = Get.find<MeetRepoImpl>();
  final UserRepoImpl userRepo = Get.find<UserRepoImpl>();

  Future createMeetFromDobro() async {
    try {
      meetRepo.createMeetFromDobro(link.value);
    } finally {}
  }

  Future<User> getUser(String id) async {
    try {
      User user = await userRepo.getUser(id);
      return user;
    } finally {}
  }

  Future joinMeet() async {
    try {
      meetRepo.joinMeet(meet.value!.id);
    } finally {
      participants.value = null;
      fetchUsers(fullMeet.value?.participants ?? []);
    }
    participants.value = null;
    fetchUsers(fullMeet.value?.participants ?? []);
  }

  Future leaveMeet() async {
    try {
      meetRepo.leaveMeet(meet.value!.id);
    } finally {
      participants.value = null;
      fetchUsers(fullMeet.value?.participants ?? []);
    }
    participants.value = null;
    fetchUsers(fullMeet.value?.participants ?? []);
  }

  Future fetchUsers(List<String> ids) async {
    participantsLoading.value = true;
    try {
      List<Future<User>> futures = ids.map((id) => getUser(id)).toList();
      List<User> users = await Future.wait(futures);
      participants.value = users;
    } finally {
      participantsLoading.value = false;
    }
  }

  Future kickUser(String id) async {
    meetRepo.kickUser(fullMeet.value!.id, id);
    fetchUsers(fullMeet.value?.participants ?? []);
  }

  Future getFullMeet(int id) async {
    isLoading.value = true;
    try {
      MeetData meetData = await meetRepo.getMeet(id);
      fullMeet.value = meetData;
    } finally {
      isLoading.value = false;
    }
  }

  void setMeet(ShortMeetData meet) {
    this.meet.value = meet;
  }
}
