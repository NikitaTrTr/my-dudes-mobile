import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:mydudes/core/model/location.dart';
import 'package:mydudes/core/widget/position_selection/position_pin.dart';
import 'package:mydudes/feature/meet_creation/controller/point_selection_controller.dart';
import 'package:mydudes/core/widget/meet_marker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mydudes/app_links.dart';
import '../controller/meet_creation_controller.dart';

class MeetCreationStep3 extends StatelessWidget {
  final MeetCreationController _meetCreationController =
      Get.find<MeetCreationController>();
  final PointSelectionController _pointSelectionController =
      Get.find<PointSelectionController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              FlutterMap(
                  options: MapOptions(
                      initialCenter: Location(54.842943, 83.091017),
                      initialZoom: 15,
                      keepAlive: true,
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                      ),
                      onPositionChanged: (MapPosition pos, bool _) {
                        _meetCreationController.formData.update((val) {
                          val?.location = Location(
                              pos.center!.latitude, pos.center!.longitude);
                        });
                      }),
                  mapController: _pointSelectionController.mapController,
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.mydudes.app',
                    ),
                    MarkerLayer(markers: [
                      if (_meetCreationController.formData.value.location !=
                          null)
                        Marker(
                            width: 55.0,
                            height: 120.0,
                            point: _meetCreationController
                                .formData.value.location!,
                            child: PositionPin(
                                head: MeetMarker(_meetCreationController
                                    .formData.value.image))),
                    ]),
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () => launchUrl(
                              Uri.parse('https://openstreetmap.org/copyright')),
                        ),
                      ],
                    ),
                  ]),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                label: const Text(
                  "Завершить",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.orange,
                onPressed: () {
                  _meetCreationController.createMeet();
                  Get.toNamed(AppLinks.MAP);
                },
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
