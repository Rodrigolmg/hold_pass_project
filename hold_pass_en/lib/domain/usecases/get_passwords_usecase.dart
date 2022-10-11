import 'package:flutter/material.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/usecases/usecase.dart';

class GetPasswordsUsecase implements UseCase<List<Password>, PassType>{

  PasswordRepository? repository;

  GetPasswordsUsecase({@required this.repository});

  @override
  Future<List<Password>> call(PassType pass) async {
    return await repository!.getPasswords(pass);
  }

}