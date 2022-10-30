part of 'pass_information_bloc.dart';

abstract class PassInformationState extends Equatable {
  const PassInformationState();
}

class PassInformationInitial extends PassInformationState {
  @override
  List<Object> get props => [];
}

// PASSWORD LIST STATES
class PasswordListLoading extends PassInformationState {

  final PassType? passType;
  final List<Password>? passList;

  const PasswordListLoading({required this.passType, this.passList});

  @override
  List<Object> get props => [passType!];
}

class PasswordListLoaded extends PassInformationState {

  final List<Password>? passwords;

  const PasswordListLoaded({required this.passwords});

  @override
  List<Object> get props => [passwords!];
}

class EmptyPasswordList extends PassInformationState {
  @override
  List<Object> get props => [];
}


// PASSWORD DELETE STATES
class PasswordDeleted extends PassInformationState {

  final Password? passwordDeleted;

  const PasswordDeleted({required this.passwordDeleted});

  @override
  List<Object> get props => [passwordDeleted!.id!];
}

class UndonePasswordDelete extends PassInformationState {

  final Password? passwordDeletedToRestore;

  const UndonePasswordDelete({this.passwordDeletedToRestore});

  @override
  List<Object?> get props => [passwordDeletedToRestore];

}

