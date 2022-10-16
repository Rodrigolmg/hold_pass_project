// ignore_for_file: must_be_immutable

part of 'password_bloc.dart';

abstract class PasswordEvent<T> extends Equatable {
  const PasswordEvent();
}

class SeePasswordTextEvent extends PasswordEvent<bool>{

  final bool? isObscured;

  const SeePasswordTextEvent({this.isObscured});

  @override
  // TODO: implement props
  List<Object?> get props => [isObscured];

}

class ConfirmPasswordRegisterEvent extends PasswordEvent<Password>{

  final Password? passToRegister;

  const ConfirmPasswordRegisterEvent({this.passToRegister});

  @override
  List<Object?> get props => [passToRegister];

}

class RegisterPasswordEvent extends PasswordEvent<Password>{

  final Password? passReadyToRegister;

  const RegisterPasswordEvent({this.passReadyToRegister});

  @override
  List<Object?> get props => [passReadyToRegister];

}

class DeletePasswordEvent extends PasswordEvent<Password>{

  final Password? passToDelete;

  const DeletePasswordEvent({this.passToDelete});

  @override
  List<Object?> get props => [passToDelete];

}

class SelectPassToEditEvent extends PasswordEvent<Password>{

  final Password? passSelected;

  const SelectPassToEditEvent({this.passSelected});

  @override
  List<Object?> get props => [passSelected];

}

class ConfirmPasswordEditEvent extends PasswordEvent<Password>{

  final Password? passToEdit;

  const ConfirmPasswordEditEvent({this.passToEdit});

  @override
  List<Object?> get props => [passToEdit];

}

class FetchPasswordListEvent extends PasswordEvent<PassType>{

  final PassType? passType;

  const FetchPasswordListEvent({this.passType});

  @override
  List<Object?> get props => [passType];

}

class PasswordListLoadedEvent extends PasswordEvent<List<Password>>{

  final List<Password>? passwords;

  const PasswordListLoadedEvent({this.passwords});

  @override
  List<Object?> get props => [passwords];

}

class LoadPasswordListEvent extends PasswordEvent<PassType>{

  final PassType? passType;

  const LoadPasswordListEvent({this.passType});

  @override
  List<Object?> get props => [passType];

}

class EmptyPasswordListEvent extends PasswordEvent<Void>{

  @override
  List<Object?> get props => [];

}

class ReloadPasswordListEvent extends PasswordEvent<Password>{

  final Password? password;

  const ReloadPasswordListEvent({this.password});

  @override
  List<Object?> get props => [password];

}

class SelectPassTypeEvent extends PasswordEvent<PassType> {

  final PassType passType;

  const SelectPassTypeEvent({this.passType = PassType.email});

  @override
  List<Object?> get props => [passType];

}

class FillItemNameEvent extends PasswordEvent<String> {

  final String itemName;

  const FillItemNameEvent({this.itemName = '-'});

  @override
  List<Object?> get props => [itemName];

}

class FillEmailEvent extends PasswordEvent<String> {

  final String email;

  const FillEmailEvent({this.email = '-'});

  @override
  List<Object?> get props => [email];

}

class FillUsernameEvent extends PasswordEvent<String> {

  final String username;

  const FillUsernameEvent({this.username = '-'});

  @override
  List<Object?> get props => [username];

}

class FillNicknameEvent extends PasswordEvent<String> {

 final String nickname;

 const FillNicknameEvent({this.nickname = '-'});

  @override
  List<Object?> get props => [nickname];

}

class FillPasswordEvent extends PasswordEvent<String> {

  final String password;

  const FillPasswordEvent({required this.password});

  @override
  List<Object?> get props => [password];

}

class FillNumIdEvent extends PasswordEvent<String> {

  final String numId;

  const FillNumIdEvent({this.numId = '-'});

  @override
  List<Object?> get props => [numId];

}

class FillPinEvent extends PasswordEvent<String> {

  final String pin;

  const FillPinEvent({this.pin = '-'});

  @override
  List<Object?> get props => [pin];

}

class FillAuthEvent extends PasswordEvent<bool> {

  final bool isAuth;

  const FillAuthEvent({this.isAuth = false});

  @override
  List<Object?> get props => [isAuth];

}

class CancelPasswordEdit extends PasswordEvent<double>{

  final double? iconHeight;

  const CancelPasswordEdit({this.iconHeight});

  @override
  List<Object?> get props => [iconHeight];

}