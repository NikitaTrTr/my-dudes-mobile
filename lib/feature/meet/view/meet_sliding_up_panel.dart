import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mydudes/core/widget/options_bottomsheet/action.dart';
import 'package:mydudes/core/widget/options_bottomsheet/options_bottomsheet.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';
import 'package:mydudes/feature/meet/view/tabs/main/main_tab.dart';
import 'package:mydudes/feature/meet/view/tabs/participants/participants_tab.dart';
import '../../map/controller/sliding_up_panel_controller.dart';

class MeetPanelWidget extends StatelessWidget {
  final SlidingUpPanelController panelController =
      Get.find<SlidingUpPanelController>();
  final ScrollController scrollController;
  final MeetController _meetController = Get.find<MeetController>();

  MeetPanelWidget({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Obx(() => _meetController.isLoading.isFalse
        ? Padding(
            padding:
                const EdgeInsets.only(bottom: 5, left: 3, right: 3, top: 10),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BackButton(
                                onPressed: () {
                                  panelController.switchSlidingUpPanels(
                                      "globalSearchPanel");
                                  panelController.closeSearchPanel();
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 258,
                                    child: Text(
                                      _meetController.meet.value?.name ??
                                          "Без названия",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "Пирогова, 18 ${_meetController.meet.value?.time.startTime != null ? "· ${getTime(_meetController.meet.value!.time.startTime)}" : ""} · ID:${_meetController.meet.value!.id}",
                                    style: const TextStyle(
                                        color: Color(0xFFA9A9A9)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _showExtraMeetActions(context);
                            },
                            icon: const Icon(Icons.more_vert)),
                      ],
                    ),
                  )
                ],
              ),
              DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      TabBar(
                        dividerHeight: 0,
                        tabs: [
                          Tab(
                            icon: Icon(Icons.home_outlined),
                          ),
                          Tab(
                            icon: Icon(Icons.people_outline),
                          ),
                          Tab(
                            icon: Icon(Icons.map_outlined),
                          ),
                          Tab(
                            icon: Icon(Icons.settings_outlined),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.658,
                        // Set a height for the TabBarView
                        child: TabBarView(
                          children: [
                            // Your TabBarView children
                            MainTabWidget(scrollController: scrollController),
                            ParticipantsTabWidget(
                                scrollController: scrollController),
                            ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                              return const ListTile(
                                title: Text("Hello"),
                              );
                            }),
                            ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                              return const ListTile(
                                title: Text("Hello"),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ))
            ]),
          )
        : const Positioned(
            top: 10,
            child: SizedBox(
                height: 10,
                width: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                )),
          ));
  }

  String getTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute} ${dateTime.day}.${dateTime.month}.${dateTime.year}';
  }

  void _showExtraMeetActions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return OptionsBottomSheet([
            OptionsBottomSheetAction(
                icon: Icons.share,
                actionName: "Поделиться",
                actionFunction: () {}),
            OptionsBottomSheetAction(
                icon: Icons.warning_amber_rounded,
                actionName: "Пожаловаться",
                actionFunction: () {}),
            OptionsBottomSheetAction(
                icon: Icons.delete_forever,
                actionName: "Удалить встречу",
                actionFunction: () {})
          ]);
        });
  }
}
