import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/core/widget/options_bottomsheet/action.dart';
import 'package:mydudes/core/widget/options_bottomsheet/options_bottomsheet.dart';
import 'package:mydudes/core/widget/random_gradient_image.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';

//TODO Name properly
class Participant extends StatelessWidget {
  final Image image;
  final String name;
  final String id;
  final String? role;

  final MeetController _meetController = Get.find();

  Participant(
      {super.key,
      required this.image,
      required this.name,
      this.role,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.toNamed(AppLinks.PROFILE, parameters: {"nickname": id});
          },
          onLongPress: () {
            _showParticipantActions(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListTile(
              leading: Container(
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(500)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                      height: 40, width: 50, child: RandomGradientImage()),
                ),
              ),
              title: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: "Inter"),
              ),
              horizontalTitleGap: 7,
              contentPadding: const EdgeInsets.all(0),
              subtitle: Text(
                role ?? "участник",
                style: const TextStyle(
                    fontFamily: "Inter", color: Color(0xFF6C6C6C)),
              ),
            ),
          ),
        ));
  }

  void _showParticipantActions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return OptionsBottomSheet([
            OptionsBottomSheetAction(
                icon: Icons.person,
                actionName: "Открыть профиль",
                actionFunction: () {}),
            OptionsBottomSheetAction(
                icon: Icons.person_add,
                actionName: "Добавить в Dudes",
                actionFunction: () {}),
            OptionsBottomSheetAction(
                icon: Icons.supervised_user_circle_rounded,
                actionName: "Изменить роль",
                actionFunction: () {}),
            OptionsBottomSheetAction(
                icon: Icons.leave_bags_at_home,
                actionName: "Выгнать",
                actionFunction: () {
                  _meetController.kickUser(id);
                })
          ]);
        });
  }
}
