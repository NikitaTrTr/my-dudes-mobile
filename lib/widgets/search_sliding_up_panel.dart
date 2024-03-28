import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/widgets/search_bar.dart';

import '../controllers/controller.dart';

class SearchPanelWidget extends StatelessWidget {
  final SlidingUpPanelController getController = Get.find();
  final ScrollController scrollController;

  SearchPanelWidget({
    super.key,
    required this.scrollController
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 5),
      children: [buildDragHandle(context), GlobalSearchBar()],
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
