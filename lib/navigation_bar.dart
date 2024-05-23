import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/controllers/navigation_bar_controller.dart';
import 'package:mydudes/core/widget/options_bottomsheet/action.dart';
import 'package:mydudes/core/widget/options_bottomsheet/options_bottomsheet.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';
import 'package:mydudes/feature/meet_creation/controller/meet_creation_controller.dart';

class NavigationBarWidget extends StatelessWidget {
  final BottomNavigationBarController barController =
      Get.find<BottomNavigationBarController>();
  final MeetController _meetController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        barController.setStep(index);
        _selectTab(context);
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Карта',
          icon: Icon(Icons.map_outlined),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          label: 'Мессенжер',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
        BottomNavigationBarItem(
          label: 'Миты',
          icon: Icon(Icons.collections_bookmark),
        ),
        BottomNavigationBarItem(
          label: 'Сервисы',
          icon: Icon(Icons.grid_view),
        ),
      ],
      showUnselectedLabels: false,
      iconSize: 28,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      // Customize the font size and other styles as needed
    );
  }

  void _selectTab(BuildContext context) {
    switch (barController.currentIndex.value) {
      case 0:
        {
          break;
        }
      case 1:
        {
          break;
        }
      case 2:
        {
          _showCreateMeetActions(context);
          break;
        }
    }
  }

  void _showCreateMeetActions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return OptionsBottomSheet([
            OptionsBottomSheetAction(
                icon: Icons.create,
                actionName: "Создать встречу",
                actionFunction: () {
                  Get.put(MeetCreationController());
                  Get.toNamed(MeetCreationLinks.STEP_1);
                }),
            OptionsBottomSheetAction(
                icon: Icons.link,
                actionName: "Добавить из Добро.ру",
                actionFunction: () {
                  _showDobroActions(context);
                })
          ]);
        });
  }

  void _showDobroActions(BuildContext context) {
    TextEditingController linkController = TextEditingController();

    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1B1B1B),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ссылка на мероприятие",
                        style: TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: linkController,
                        onChanged: (value) {
                          _meetController.link.value = value;
                        },
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: FloatingActionButton.extended(
                          label: const Text(
                            "Создать",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.pink,
                          onPressed: () {
                            _meetController.createMeetFromDobro();
                          },
                        ),
                      ),
                    ],
                  )));
        });
  }
}
