import 'package:flutter/material.dart';
import 'package:hold_pass_en/data/password_dao.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:hold_pass_en/util/string_extension.dart';

class PassProvider with ChangeNotifier {

  final PasswordDao _passDao = PasswordDao();
  final PageController _pageController = PageController(
      initialPage: 0
  );

  int _currentPageIndex = 0;

  Password? _passToEdit;
  Password? _passToRegister;

  PassType _passType = PassType.email;
  String? _itemNamePass;
  String? _email;
  String? _username;
  String? _nickname;
  String? _password;
  String? _numId;
  String? _pin;
  bool _isAuth = false;

  bool isRegistered = false;

  List<Password> _listPassEmails = [];
  List<Password> _listPassWebsites = [];
  List<Password> _listPassApps = [];
  List<Password> _listPassGames = [];
  List<Password> _listPassOthers = [];

  // PASSWORD REGISTER SETS
  void setType(PassType? typeToRegister) {
    _passType = typeToRegister ?? PassType.email;
    notifyListeners();
  }

  void setItemName(String itemName){
    _itemNamePass = itemName.replaceBlank();
    notifyListeners();
  }

  void setEmail(String email){
    _email = email.replaceBlank();
    notifyListeners();
  }

  void setUsername(String username){
    _username = username.replaceBlank();
    notifyListeners();
  }

  void setNickname(String nick){
    _nickname = nick.replaceBlank();
    notifyListeners();
  }

  void setPassword(String pass){
    _password = pass.replaceBlank();
    notifyListeners();
  }

  void setNumId(String id){
    _numId = id.replaceBlank();
    notifyListeners();
  }

  void setPin(String pin){
    _pin = pin.replaceBlank();
    notifyListeners();
  }

  void setAuth(bool auth){
    _isAuth = auth;
    notifyListeners();
  }

  void setPasswordToEdit(Password passToEdit){
    _passToEdit = passToEdit;
    notifyListeners();
  }

  // PAGE CONTROLLER
  void setPageIndex(int pageIndex) {
    _currentPageIndex = pageIndex;
    notifyListeners();
  }

  void animateToPage(int index) {
    _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate
    );
    notifyListeners();
  }

  // PASSWORD DAO
  void confirmInfo(){
    _passToRegister = Password(
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
    notifyListeners();
  }

  void registerPassword() async {
    await _passDao.insert(_passToRegister!);
    reloadPassList(_passToRegister!.passType!);
    resetInfo();
    notifyListeners();
  }

  void updatePassword(Password passToUpdate) async {
    await _passDao.update(passToUpdate);
    reloadPassList(passToUpdate.passType!);
  }

  void deletePassword(Password passToDelete, PassType type) async {
    await _passDao.delete(passToDelete);
    reloadPassList(type);
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

  void resetInfo() {
    _passType = PassType.email;
    _itemNamePass = null;
    _email = null;
    _username = null;
    _nickname = null;
    _numId = null;
    _pin = null;
    _isAuth = false;
    notifyListeners();
  }

  List<Password> get getPassEmails => _listPassEmails;
  List<Password> get getPassWebsites => _listPassWebsites;
  List<Password> get getPassApps => _listPassApps;
  List<Password> get getPassGames => _listPassGames;
  List<Password> get getPassOthers => _listPassOthers;
  Password? get getPassToEdit => _passToEdit;
  Password? get getPassToRegister => _passToRegister;
  PageController get getPageController => _pageController;
  int get getPageIndex => _currentPageIndex;
  PassType get getPassType => _passType;
}