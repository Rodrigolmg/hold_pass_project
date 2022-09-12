
import 'package:equatable/equatable.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';

// ignore: must_be_immutable
class Password extends Equatable{

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
    this.passType,
    this.itemNamePass,
    this.email,
    this.username,
    this.nickname,
    this.password,
    this.numId,
    this.pin,
    this.isAuth,
  });


  @override
  List<Object?> get props => [
    id,
    passType,
    itemNamePass,
    email,
    username,
    nickname,
    password,
    numId,
    pin,
    isAuth,
  ];


}