import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/controllers/user_controller.dart';
import 'package:mydudes/feature/map/controller/sliding_up_panel_controller.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';
import 'package:mydudes/feature/meet/view/meet_picture.dart';

class MainTabWidget extends StatelessWidget {
  final ScrollController scrollController;
  final MeetController _meetController = Get.find<MeetController>();
  final UserController _userController = Get.find<UserController>();

  MainTabWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        MeetPicture(),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF363636)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Описание",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    color: Color(0xFFA9A9A9),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "${_meetController.fullMeet.value?.description}",
                                style: const TextStyle(
                                    fontFamily: "Inter", fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ))),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              children: [
                (!_meetController.fullMeet.value!.participants.any(
                        (element) => _userController.nickname.value == element))
                    ? SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: FloatingActionButton.small(
                                  backgroundColor: Colors.orange,
                                  elevation: 0,
                                  onPressed: () {
                                    _meetController.joinMeet();
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.join_full,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Вступить",
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ))
                    : SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: FloatingActionButton.small(
                                  backgroundColor: const Color(0xFF363636),
                                  elevation: 0,
                                  onPressed: () {},
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.chat,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Чат",
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: FloatingActionButton.small(
                                  elevation: 0,
                                  backgroundColor: const Color(0xFF693636),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.exit_to_app,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Выйти",
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                  onPressed: () {
                                    _meetController.leaveMeet();
                                  }),
                            )
                          ],
                        )),
              ],
            )),
      ],
    );
  }
}
