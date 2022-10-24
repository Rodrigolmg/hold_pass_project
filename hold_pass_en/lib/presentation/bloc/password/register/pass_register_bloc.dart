
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';

part 'pass_register_event.dart';
part 'pass_register_state.dart';

class PassRegisterBloc extends Bloc<PassRegisterEvent, PassRegisterState> {
  PassRegisterBloc() : super(PassRegisterInitial()) {
    on<SelectPassTypeEvent>(_onSelectingPassType);
    on<FillItemNameEvent>(_onItemNameFilled);
    on<FillEmailEvent>(_onEmailFilled);
    on<FillUsernameEvent>(_onUsernameFilled);
    on<FillNicknameEvent>(_onNicknameFilled);
    on<FillPasswordEvent>(_onPasswordFilled);
    on<FillNumIdEvent>(_onNumIdFilled);
    on<FillPinEvent>(_onPinFilled);
    on<FillAuthEvent>(_onAuthFilled);
    on<ConfirmPasswordRegisterEvent>(_onConfirmPasswordToRegister);
    on<RegisterPasswordEvent>(_onPasswordRegister);
    on<ConfirmPasswordEditEvent>(_onConfirmPasswordToEdit);
    on<EditPasswordEvent>(_onPasswordEdit);

  }

  void _onSelectingPassType(SelectPassTypeEvent event, Emitter emit){
    emit(
      PassTypeFilled(passtType: event.passType)
    );
  }

  void _onItemNameFilled(FillItemNameEvent event, Emitter emit){
    emit(
      ItemNameFilled(itemName: event.itemName)
    );
  }

  void _onEmailFilled(FillEmailEvent event, Emitter emit){
    emit(
        EmailFilled(email: event.email)
    );
  }

  void _onUsernameFilled(FillUsernameEvent event, Emitter emit){
    emit(
        UsernameFilled(username: event.username)
    );
  }

  void _onNicknameFilled(FillNicknameEvent event, Emitter emit){
    emit(
        NicknameFilled(nickname: event.nickname)
    );
  }

  void _onPasswordFilled(FillPasswordEvent event, Emitter emit){
    emit(
        PasswordFilled(password: event.password)
    );
  }

  void _onNumIdFilled(FillNumIdEvent event, Emitter emit){
    emit(
        NumIdFilled(numId: event.numId)
    );
  }

  void _onPinFilled(FillPinEvent event, Emitter emit){
    emit(
        PinFilled(pin: event.pin)
    );
  }

  void _onAuthFilled(FillAuthEvent event, Emitter emit){
    emit(
        AuthFilled(isAuth: event.isAuth)
    );
  }

  void _onConfirmPasswordToRegister(ConfirmPasswordRegisterEvent event, Emitter emit){
    emit(
        ConfirmingPasswordToRegister(passwordToRegister: event.passToRegister)
    );
  }

  void _onPasswordRegister(RegisterPasswordEvent event, Emitter emit){
    emit(
        PasswordRegistered(passwordRegistered: event.passReadyToRegister)
    );
  }

  void _onConfirmPasswordToEdit(ConfirmPasswordEditEvent event, Emitter emit){
    emit(
        ConfirmingPasswordToEdit(passwordToEdit: event.passToEdit)
    );
  }

  void _onPasswordEdit(EditPasswordEvent event, Emitter emit){
    emit(
        PasswordEdited(passwordEdited: event.passReadyToUpdate)
    );
  }


}
