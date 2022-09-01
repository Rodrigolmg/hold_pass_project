import 'package:flutter/material.dart';
import 'package:hold_pass_en/data/password_dao.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/pass_type.dart';

class PassProvider with ChangeNotifier {

  final PasswordDao _passDao = PasswordDao();

  PassType? _passType;
  String? _itemNamePass;
  String? _email;
  String? _username;
  String? _nickname;
  String? _password;
  String? _numId;
  String? _pin;
  bool _isAuth = false;

  bool isRegistered = false;

  List<Password>? _listPassEmails;
  List<Password>? _listPassWebsites;
  List<Password>? _listPassApps;
  List<Password>? _listPassGames;
  List<Password>? _listPassOthers;

  void setItemName(String itemName){
    _itemNamePass = itemName;
    notifyListeners();
  }

  void setEmail(String email){
    _email = email;
    notifyListeners();
  }

  void setUsername(String username){
    _username = username;
    notifyListeners();
  }

  void setNickname(String nick){
    _nickname = nick;
    notifyListeners();
  }

  void setPassword(String pass){
    _password = pass;
    notifyListeners();
  }

  void setNumId(String id){
    _numId = id;
    notifyListeners();
  }

  void setPin(String pin){
    _pin = pin;
    notifyListeners();
  }

  void setAuth(bool auth){
    _isAuth = auth;
    notifyListeners();
  }

  void registerPassword() async {
    Password pass = Password(
      passType: _passType,
      password: _password,
      itemNamePass: _itemNamePass,
      email: _email,
      username: _username,
      nickname: _nickname,
      numId: _numId,
      pin: _pin,
      isAuth: _isAuth
    );

    await _passDao.insert(pass);

  }

  void updatePassword(Password passToUpdate) async {
    await _passDao.update(passToUpdate);
  }

  void reloadPassList(PassType typeToReload) async {
    switch(typeToReload){
      case PassType.email:
        _listPassEmails = await _passDao.getPasswords(typeToReload);
        break;
      case PassType.website:
        _listPassWebsites = await _passDao.getPasswords(typeToReload);
        break;
      case PassType.app:
        _listPassApps = await _passDao.getPasswords(typeToReload);
        break;
      case PassType.game:
        _listPassGames = await _passDao.getPasswords(typeToReload);
        break;
      case PassType.other:
        _listPassOthers = await _passDao.getPasswords(typeToReload);
        break;
    }
    notifyListeners();
  }

}