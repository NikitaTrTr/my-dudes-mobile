import 'package:json_annotation/json_annotation.dart';
import 'package:mydudes/core/model/data/creator.dart';
import 'package:mydudes/core/model/location.dart';
import 'package:mydudes/core/model/meet_visibility.dart';

part 'meet_data.g.dart';

@JsonSerializable()
class MeetData {
  final int id;
  final String name;
  final String description;
  final String? category;
  final Location location;
  final Creator creator;
  final List<String> participants;
  final int limits;
  @JsonKey(toJson: serializeToJson, fromJson: deserializeFromJson)
  final MeetVisibility visibility;
  final DateTime startTime;
  final DateTime? endTime;

  MeetData(this.participants, this.limits, this.visibility, this.startTime,
      this.endTime,
      {required this.id,
      required this.name,
      required this.description,
      this.category,
      required this.location,
      required this.creator});

  factory MeetData.fromJson(Map<String, dynamic> json) =>
      _$MeetDataFromJson(json);

  Map<String, dynamic> toJson() => _$MeetDataToJson(this);
}
