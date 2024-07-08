import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/controllers/navigation_bar_controller.dart';
import 'package:mydudes/core/widget/options_bottomsheet/action.dart';
import 'package:mydudes/core/widget/options_bottomsheet/options_bottomsheet.dart';
import 'package:mydudes/feature/meet_creation/controller/meet_creation_controller.dart';
import 'package:mydudes/feature/navigation/widget/add_action/add_action.dart';

class NavigationBarWidget extends StatelessWidget {
  final BottomNavigationBarController barController =
      Get.find<BottomNavigationBarController>();

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
          Get.put(MeetCreationController());
          _showCreateMeetActions(context);
          break;
        }
    }
  }

  void _showCreateMeetActions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) => CreateMeetActions());
  }
}
