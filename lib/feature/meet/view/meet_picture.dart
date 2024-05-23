import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydudes/app_links.dart';
import 'package:mydudes/core/widget/random_gradient_image.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';

class MeetPicture extends StatelessWidget {
  final MeetController _meetController = Get.find<MeetController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: SizedBox(
        height: 110,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: RandomGradientImage()),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TODO Isolate to other class
                    Material(
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(AppLinks.PROFILE, parameters: {"nickname": _meetController.fullMeet.value?.creator.nickname ?? ""});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(500)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(500),
                                child: const RandomGradientImage(),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${_meetController.fullMeet.value?.creator.firstName} ${_meetController.fullMeet.value?.creator.lastName}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Inter"),
                                ),
                                Text(
                                  "${_meetController.fullMeet.value?.creator.nickname}",
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      color: Color(0xFF6C6C6C)),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
