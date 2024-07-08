import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:mydudes/core/model/location.dart';
import 'package:mydudes/core/model/data/short_meet_data.dart';
import 'package:mydudes/feature/map/controller/map_controller.dart';
import 'package:mydudes/feature/meet/controller/meet_controller.dart';
import 'package:mydudes/core/widget/meet_marker.dart';
import 'package:mydudes/core/widget/user_marker.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../feature/map/controller/sliding_up_panel_controller.dart';
import '../../feature/meet/controller/meet_tab_controller.dart';

class Map extends StatelessWidget {
  final GlobalMapController _mapController = Get.find<GlobalMapController>();
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
                                Get.put(MeetController(element.id));
                                Get.put(MeetTabController());
                                _mapController.setMapCenter(element.location);
                              },
                              child: MeetMarker(
                                XFile('assets/images/miqqra.png'),
                              )),
                        ))
                    .toList()
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
