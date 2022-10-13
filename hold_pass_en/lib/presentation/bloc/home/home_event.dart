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



