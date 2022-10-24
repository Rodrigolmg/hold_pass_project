part of 'pass_register_bloc.dart';

abstract class PassRegisterState extends Equatable {
  const PassRegisterState();
}

class PassRegisterInitial extends PassRegisterState {
  @override
  List<Object> get props => [];
}

// PASSWORD FIELDS FILL STATES
class PassTypeFilled extends PassRegisterState {

  final PassType passtType;

  const PassTypeFilled({this.passtType = PassType.email});

  @override
  List<Object?> get props => [passtType];

}

class ItemNameFilled extends PassRegisterState {

  final String itemName;

  const ItemNameFilled({this.itemName = '-'});

  @override
  List<Object?> get props => [itemName];

}

class EmailFilled extends PassRegisterState {

  final String email;

  const EmailFilled({this.email = '-'});

  @override
  List<Object?> get props => [email];

}

class UsernameFilled extends PassRegisterState {

  final String username;

  const UsernameFilled({this.username = '-'});

  @override
  List<Object?> get props => [username];

}

class NicknameFilled extends PassRegisterState {

  final String nickname;

  const NicknameFilled({this.nickname = '-'});

  @override
  List<Object?> get props => [nickname];

}

class PasswordFilled extends PassRegisterState {

  final String password;

  const PasswordFilled({this.password = '-'});

  @override
  List<Object?> get props => [password];

}

class NumIdFilled extends PassRegisterState {

  final String numId;

  const NumIdFilled({this.numId = '-'});

  @override
  List<Object?> get props => [numId];

}

class PinFilled extends PassRegisterState {

  final String pin;

  const PinFilled({this.pin = '-'});

  @override
  List<Object?> get props => [pin];

}

class AuthFilled extends PassRegisterState {

  final bool isAuth;

  const AuthFilled({this.isAuth = false});

  @override
  List<Object?> get props => [isAuth];

}

// PASSWORD REGISTER STATES
class ConfirmingPasswordToRegister extends PassRegisterState {

  final Password? passwordToRegister;

  const ConfirmingPasswordToRegister({required this.passwordToRegister});

  @override
  List<Object> get props => [passwordToRegister!.id!];
}

class PasswordRegistered extends PassRegisterState {

  final Password? passwordRegistered;

  const PasswordRegistered({required this.passwordRegistered});

  @override
  List<Object> get props => [passwordRegistered!];
}

// PASSWORD EDIT STATES
class ConfirmingPasswordToEdit extends PassRegisterState {

  final Password? passwordToEdit;

  const ConfirmingPasswordToEdit({required this.passwordToEdit});

  @override
  List<Object> get props => [passwordToEdit!];
}

class PasswordEdited extends PassRegisterState {

  final Password? passwordEdited;
  final double? offset;

  const PasswordEdited({required this.passwordEdited, this.offset});

  @override
  List<Object> get props => [passwordEdited!.id!, offset!];
}


