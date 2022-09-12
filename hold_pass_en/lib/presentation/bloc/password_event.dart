part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();
}

class RegisterPasswordEvent extends PasswordEvent{

  final Password? passToRegister;

  const RegisterPasswordEvent({this.passToRegister});

  @override
  List<Object?> get props => [passToRegister];

}

class DeletePasswordEvent extends PasswordEvent{

  final Password? passToDelete;

  const DeletePasswordEvent({this.passToDelete});

  @override
  List<Object?> get props => [passToDelete];

}

class EditPasswordEvent extends PasswordEvent{

  final Password? passToEdit;

  const EditPasswordEvent({this.passToEdit});

  @override
  List<Object?> get props => [passToEdit];

}

class FetchPasswordListEvent extends PasswordEvent{

  final PassType passType;

  const FetchPasswordListEvent(this.passType);

  @override
  List<Object?> get props => [passType];

}
