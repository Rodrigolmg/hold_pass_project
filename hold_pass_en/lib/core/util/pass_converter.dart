import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/domain/entities/password.dart';

class PassConverter {

  PasswordModel convertPassToModel(Password pass) => PasswordModel(
    id: pass.id,
    passType: pass.passType,
    email: pass.email,
    itemNamePass: pass.itemNamePass,
    username: pass.username,
    nickname: pass.nickname,
    pin: pass.pin,
    numId: pass.numId,
    password: pass.password,
    isAuth: pass.isAuth!
  );

  Password convertPassToEntity(PasswordModel pass) => pass;

}