import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });

    on<RegisterPageSelectEvent>((event, emit) {
      emit(
        PasswordsRegisterSelected(
          iconHeight: event.iconHeight,
        )
      );
    });

    on<InfoPageSelectEvent>((event, emit) {
      emit(
        PasswordsInformationSelected(
          iconHeight: event.iconHeight,
        )
      );
    });
  }
}
