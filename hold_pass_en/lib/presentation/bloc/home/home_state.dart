part of 'home_bloc.dart';

abstract class HomeState extends Equatable {

  IconData? get icon;
  int get pageIndex;
  double get iconHeightValue;

  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];

  @override
  IconData? get icon => null;

  @override
  // TODO: implement pageIndex
  int get pageIndex => 0;

  @override
  double get iconHeightValue => .0;
}

class PasswordsRegisterSelected extends HomeState {

  final double? iconHeight;

  const PasswordsRegisterSelected({this.iconHeight});

  @override
  double get iconHeightValue => iconHeight!;

  @override
  IconData get icon => Icons.save;

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
  IconData get icon => Icons.upload_rounded;

  @override
  List<Object?> get props => [iconHeight];

  @override
  int get pageIndex => 1;
}
