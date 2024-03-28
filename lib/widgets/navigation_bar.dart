import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/controllers/navigation_bar_controller.dart';
import 'package:mydudes/meet_creation/meet_creation_controller.dart';

class NavigationBarWidget extends StatelessWidget {
  final BottomNavigationBarController barController =
      Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        barController.setStep(index);
        _selectTab();
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
          icon: Icon(Icons.meeting_room),
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

  void _selectTab() {
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
          Get.put(MeetCreationController());
          Get.toNamed(MeetCreationLinks.STEP_1);
          break;
        }
    }
  }
}
