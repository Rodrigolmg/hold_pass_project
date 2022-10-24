import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';

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

    on<SelectPassToEditEvent>(_onPassToEditSelected);
    on<CancelPasswordEditEvent>(_onCancelPasswordEdit);
    on<RevealPasswordTextEvent>(_onPasswordFielRevealed);
  }

  void _onPassToEditSelected(SelectPassToEditEvent event, Emitter emit){
    emit(
        PasswordSelected(
          passwordSelection: event.passSelected,
          offset: event.offset,
          iconHeight: event.iconHeight
        )
    );
  }

  void _onCancelPasswordEdit(CancelPasswordEditEvent event, Emitter emit){
    emit(
        PasswordEditCancelled(iconHeight: event.iconHeight)
    );
  }

  void _onPasswordFielRevealed(RevealPasswordTextEvent event, Emitter emit){
    emit(
        PasswordTextRevealed(revealText: event.revealText)
    );
  }

}
