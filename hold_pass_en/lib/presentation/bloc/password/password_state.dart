part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();
}

// Initial State
class Empty extends PasswordState {
  @override
  List<Object> get props => [];
}

// Password lists state
class PasswordListLoading extends PasswordState {

  final PassType? passType;
  final List<Password>? passList;

  const PasswordListLoading({@required this.passType, this.passList});

  @override
  List<Object> get props => [passType!];
}

class PasswordListLoaded extends PasswordState {

  final List<Password>? passwords;

  const PasswordListLoaded({@required this.passwords});

  @override
  List<Object> get props => [passwords!];
}

class EmptyPasswordList extends PasswordState {
  @override
  List<Object> get props => [];
}

class FetchingPassList extends PasswordState{

  final PassType? passTypeToReload;

  const FetchingPassList({required this.passTypeToReload});

  @override
  // TODO: implement props
  List<Object?> get props => [passTypeToReload];

}

// Register password state
class PasswordRegistered extends PasswordState {

  final Password? passwordRegistered;

  const PasswordRegistered({@required this.passwordRegistered});

  @override
  List<Object> get props => [passwordRegistered!];
}

class PassTypeFilled extends PasswordState {

  final PassType passtType;

  const PassTypeFilled({this.passtType = PassType.email});

  @override
  List<Object?> get props => [passtType];

}

class ItemNameFilled extends PasswordState {

  final String itemName;

  const ItemNameFilled({this.itemName = '-'});

  @override
  List<Object?> get props => [itemName];

}

class EmailFilled extends PasswordState {

  final String email;

  const EmailFilled({this.email = '-'});

  @override
  List<Object?> get props => [email];

}

class UsernameFilled extends PasswordState {

  final String username;

  const UsernameFilled({this.username = '-'});

  @override
  List<Object?> get props => [username];

}

class NicknameFilled extends PasswordState {

  final String nickname;

  const NicknameFilled({this.nickname = '-'});

  @override
  List<Object?> get props => [nickname];

}

class PasswordFilled extends PasswordState {

  final String password;

  const PasswordFilled({this.password = '-'});

  @override
  List<Object?> get props => [password];

}

class NumIdFilled extends PasswordState {

  final String numId;

  const NumIdFilled({this.numId = '-'});

  @override
  List<Object?> get props => [numId];

}

class PinFilled extends PasswordState {

  final String pin;

  const PinFilled({this.pin = '-'});

  @override
  List<Object?> get props => [pin];

}

class AuthFilled extends PasswordState {

  final bool isAuth;

  const AuthFilled({this.isAuth = false});

  @override
  List<Object?> get props => [isAuth];

}

class ConfirmingPasswordToRegister extends PasswordState {

  final Password? passwordToRegister;

  const ConfirmingPasswordToRegister({@required this.passwordToRegister});

  @override
  List<Object> get props => [passwordToRegister!.id!];
}

// Password obscure text state
class PasswordTextObscured extends PasswordState{

  final bool? isObscured;

  const PasswordTextObscured({this.isObscured});

  @override
  List<Object?> get props => [isObscured];

}

class PasswordTextRevealed extends PasswordState{

  final bool? isObscured;

  const PasswordTextRevealed({this.isObscured});

  @override
  List<Object?> get props => [isObscured];

}

// Edit password state
class PasswordEdited extends PasswordState {

  final Password? passwordEdited;
  final double? offset;

  const PasswordEdited({@required this.passwordEdited, this.offset});

  @override
  List<Object> get props => [passwordEdited!.id!, offset!];
}

class PasswordSelected extends PasswordState {

  final Password? passwordSelection;
  final double? offset;

  const PasswordSelected({@required this.passwordSelection, this.offset});

  bool get isEditing => passwordSelection != null;

  @override
  List<Object> get props => [passwordSelection!.id!, offset!];
}

class PasswordDeleted extends PasswordState {

  final Password? passwordDeleted;

  const PasswordDeleted({@required this.passwordDeleted});

  @override
  List<Object> get props => [passwordDeleted!.id!];
}

class PasswordEditCancelled extends PasswordState {

  final double? iconHeight;

  final Password passwordReseted = Password(
    passType: PassType.email,
    itemNamePass: '',
    email: '',
    username: '',
    nickname: '',
    password: '',
    numId: '',
    pin: '',
    isAuth: false
  );

  PasswordEditCancelled({this.iconHeight});

  @override
  List<Object?> get props => [iconHeight];

}






