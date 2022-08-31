import 'package:hold_pass_en/util/pass_type.dart';

class Password {

  final PassType passType;
  final String namePass;
  final String email;
  final String username;
  final String password;

  Password(this.passType, this.namePass, this.email, this.username, this.password);
}