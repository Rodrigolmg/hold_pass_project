import 'package:flutter/foundation.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';
import 'package:hold_pass_en/domain/usecases/usecase.dart';

class RegisterPasswordUsecase extends UseCase<void, PasswordModel> {

  PasswordRepository? repository;

  RegisterPasswordUsecase({@required this.repository});

  @override
  Future<void> call(PasswordModel pass) async {
    await repository!.insert(pass);
  }

}