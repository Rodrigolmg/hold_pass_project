import 'package:flutter/material.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';
import 'package:hold_pass_en/domain/usecases/usecase.dart';

class DeletePasswordUsecase implements UseCase<void, PasswordModel>{

  PasswordRepository? repository;

  DeletePasswordUsecase({@required this.repository});

  @override
  Future<void> call(PasswordModel pass) async {
    await repository!.delete(pass);
  }

}