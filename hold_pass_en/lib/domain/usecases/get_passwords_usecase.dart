import 'package:flutter/material.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';

class GetPasswordsUsecase{

  PasswordRepository? repository;

  GetPasswordsUsecase({@required this.repository});

  Future<List<Password>?>? getPasswords(PassType passType) async {
    return await repository!.getPasswords(passType);
  }

}