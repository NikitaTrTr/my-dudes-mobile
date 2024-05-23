// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meet_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeetData _$MeetDataFromJson(Map<String, dynamic> json) => MeetData(
      (json['participants'] as List<dynamic>).map((e) => e as String).toList(),
      (json['limits'] as num).toInt(),
      deserializeFromJson(json['visibility'] as String),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String?,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      creator: Creator.fromJson(json['creator'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetDataToJson(MeetData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'location': instance.location,
      'creator': instance.creator,
      'participants': instance.participants,
      'limits': instance.limits,
      'visibility': serializeToJson(instance.visibility),
    };
