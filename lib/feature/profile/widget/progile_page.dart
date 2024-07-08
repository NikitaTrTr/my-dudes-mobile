import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/core/widget/options_bottomsheet/action.dart';
import 'package:mydudes/core/widget/options_bottomsheet/options_bottomsheet.dart';
import 'package:mydudes/core/widget/random_gradient_image.dart';

import '../controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Row(
            children: [
              Text(
                "#${_profileController.user.value?.nickname}",
                style: const TextStyle(
                    fontFamily: "Inter", fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    _showExtraProfileActions(context);
                  },
                  icon: const Icon(Icons.more_vert)),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(500)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: const RandomGradientImage(),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "${_profileController.user.value?.firstName} ${_profileController.user.value?.lastName}",
                    style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: FloatingActionButton.small(
                            backgroundColor: Colors.orange,
                            elevation: 0,
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_add,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Добавить в Dudes",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        flex: 0,
                        child: FloatingActionButton.small(
                            elevation: 0,
                            backgroundColor: const Color(0xFF363636),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.message,
                                  size: 18,
                                ),
                              ],
                            ),
                            onPressed: () {}),
                      ),
                      Expanded(
                        flex: 0,
                        child: FloatingActionButton.small(
                            elevation: 0,
                            backgroundColor: const Color(0xFF363636),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call,
                                  size: 18,
                                ),
                              ],
                            ),
                            onPressed: () {}),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  padding: EdgeInsets.zero,
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
                                      "О себе",
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
                                      "${_profileController.user.value?.info}",
                                      style: const TextStyle(
                                          fontFamily: "Inter", fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
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
                                      "Дата рождения",
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
                                      "${_profileController.user.value?.birthDate?.day}.${_profileController.user.value?.birthDate?.month}.${_profileController.user.value?.birthDate?.year}",
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
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
      );
    });
  }

  void _showExtraProfileActions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return OptionsBottomSheet([
            OptionsBottomSheetAction(
                icon: Icons.share,
                actionName: "Поделиться",
                actionFunction: () {}),
            OptionsBottomSheetAction(
                icon: Icons.edit,
                actionName: "Редактировать",
                actionFunction: () {}),
            OptionsBottomSheetAction(
                icon: Icons.warning_amber_rounded,
                actionName: "Пожаловаться",
                actionFunction: () {})
          ]);
        });
  }
}
