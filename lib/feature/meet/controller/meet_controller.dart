import 'dart:async';

import 'package:get/get.dart';
import 'package:mydudes/core/model/data/meet_data.dart';
import 'package:mydudes/core/model/data/user.dart';
import 'package:mydudes/core/repository/meet_repo_impl.dart';
import 'package:mydudes/core/repository/user_repo_impl.dart';

class MeetController extends GetxController {
  late int meetId;

  Rx<MeetData?> fullMeet = Rx<MeetData?>(null);

  RxList<User?> participants = RxList<User?>([]);
  Timer? _participantsPollTimer;

  MeetController(int id) {
    meetId = id;
  }

  @override
  void onInit() {
    super.onInit();
    getFullMeet(meetId);
    _startPolling();
  }

  @override
  void onClose() {
    _participantsPollTimer?.cancel();
    super.onClose();
  }

  void _startPolling() {
    _participantsPollTimer =
        Timer.periodic(const Duration(seconds: 10), (timer) async {
      if (fullMeet.value != null) {
        getFullMeet(meetId);
        getParticipants(fullMeet.value!.participants);
      }
    });
  }

  RxMap<String, bool> loadingMap = <String, bool>{}.obs;

  final MeetRepoImpl meetRepo = Get.find<MeetRepoImpl>();
  final UserRepoImpl userRepo = Get.find<UserRepoImpl>();

  Future<User> getUser(String id) async {
    try {
      User user = await userRepo.getUser(id);
      return user;
    } finally {}
  }

  Future joinMeet() async {
    try {
      meetRepo.joinMeet(meetId);
    } finally {
      await getFullMeet(meetId);
      getParticipants(fullMeet.value!.participants);
    }
  }

  Future leaveMeet() async {
    try {
      meetRepo.leaveMeet(meetId);
    } finally {
      await getFullMeet(meetId);
      getParticipants(fullMeet.value!.participants);
    }
  }

  Future getParticipants(List<String> ids) async {
    loadingMap['participants'] = true;
    try {
      List<Future<User>> futures = ids.map((id) => getUser(id)).toList();
      List<User> users = await Future.wait(futures);
      participants = users.obs;
    } finally {
      loadingMap['participants'] = false;
    }
  }

  Future kickUser(String id) async {
    meetRepo.kickUser(fullMeet.value!.id, id);
    getParticipants(fullMeet.value?.participants ?? []);
  }

  Future getFullMeet(int id) async {
    try {
      MeetData meetData = await meetRepo.getMeet(id);
      fullMeet.value = meetData;
    } finally {
    }
  }
}
