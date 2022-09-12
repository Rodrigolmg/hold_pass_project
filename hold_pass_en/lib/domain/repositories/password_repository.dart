import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';

abstract class PasswordRepository{

  Future<void> insert(PasswordModel passToRegister);
  Future<void> update(PasswordModel passToUpdate);
  Future<void> delete(PasswordModel passToDelete);
  Future<List<Password>> getPasswords(PassType passType);

}