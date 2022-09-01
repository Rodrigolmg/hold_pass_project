import 'package:flutter/material.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password.g.dart';

@JsonSerializable()
class Password {

  int? id;

  final PassType? passType;
  final String? itemNamePass;
  final String? email;
  final String? username;
  final String? nickname;
  final String? password;
  final String? numId;
  final String? pin;
  final bool? isAuth;

  Password({
    this.id,
    @required this.passType,
    this.itemNamePass,
    this.email,
    this.username,
    this.nickname,
    @required this.password,
    this.numId,
    this.pin,
    this.isAuth
  });

  factory Password.fromJson(Map<String, dynamic> json)
    => _$PasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordToJson(this);
}