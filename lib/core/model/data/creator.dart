import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'creator.g.dart';

@JsonSerializable()
class Creator {
  final int id;
  final String nickname;
  final String firstName;
  final String lastName;
  final DateTime? birthDate;
  final String? sex;
  final String? info;
  @JsonKey(fromJson: uint8ListFromJson)
  final Uint8List? photo;
  final bool freezeLocation;

  Creator(
      {required this.id,
      required this.nickname,
      required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.sex,
      required this.info,
      required this.photo,
      required this.freezeLocation});

  factory Creator.fromJson(Map<String, dynamic> json) => _$CreatorFromJson(json);
  Map<String, dynamic> toJson() => _$CreatorToJson(this);
}

Uint8List? uint8ListFromJson(List<dynamic>? data) {
  if (data == null) {
    return null;
  }
  return Uint8List.fromList(data.map((e) => e as int).toList());
}
