part of 'pass_register_bloc.dart';

abstract class PassRegisterEvent extends Equatable {
  const PassRegisterEvent();
}

// PASSWORD FIELDS FILL EVENTS
class SelectPassTypeEvent extends PassRegisterEvent {

  final PassType passType;

  const SelectPassTypeEvent({this.passType = PassType.email});

  @override
  List<Object?> get props => [passType];

}

class FillItemNameEvent extends PassRegisterEvent {

  final String itemName;

  const FillItemNameEvent({this.itemName = '-'});

  @override
  List<Object?> get props => [itemName];

}

class FillEmailEvent extends PassRegisterEvent {

  final String email;

  const FillEmailEvent({this.email = '-'});

  @override
  List<Object?> get props => [email];

}

class FillUsernameEvent extends PassRegisterEvent {

  final String username;

  const FillUsernameEvent({this.username = '-'});

  @override
  List<Object?> get props => [username];

}

class FillNicknameEvent extends PassRegisterEvent {

  final String nickname;

  const FillNicknameEvent({this.nickname = '-'});

  @override
  List<Object?> get props => [nickname];

}

class FillPasswordEvent extends PassRegisterEvent {

  final String password;

  const FillPasswordEvent({required this.password});

  @override
  List<Object?> get props => [password];

}

class FillNumIdEvent extends PassRegisterEvent {

  final String numId;

  const FillNumIdEvent({this.numId = '-'});

  @override
  List<Object?> get props => [numId];

}

class FillPinEvent extends PassRegisterEvent {

  final String pin;

  const FillPinEvent({this.pin = '-'});

  @override
  List<Object?> get props => [pin];

}

class FillAuthEvent extends PassRegisterEvent {

  final bool isAuth;

  const FillAuthEvent({this.isAuth = false});

  @override
  List<Object?> get props => [isAuth];

}

// PASSWORD REGISTER EVENT
class ConfirmPasswordRegisterEvent extends PassRegisterEvent{

  final Password? passToRegister;

  const ConfirmPasswordRegisterEvent({this.passToRegister});

  @override
  List<Object?> get props => [passToRegister];

}

class RegisterPasswordEvent extends PassRegisterEvent{

  final Password? passReadyToRegister;

  const RegisterPasswordEvent({this.passReadyToRegister});

  @override
  List<Object?> get props => [passReadyToRegister];

}

// PASSWORD EDIT EVENT
class ConfirmPasswordEditEvent extends PassRegisterEvent{

  final Password? passToEdit;

  const ConfirmPasswordEditEvent({this.passToEdit});

  @override
  List<Object?> get props => [passToEdit];

}

class EditPasswordEvent extends PassRegisterEvent{

  final Password? passReadyToUpdate;

  const EditPasswordEvent({this.passReadyToUpdate});

  @override
  List<Object?> get props => [passReadyToUpdate];

}
