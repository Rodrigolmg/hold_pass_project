import 'package:flutter/material.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class PasswordModel extends Password{

  PasswordModel({
    int? id,
    @required PassType? passType,
    String? itemNamePass,
    String? email,
    String? username,
    String? nickname,
    @required String? password,
    String? numId,
    String? pin,
    bool isAuth = false
  }): super(
    id: id,
    passType: passType,
    itemNamePass:  itemNamePass,
    email: email,
    username: username,
    nickname: nickname,
    password: password,
    numId: numId,
    pin: pin,
    isAuth: isAuth
  );

  factory PasswordModel.fromJson(Map<String, dynamic> json)
    => _$PasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordModelToJson(this);
}