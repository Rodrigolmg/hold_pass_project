part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();
}

class Empty extends PasswordState {
  @override
  List<Object> get props => [];
}

class PasswordListLoading extends PasswordState {

  final PassType? passType;

  const PasswordListLoading({@required this.passType});

  @override
  List<Object> get props => [passType!];
}

class PasswordListLoaded extends PasswordState {

  final List<Password>? passwords;
  final PassType? passType;

  const PasswordListLoaded({@required this.passwords, @required this.passType});

  @override
  List<Object> get props => [passwords!, passType!];
}

class EmptyPasswordList extends PasswordState {
  @override
  List<Object> get props => [];
}

class PasswordRegistered extends PasswordState {

  final Password? passwordRegistered;

  const PasswordRegistered({@required this.passwordRegistered});

  @override
  List<Object> get props => [passwordRegistered!];
}

class PasswordEdited extends PasswordState {

  final Password? passwordEdited;

  const PasswordEdited({@required this.passwordEdited});

  @override
  List<Object> get props => [passwordEdited!.id!];
}




