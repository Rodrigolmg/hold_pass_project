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



