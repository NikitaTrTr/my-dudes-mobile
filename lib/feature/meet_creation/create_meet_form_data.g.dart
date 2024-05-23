// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_meet_form_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMeetFormData _$CreateMeetFormDataFromJson(Map<String, dynamic> json) =>
    CreateMeetFormData()
      ..name = json['name'] as String?
      ..description = json['description'] as String?
      ..location = locationFromJson(json['location'] as Map<String, dynamic>)
      ..limits = (json['limits'] as num?)?.toInt()
      ..visibility = deserializeFromJson(json['visibility'] as String)
      ..startTime =
          CreateMeetFormData._dateTimeFromJson(json['startTime'] as String?);

Map<String, dynamic> _$CreateMeetFormDataToJson(CreateMeetFormData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'location': locationToJson(instance.location),
      'limits': instance.limits,
      'visibility': serializeToJson(instance.visibility),
      'startTime': CreateMeetFormData._dateTimeToJson(instance.startTime),
    };
