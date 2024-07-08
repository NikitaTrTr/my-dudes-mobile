import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydudes/app_links.dart';
import 'dart:io';

import '../controller/meet_creation_controller.dart';

class MeetCreationStep1 extends StatelessWidget {
  final MeetCreationController _meetCreationController =
      Get.find<MeetCreationController>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(forceMaterialTransparency: true),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Название",
                          style: TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: _textEditingController,
                          onChanged: (value) {
                            _meetCreationController.formData.update((val) {
                              val!.name = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Пикча",
                          style: TextStyle(
                              fontSize: 32.0, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                              width: double.infinity,
                              height: 300.0,
                              decoration: BoxDecoration(
                                  image: _meetCreationController
                                              .formData.value.image !=
                                          null
                                      ? DecorationImage(
                                          image: FileImage(
                                            File(_meetCreationController
                                                .formData.value.image!.path),
                                          ),
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.3),
                                              BlendMode.darken))
                                      : null,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                      color: Colors.white, width: 3)),
                              child: Stack(children: [
                                Center(
                                  child: _meetCreationController
                                              .formData.value.image ==
                                          null
                                      ? const Icon(
                                          Icons.photo,
                                          size: 40,
                                        )
                                      : null,
                                ),
                                if (_meetCreationController
                                        .formData.value.image !=
                                    null)
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                          onPressed: () => {
                                                _meetCreationController.formData
                                                    .update((val) {
                                                  val!.image = null;
                                                })
                                              },
                                          icon: const Icon(Icons.delete)))
                              ])),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
          resizeToAvoidBottomInset: false,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                label: const Text(
                  "Продолжить",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.orange,
                onPressed: () {
                  Get.toNamed(MeetCreationLinks.STEP_2);
                },
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    _meetCreationController.formData.update((val) {
      val!.image = image;
    });
  }
}
