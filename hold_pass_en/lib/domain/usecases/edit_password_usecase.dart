import 'package:flutter/foundation.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';
import 'package:hold_pass_en/domain/usecases/usecase.dart';

class EditPasswordUsecase implements UseCase<void, PasswordModel>{

  PasswordRepository? repository;

  EditPasswordUsecase({@required this.repository});

  @override
  Future<void> call(PasswordModel pass) async {
    await repository!.update(pass);
  }
}