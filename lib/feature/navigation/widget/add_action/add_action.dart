import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/core/widget/options_bottomsheet/action.dart';
import 'package:mydudes/core/widget/options_bottomsheet/options_bottomsheet.dart';
import 'package:mydudes/feature/meet_creation/controller/meet_creation_controller.dart';

class CreateMeetActions extends StatelessWidget {
  MeetCreationController _meetCreationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return OptionsBottomSheet([
      OptionsBottomSheetAction(
          icon: Icons.create,
          actionName: "Создать встречу",
          actionFunction: () {
            Get.toNamed(MeetCreationLinks.STEP_1);
          }),
      OptionsBottomSheetAction(
        icon: Icons.link,
        actionName: "Добавить из Добро.ру",
        actionFunction: () {
          _showDobroActions(context);
        },
      ),
    ]);
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
                          _meetCreationController.link.value = value;
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
                            _meetCreationController.createMeetFromDobro();
                          },
                        ),
                      ),
                    ],
                  )));
        });
  }
}
