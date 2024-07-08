// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Creator _$CreatorFromJson(Map<String, dynamic> json) => Creator(
      id: (json['id'] as num).toInt(),
      nickname: json['nickname'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      sex: json['sex'] as String?,
      info: json['info'] as String?,
      photo: uint8ListFromJson(json['photo'] as List?),
      freezeLocation: json['freezeLocation'] as bool,
    );

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate?.toIso8601String(),
      'sex': instance.sex,
      'info': instance.info,
      'photo': instance.photo,
      'freezeLocation': instance.freezeLocation,
    };
