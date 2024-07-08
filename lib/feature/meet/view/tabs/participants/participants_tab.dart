import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';
import 'package:mydudes/feature/meet/view/tabs/participants/participant.dart';
import 'package:mydudes/feature/meet/view/tabs/participants/participants_list.dart';

class ParticipantsTabWidget extends StatelessWidget {
  final ScrollController scrollController;
  final MeetController _meetController = Get.find<MeetController>();

  ParticipantsTabWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(children: [
        ParticipantsList(_meetController.fullMeet.value?.participants ?? [], scrollController)
        // ListView(
        //     padding: const EdgeInsets.symmetric(vertical: 0),
        //     controller: scrollController,
        //     children: _addDividers(_meetController.participants
        //         .map((e) => Participant(
        //               image: Image.asset("assets/images/miqqra.png"),
        //               name: "${e?.firstName} ${e?.lastName}",
        //               id: e!.nickname,
        //             ))
        //         .toList()))
      ]);
    });
  }

  List<Widget> _addDividers(List<Widget> widgets) {
    List<Widget> dividedWidgets = widgets
        .expand((element) => [
              element,
              const Divider(
                height: 0,
                color: Color(0xFF525252),
              )
            ])
        .toList();
    if (dividedWidgets.isNotEmpty) {
      dividedWidgets.removeLast();
    }
    return dividedWidgets;
  }
}
