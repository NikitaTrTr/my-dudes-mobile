import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'short_meet_data.g.dart';

@JsonSerializable()
class ShortMeetData {
  int id;
  String name;
  String creator;
  Time time;
  Location location;

  ShortMeetData(
      {required this.id,
      required this.name,
      required this.creator,
      required this.time,
      required this.location});

  factory ShortMeetData.fromJson(Map<String, dynamic> json) =>
      _$ShortMeetDataFromJson(json);

  Map<String, dynamic> toJson() => _$ShortMeetDataToJson(this);
}

@JsonSerializable()
class Time {
  DateTime startTime;
  DateTime? endTime;

  Time({required this.startTime, this.endTime});

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);
}
