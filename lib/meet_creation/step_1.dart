import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/meet_creation/meet_creation_controller.dart';

class MeetCreationStep1 extends StatelessWidget {
  final MeetCreationController _meetCreationController = Get.find<MeetCreationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {

        },
      ),
    );
  }
}
