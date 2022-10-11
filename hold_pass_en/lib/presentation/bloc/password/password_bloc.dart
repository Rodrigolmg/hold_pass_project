import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hold_pass_en/core/util/pass_converter.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/domain/usecases/usecase.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final UseCase? useCase;
  final PassConverter? converter;

  PasswordBloc({this.useCase, this.converter}) : super(Empty()){
    on<RegisterPasswordEvent>(_onRegisterPass);
    on<ConfirmPasswordRegisterEvent>(_onConfirmRegister);
    on<DeletePasswordEvent>(_onDeletePass);
    on<SelectPassToEditEvent>(_onSelectingPassToEdit);
    on<ConfirmPasswordEditEvent>(_onEditPass);
    on<FetchPasswordListEvent>(_onFetchPasswords);
    on<SelectPassTypeEvent>(_onSelectPassType);
    on<FillItemNameEvent>(_onFillItemNameEvent);
    on<FillEmailEvent>(_onFillEmailEvent);
    on<FillUsernameEvent>(_onFillUsernameEvent);
    on<FillNicknameEvent>(_onFillNicknameEvent);
    on<FillPasswordEvent>(_onFillPasswordEvent);
    on<FillNumIdEvent>(_onFillNumIdEvent);
    on<FillPinEvent>(_onFillPinEvent);
    on<FillAuthEvent>(_onFillAuthEvent);
    on<SeePasswordTextEvent>(_onSeePasswordText);
    on<CancelPasswordEdit>(_onCancelPassEdit);
  }

  void _onConfirmRegister(ConfirmPasswordRegisterEvent event, Emitter emitter){
    emitter(
        ConfirmingPasswordToRegister(passwordToRegister: event.passToRegister)
    );
  }

  void _onRegisterPass(RegisterPasswordEvent event, Emitter emitter) {

    useCase!(event.passReadyToRegister);
    emitter(
        PasswordRegistered(passwordRegistered: event.passReadyToRegister)
    );
  }

  void _onDeletePass(DeletePasswordEvent event, Emitter emitter) {
    useCase!(event.passToDelete);
    emitter(
        PasswordDeleted(passwordDeleted: event.passToDelete)
    );
  }

  void _onSelectingPassToEdit(SelectPassToEditEvent event, Emitter emit){
    emit(
      PasswordSelected(passwordSelection: event.passSelected)
    );
  }

  void _onEditPass(ConfirmPasswordEditEvent event, Emitter emitter) {

  }

  void _onFetchPasswords(FetchPasswordListEvent event, Emitter emit) {
    emit(
      FetchingPassList(passTypeToReload: event.passType)
    );
  }

  void _onSelectPassType(SelectPassTypeEvent event, Emitter emit) {
    emit(
        PassTypeFilled(passtType: event.passType!)
    );
  }

  void _onFillItemNameEvent(FillItemNameEvent event, Emitter emit) {
    emit(
        ItemNameFilled(itemName: event.itemName)
    );
  }

  void _onFillEmailEvent(FillEmailEvent event, Emitter emit) {
    emit(
        EmailFilled(email: event.email)
    );
  }

  void _onFillUsernameEvent(FillUsernameEvent event, Emitter emit) {
    emit(
        UsernameFilled(username: event.username)
    );
  }

  void _onFillNicknameEvent(FillNicknameEvent event, Emitter emit) {
    emit(
        NicknameFilled(nickname: event.nickname)
    );
  }

  void _onFillPasswordEvent(FillPasswordEvent event, Emitter emit) {
    emit(
        PasswordFilled(password: event.password)
    );
  }

  void _onFillNumIdEvent(FillNumIdEvent event, Emitter emit) {
    emit(
        NumIdFilled(numId: event.numId)
    );
  }

  void _onFillPinEvent(FillPinEvent event, Emitter emit) {
    emit(
        PinFilled(pin: event.pin)
    );
  }

  void _onFillAuthEvent(FillAuthEvent event, Emitter emit) {
    emit(
        AuthFilled(isAuth: event.isAuth)
    );
  }

  void _onSeePasswordText(SeePasswordTextEvent event, Emitter emit) {
    emit(
        PasswordTextObscured(isObscured: event.isObscured!)
    );
  }

  void _onCancelPassEdit(CancelPasswordEdit event, Emitter emit){
    emit(
      PasswordEditCancelled(iconHeight: event.iconHeight)
    );
  }
}
