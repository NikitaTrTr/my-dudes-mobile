import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/core/model/meet_visibility.dart';
import 'package:mydudes/core/widget/slider/slider_widget.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../controller/meet_creation_controller.dart';

class MeetCreationStep2 extends StatelessWidget {
  final MeetCreationController _meetCreationController =
      Get.find<MeetCreationController>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(forceMaterialTransparency: true),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Описание",
                          style: TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          maxLines: 3,
                          controller: _textEditingController,
                          onChanged: (value) {
                            _meetCreationController.formData.update((val) {
                              val!.description = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Для кого",
                          style: TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                        ),
                        ToggleSwitch(
                          minHeight: 45,
                          cornerRadius: 15,
                          minWidth: double.infinity,
                          animate: true,
                          animationDuration: 150,
                          radiusStyle: true,
                          inactiveBgColor: Colors.white,
                          activeFgColor: Colors.white,
                          activeBgColor: const [Colors.orangeAccent],
                          borderColor: const [Colors.white],
                          borderWidth: 3,
                          initialLabelIndex: _indexFromMeetVisibility(
                              _meetCreationController
                                      .formData.value.visibility ??
                                  MeetVisibility.friends),
                          totalSwitches: 2,
                          labels: const ['Для друзей', 'Для всех'],
                          onToggle: (index) {
                            switch (index) {
                              case 0:
                                _meetCreationController.formData.update((val) {
                                  if (val != null) {
                                    val.visibility = MeetVisibility.friends;
                                  }
                                });
                              case 1:
                                _meetCreationController.formData.update((val) {
                                  if (val != null) {
                                    val.visibility = MeetVisibility.all;
                                  }
                                });
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Кол-во участников",
                          style: TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                        ),
                        SliderWidget(
                          min: 2,
                          max: 30,
                          fullWidth: true,
                          sliderHeight: 55.0,
                          value: _meetCreationController
                                  .formData.value.limits?.obs ??
                              2.obs,
                          onChange: (newValue) => {
                            _meetCreationController.formData.update((val) {
                              val?.limits = newValue.toInt();
                            })
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
          resizeToAvoidBottomInset: false,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                label: const Text(
                  "Продолжить",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.orange,
                onPressed: () {
                  Get.toNamed(MeetCreationLinks.STEP_3);
                },
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }

  int _indexFromMeetVisibility(MeetVisibility meetVisibility) {
    switch (meetVisibility) {
      case MeetVisibility.all:
        return 1;
      case MeetVisibility.friends:
        return 0;
      case MeetVisibility.closeFriends:
        throw Exception("Illegal state");
    }
  }
}
