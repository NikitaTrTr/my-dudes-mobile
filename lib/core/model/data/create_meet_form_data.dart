import 'package:image_picker/image_picker.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mydudes/core/model/location.dart';
import 'package:mydudes/core/model/meet_visibility.dart';

part 'create_meet_form_data.g.dart';

@JsonSerializable()
class CreateMeetFormData {
  String? name;

  String? description;

  @JsonKey(toJson: locationToJson, fromJson: locationFromJson)
  Location? location;

  int? limits;

  @JsonKey(toJson: serializeToJson, fromJson: deserializeFromJson)
  MeetVisibility? visibility;

  @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  DateTime? startTime;

  static DateTime? _dateTimeFromJson(String? json) {
    return json != null ? DateTime.parse(json).toLocal() : null;
  }

  static String? _dateTimeToJson(DateTime? dateTime) {
    return dateTime?.toUtc().toIso8601String();
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  XFile? image;

  Map<String, dynamic> toJson() => _$CreateMeetFormDataToJson(this);
}
