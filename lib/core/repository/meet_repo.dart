import 'package:mydudes/core/model/location.dart';
import 'package:mydudes/core/model/data/meet_data.dart';
import 'package:mydudes/core/model/data/short_meet_data.dart';
import 'package:mydudes/core/model/data/create_meet_form_data.dart';

abstract class MeetRepo {
  Future<List<ShortMeetData>> getMeetsAround(Location position);

  Future<bool> createMeet(CreateMeetFormData meetData);

  Future<MeetData> getMeet(int id);
}
