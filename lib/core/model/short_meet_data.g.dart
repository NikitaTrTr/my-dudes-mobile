// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_meet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortMeetData _$ShortMeetDataFromJson(Map<String, dynamic> json) =>
    ShortMeetData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      creator: json['creator'] as String,
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShortMeetDataToJson(ShortMeetData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creator': instance.creator,
      'time': instance.time,
      'location': instance.location,
    };

Time _$TimeFromJson(Map<String, dynamic> json) => Time(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
