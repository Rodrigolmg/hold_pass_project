import 'package:flutter/foundation.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';

class EditPasswordUsecase {

  PasswordRepository? repository;

  EditPasswordUsecase({@required this.repository});

  void registerPassword(PasswordModel passToEdit) async {
    await repository!.update(passToEdit);
  }
}