import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:mydudes/core/model/location.dart';
import 'package:mydudes/core/model/short_meet_data.dart';
import 'package:mydudes/feature/map/controller/map_controller.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';
import 'package:mydudes/core/widget/meet_marker.dart';
import 'package:mydudes/core/widget/user_marker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../feature/map/controller/sliding_up_panel_controller.dart';

class Map extends StatelessWidget {
  final GlobalMapController _mapController = Get.find<GlobalMapController>();
  final MeetController _meetController = Get.find<MeetController>();
  final SlidingUpPanelController _panelController = Get.find();

  final MeetMarker meet = MeetMarker(XFile('assets/images/miqqra.png'));

  final UserMarker miqqra = const UserMarker(
    'assets/images/miqqra.png',
    LatLng(
      54.847488,
      83.092463,
    ),
  );
  final UserMarker avlasov = const UserMarker(
    'assets/images/avlasov.png',
    LatLng(
      54.842951,
      83.091011,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlutterMap(
        mapController: _mapController.mapController,
        options: MapOptions(
          initialCenter: Location(54.842943, 83.091017),
          initialZoom: 15,
          keepAlive: true,
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.mydudes.app',
          ),
          MarkerLayer(
            markers: _mapController.meets
                    .map((element) => Marker(
                          point: element.location,
                          width: 50,
                          height: 50,
                          child: GestureDetector(
                              onTap: () {
                                _panelController
                                    .switchSlidingUpPanels("meetPanel");
                                _meetController.setMeet(element);
                                _meetController.getFullMeet(element.id);
                                _meetController.participants.value = null;
                                _mapController.setMapCenter(element.location);
                              },
                              child: MeetMarker(
                                XFile('assets/images/miqqra.png'),
                              )),
                        ))
                    .toList() +
                [
                  Marker(
                      point: LatLng(
                        54.8475,
                        83.092430,
                      ),
                      width: 50,
                      height: 50,
                      child: GestureDetector(
                          onTap: () {
                            _meetController.setMeet(ShortMeetData(
                              id: 1,
                              creator: "Tyler",
                              name: "Test meet",
                              location: Location(
                                54.8475,
                                83.092430,
                              ),
                              time: Time(startTime: DateTime.now()),
                            ));
                            _panelController.switchSlidingUpPanels("meetPanel");
                            _mapController.setMapCenter(
                              Location(
                                54.8475,
                                83.092430,
                              ),
                            );
                          },
                          child: meet))
                ],
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () =>
                    launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
