import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';

class MeetPanelWidget extends StatelessWidget {
  final SlidingUpPanelController getController = Get.find<SlidingUpPanelController>();
  final ScrollController scrollController;

  MeetPanelWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  BackButton(
                    onPressed: () {
                      getController.switchSlidingUpPanels("globalSearchPanel");
                      getController.closeSearchPanel();
                    },
                  ),
                ],
              ))
            ],
          )
        ],
      ),
    );
  }

  Widget buildDragHandle(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          width: 60,
          height: 5,
          decoration: const BoxDecoration(
            color: Color(0xFF6B6B6B),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          margin: const EdgeInsets.symmetric(vertical: 9),
        ),
      ),
    );
  }
}
