import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/meet_creation/meet_creation_controller.dart';

class MeetCreationStep2 extends StatelessWidget {
  final MeetCreationController _meetCreationController = Get.find<MeetCreationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Step2"),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _meetCreationController.nextStep();
          Get.toNamed(MeetCreationLinks.STEP_3);
        },
      ),
    );
  }
}
