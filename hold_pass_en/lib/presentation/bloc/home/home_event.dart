part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class ChangePageEvent extends HomeEvent {

  final double? iconHeight;
  final int? pageIndex;

  const ChangePageEvent({
    this.iconHeight,
    this.pageIndex
  });

  @override
  List<Object?> get props => [iconHeight, pageIndex];

}

class RegisterPageSelectEvent extends HomeEvent {

  final double? iconHeight;

  const RegisterPageSelectEvent({
    this.iconHeight,
  });

  @override
  List<Object?> get props => [iconHeight];

}

class InfoPageSelectEvent extends HomeEvent {

  final double? iconHeight;

  const InfoPageSelectEvent({
    this.iconHeight,
  });

  @override
  List<Object?> get props => [iconHeight];

}

// PASSWORD EDIT EVENT
class SelectPassToEditEvent extends HomeEvent{

  final Password? passSelected;
  final double? offset;
  final double iconHeight;

  const SelectPassToEditEvent({
    this.passSelected,
    this.offset,
    required this.iconHeight
  });

  @override
  List<Object?> get props => [passSelected, offset, iconHeight];

}

class CancelPasswordEditEvent extends HomeEvent{

  final double iconHeight;

  const CancelPasswordEditEvent({required this.iconHeight});

  @override
  List<Object?> get props => [iconHeight];

}

class RevealPasswordTextEvent extends HomeEvent{

  final bool? revealText;

  const RevealPasswordTextEvent({required this.revealText});

  @override
  List<Object?> get props => [revealText];

}



