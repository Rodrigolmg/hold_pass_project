import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hold_pass_en/core/util/pass_converter.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/domain/usecases/usecase.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {

  final UseCase? useCase;
  final PassConverter? converter;

  PasswordBloc({@required this.useCase, this.converter}) : super(Empty()){
    on<RegisterPasswordEvent>(_onRegisterPass);
    on<DeletePasswordEvent>(_onDeletePass);
    on<EditPasswordEvent>(_onEditPass);
    on<FetchPasswordListEvent>(_onFetchPasswords);
  }


  void _onRegisterPass(RegisterPasswordEvent event, Emitter emitter) {

    useCase!(event.passToRegister);
    emitter(
        PasswordRegistered(passwordRegistered: event.passToRegister)
    );
  }

  void _onDeletePass(DeletePasswordEvent event, Emitter emitter) {

  }

  void _onEditPass(EditPasswordEvent event, Emitter emitter) {

  }

  void _onFetchPasswords(FetchPasswordListEvent event, Emitter emitter) {

  }

}
