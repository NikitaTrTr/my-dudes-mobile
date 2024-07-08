import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';

class MeetTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final MeetController meetController = Get.find();

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(_handleTabChange);
  }

  @override
  void onClose() {
    tabController.removeListener(_handleTabChange);
    tabController.dispose();
    super.onClose();
  }

  void _handleTabChange() {
    if (tabController.indexIsChanging) {
      if (tabController.index == 1) {
        if (meetController.fullMeet.value != null) {
          meetController.getFullMeet(meetController.meetId);
          meetController.getParticipants(meetController.fullMeet.value!.participants);
          // meetController
          //     .getParticipants(meetController.fullMeet.value!.participants);
        }
      }
    }
  }
}
