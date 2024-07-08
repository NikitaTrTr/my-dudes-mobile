import 'dart:async';
import 'dart:ui';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mydudes/controllers/user_controller.dart';
import 'package:mydudes/core/model/location.dart';
import 'package:mydudes/core/model/data/short_meet_data.dart';
import 'package:mydudes/core/repository/meet_repo_impl.dart';

class GlobalMapController extends GetxController {
  late MapController mapController;

  late MeetRepoImpl _meetRepoImpl;
  Timer? _debounce;

  RxList<ShortMeetData> meets = <ShortMeetData>[].obs;

  GlobalMapController() {
    mapController = MapController();
    _meetRepoImpl = Get.find<MeetRepoImpl>();

    // Add map move listener to fetch nearby objects
    mapController.mapEventStream.listen((event) {
      if (event is MapEventMoveEnd) {
        if (_debounce != null && _debounce!.isActive) {
          _debounce!.cancel();
        }
        _debounce = Timer(
            const Duration(milliseconds: 500),
            () => getMeetsAround(Location(
                event.camera.center.latitude, event.camera.center.longitude)));
      }
    });
  }

  void setMapCenter(LatLng centerCoordinates) {
    mapController.move(centerCoordinates, mapController.camera.zoom,
        offset: const Offset(0, -100));
  }

  // void setCurrentMeet(Meet meet) {
  //   currentMeet.value = meet;
  // }

  void getMeetsAround(Location position) async {
    final List<ShortMeetData> result = await _meetRepoImpl.getMeetsAround(position);
    meets.value = result;
  }
}
