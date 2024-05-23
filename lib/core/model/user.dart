import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:mydudes/core/model/creator.dart';

part "user.g.dart";

@JsonSerializable()
class User {
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

  User(
      {required this.id,
      required this.nickname,
      required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.sex,
      required this.info,
      required this.photo,
      required this.freezeLocation});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
