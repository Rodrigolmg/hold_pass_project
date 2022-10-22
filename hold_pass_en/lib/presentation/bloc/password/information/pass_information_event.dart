part of 'pass_information_bloc.dart';

abstract class PassInformationEvent extends Equatable {
  const PassInformationEvent();
}

// PASSWORD LIST EVENTS
class LoadPasswordListEvent extends PassInformationEvent{

  final PassType? passType;

  const LoadPasswordListEvent({this.passType});

  @override
  List<Object?> get props => [passType];

}

class PasswordListLoadedEvent extends PassInformationEvent{

  final List<Password>? passwords;

  const PasswordListLoadedEvent({this.passwords});

  @override
  List<Object?> get props => [passwords];

}

class EmptyPasswordListEvent extends PassInformationEvent{

  @override
  List<Object?> get props => [];

}

// PASSWORD DELETE EVENT
class DeletePasswordEvent extends PassInformationEvent{

  final Password? passToDelete;

  const DeletePasswordEvent({this.passToDelete});

  @override
  List<Object?> get props => [passToDelete];

}

