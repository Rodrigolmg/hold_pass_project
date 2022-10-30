part of 'home_bloc.dart';

abstract class HomeState extends Equatable {

  int get pageIndex;
  double get iconHeightValue;

  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];

  @override
  int get pageIndex => 0;

  @override
  double get iconHeightValue => 25.0;
}

class PasswordsRegisterSelected extends HomeState {

  final double? iconHeight;

  const PasswordsRegisterSelected({this.iconHeight});

  @override
  double get iconHeightValue => iconHeight!;

  @override
  List<Object?> get props => [iconHeight];

  @override
  int get pageIndex => 0;
}

class PasswordsInformationSelected extends HomeState {

  final double? iconHeight;

  const PasswordsInformationSelected({this.iconHeight});

  @override
  double get iconHeightValue => iconHeight!;

  @override
  List<Object?> get props => [iconHeight];

  @override
  int get pageIndex => 1;
}

class PasswordSelected extends HomeState {

  final Password? passwordSelection;
  final double? offset;
  final double iconHeight;

  const PasswordSelected({
    this.passwordSelection,
    this.offset,
    required this.iconHeight
  });

  bool get isEditing => passwordSelection != null;

  @override
  List<Object> get props => [iconHeight];


  @override
  double get iconHeightValue => iconHeight;

  @override
  int get pageIndex => 0;
}

class PasswordEditCancelled extends HomeState {

  final double iconHeight;

  final Password passwordReseted = Password(
      passType: PassType.email,
      itemNamePass: '',
      email: '',
      username: '',
      nickname: '',
      password: '',
      numId: '',
      pin: '',
      isAuth: false
  );

  PasswordEditCancelled({required this.iconHeight});

  @override
  List<Object?> get props => [iconHeight];

  @override
  double get iconHeightValue => iconHeight;

  @override
  int get pageIndex => 0;

}

class PasswordTextRevealed extends HomeState{

  final bool? revealText;

  const PasswordTextRevealed({required this.revealText});

  @override
  List<Object?> get props => [revealText];

  @override
  double get iconHeightValue => 25.0;

  @override
  int get pageIndex => 0;

}

class PasswordAuthenticationSelected extends HomeState{

  final bool isAuth;

  const PasswordAuthenticationSelected({required this.isAuth});

  @override
  double get iconHeightValue => 25.0;

  @override
  int get pageIndex => 0;

  @override
  List<Object?> get props => [isAuth];

}