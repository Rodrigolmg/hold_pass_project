// ignore_for_file: must_be_immutable

part of 'password_bloc.dart';

abstract class PasswordEvent<T> extends Equatable {
  const PasswordEvent();
  call(T value);
}

class SeePasswordTextEvent extends PasswordEvent<bool>{

  bool? isObscured;

  @override
  call(bool value) {
    isObscured = value;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isObscured];

}

class ConfirmPasswordRegisterEvent extends PasswordEvent<Password>{

  Password? passToRegister;

  @override
  List<Object?> get props => [passToRegister];

  @override
  call(Password value) {
    passToRegister = value;
  }

}

class RegisterPasswordEvent extends PasswordEvent<Password>{

  Password? passReadyToRegister;

  @override
  List<Object?> get props => [passReadyToRegister];

  @override
  call(Password value) {
    passReadyToRegister = value;
  }

}

class DeletePasswordEvent extends PasswordEvent<Password>{

  Password? passToDelete;

  @override
  call(Password value) {
    passToDelete = value;
  }

  @override
  List<Object?> get props => [passToDelete];

}

class SelectPassToEditEvent extends PasswordEvent<Password>{

  Password? passSelected;

  @override
  call(Password value) {
    passSelected = value;
  }

  @override
  List<Object?> get props => throw UnimplementedError();

}

class ConfirmPasswordEditEvent extends PasswordEvent<Password>{

  Password? passToEdit;

  @override
  call(Password value) {
    passToEdit = value;
  }

  @override
  List<Object?> get props => [passToEdit];

}

class FetchPasswordListEvent extends PasswordEvent<PassType>{

  PassType? passType;

  @override
  call(PassType value) {
    passType = value;
  }

  @override
  List<Object?> get props => [passType];

}

class ReloadPasswordListEvent extends PasswordEvent<Password>{

  Password? password;

  @override
  call(Password value) {
    password = value;
  }

  @override
  List<Object?> get props => [password];

}

class SelectPassTypeEvent extends PasswordEvent<PassType> {

  PassType? passType;

  SelectPassTypeEvent();

  @override
  call(PassType value) {
    passType = value;
  }

  @override
  List<Object?> get props => [passType];

}

class FillItemNameEvent extends PasswordEvent<String> {

  String itemName = '-';

  @override
  call(String value) {
    itemName = value;
  }

  @override
  List<Object?> get props => [itemName];

}

class FillEmailEvent extends PasswordEvent<String> {

  String email = '-';

  @override
  call(String value) {
    email = value;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email];

}

class FillUsernameEvent extends PasswordEvent<String> {

  String username = '-';

  @override
  call(String value) {
    username = value;
  }

  @override
  List<Object?> get props => [username];

}

class FillNicknameEvent extends PasswordEvent<String> {

  String nickname = '-';

  @override
  call(String value) {
    nickname = value;
  }

  @override
  List<Object?> get props => [nickname];

}

class FillPasswordEvent extends PasswordEvent<String> {

  String password = '-';

  @override
  call(String value) {
    password = value;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [password];

}

class FillNumIdEvent extends PasswordEvent<String> {

  String numId = '-';

  @override
  call(String value) {
    numId = value;
  }

  @override
  List<Object?> get props => [numId];

}

class FillPinEvent extends PasswordEvent<String> {

  String pin = '-';

  @override
  call(String value) {
    pin = value;
  }

  @override
  List<Object?> get props => [pin];

}

class FillAuthEvent extends PasswordEvent<bool> {

  bool isAuth = false;

  @override
  call(bool value) {
    isAuth = value;
  }

  @override
  List<Object?> get props => [isAuth];

}

class CancelPasswordEdit extends PasswordEvent<double>{

  double? iconHeight;

  @override
  call(double value) {
    iconHeight = value;
  }

  @override
  List<Object?> get props => [iconHeight];

}