import 'package:flutter/material.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';

class DeletePasswordUsecase {

  PasswordRepository? repository;

  DeletePasswordUsecase({@required this.repository});

  void registerPassword(PasswordModel passToRegister) async {
    await repository!.insert(passToRegister);
  }

}