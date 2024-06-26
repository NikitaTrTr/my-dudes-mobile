import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../map/controller/sliding_up_panel_controller.dart';

class GlobalSearchBar extends StatelessWidget {
  final SlidingUpPanelController controller = Get.find();
  final FocusNode focusNode = FocusNode();

  GlobalSearchBar({super.key}) {
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller.openSearchPanel();
      } else {
        controller.closeSearchPanel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      focusNode: focusNode,
      leading: const Icon(
        Icons.search,
        color: Color(0xFF929292),
      ),
      hintText: "Найти мероприятия, миты...",
    );
  }
}
