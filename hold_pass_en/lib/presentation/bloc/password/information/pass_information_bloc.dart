import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/domain/usecases/get_passwords_usecase.dart';
import 'package:hold_pass_en/domain/usecases/usecase.dart';

part 'pass_information_event.dart';
part 'pass_information_state.dart';

class PassInformationBloc extends Bloc<PassInformationEvent, PassInformationState> {

  UseCase? _useCase;

  PassInformationBloc() : super(PassInformationInitial()) {

    on<LoadPasswordListEvent>(_onLoadingPasswordList);
    on<PasswordListLoadedEvent>(_onPasswordsLoaded);
    on<EmptyPasswordListEvent>(_onEmptyPasswordList);
    on<DeletePasswordEvent>(_onPasswordDelete);
  }

  void _onLoadingPasswordList(LoadPasswordListEvent event, Emitter emit) async {
    _useCase = GetIt.I.get<GetPasswordsUsecase>();
    List<Password> passwords = await _useCase!(event.passType);

    emit(
        PasswordListLoading(
          passType: event.passType,
          passList: passwords
        )
    );
  }

  void _onPasswordsLoaded(PasswordListLoadedEvent event, Emitter emit){
    emit(
        PasswordListLoaded(
          passwords: event.passwords
        )
    );
  }

  void _onEmptyPasswordList(EmptyPasswordListEvent event, Emitter emit){
    emit(
        EmptyPasswordList()
    );
  }

  void _onPasswordDelete(DeletePasswordEvent event, Emitter emit){
    emit(
        PasswordDeleted(passwordDeleted: event.passToDelete)
    );
  }

}


