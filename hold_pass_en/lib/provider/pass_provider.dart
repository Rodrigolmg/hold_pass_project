import 'dart:async';

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

  bool _isRegistered = false;
  bool _isEdited = false;

  IconData _homeButtonIcon = Icons.save;
  double _height = 25.0;
  double _offsetFactor = .5;

  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // PASSWORD REGISTER SETS
  void setType(PassType? typeToRegister) {
    _passType = typeToRegister ?? PassType.email;
    notifyListeners();
  }

  void setItemName(String itemName){
    _itemNamePass = itemName.replaceBlank();
  }

  void setEmail(String email){
    _email = email.replaceBlank();
  }

  void setUsername(String username){
    _username = username.replaceBlank();
  }

  void setNickname(String nick){
    _nickname = nick.replaceBlank();
  }

  void setPassword(String pass){
    _password = pass.replaceBlank();
  }

  void setNumId(String id){
    _numId = id.replaceBlank();
  }

  void setPin(String pin){
    _pin = pin.replaceBlank();
  }

  void setAuth(bool auth){
    _isAuth = auth;
  }

  void setPasswordToEdit(Password passToEdit){
    _passToEdit = passToEdit;
    _isEdited = true;

    setType(_passToEdit!.passType);

    _itemNameController.text = _passToEdit!.itemNamePass!;
    _emailController.text = _passToEdit!.email ?? '';
    _usernameController.text = _passToEdit!.username ?? '';
    _nicknameController.text = _passToEdit!.nickname ?? '';
    _idController.text = _passToEdit!.numId ?? '';
    _pinController.text = _passToEdit!.pin ?? '';
    _passwordController.text = _passToEdit!.password!;
    _offsetFactor = .0;
    notifyListeners();
  }

  // PAGE CONTROLLER
  void setPageIndex(int pageIndex) {
    _currentPageIndex = pageIndex;


    notifyListeners();
  }

  void setIcon(){
    if(!_isEdited){
      _homeButtonIcon = _currentPageIndex == 0 ?
      Icons.save : Icons.upload_rounded;
    } else {
      _homeButtonIcon = Icons.edit;
    }
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

  void setIconHeight(double height) {
    _height = height;
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

  void confirmInfoToEdit(){
    _isEdited = false;
    _passToEdit = Password(
      id: _passToEdit!.id,
      passType: _passType,
      password: _password ?? _passwordController.text,
      itemNamePass: _itemNamePass ?? _itemNameController.text,
      email: _email ?? _emailController.text,
      username: _username ?? _usernameController.text,
      nickname: _nickname ?? _nicknameController.text,
      numId: _numId ?? _idController.text,
      pin: _pin ?? _pinController.text,
      isAuth: _isAuth
    );
    notifyListeners();
  }

  void registerPassword() async {
    await _passDao.insert(_passToRegister!);
    await resetInfo();
    notifyListeners();
  }

  void updatePassword() async {
    Map<String, Object?>? json = await _passDao.update(_passToEdit!);
    _isEdited = json != null;
    await resetInfo();
    notifyListeners();
  }

  void deletePassword(Password passToDelete, PassType type) async {
    await _passDao.delete(passToDelete);
    notifyListeners();
  }

  Future<List<Password>> reloadPassList(PassType typeToReload) async {
    return await _passDao.getPasswords(typeToReload);
  }

  Future<void> resetInfo() async {

    _isEdited = !_isEdited;

    _passType = PassType.email;
    _itemNamePass = null;
    _email = null;
    _username = null;
    _nickname = null;
    _numId = null;
    _pin = null;
    _isAuth = false;

    _itemNameController.text = '';
    _emailController.text = '';
    _usernameController.text = '';
    _nicknameController.text = '';
    _idController.text = '';
    _pinController.text = '';
    _passwordController.text = '';

    // _homeButtonIcon = Icons.save;
    _offsetFactor = .1;
    notifyListeners();
  }

  Password? get getPassToEdit => _passToEdit;
  Password? get getPassToRegister => _passToRegister;
  PageController get getPageController => _pageController;
  int get getPageIndex => _currentPageIndex;
  PassType get getPassType => _passType;
  IconData get getIconButton => _homeButtonIcon;
  double get getIconHeight => _height;
  double get getOffsetFactor => _offsetFactor;

  bool get isEditing => _isEdited;

  TextEditingController get getItemNameController => _itemNameController;
  TextEditingController get getEmailController => _emailController;
  TextEditingController get getUsernameController => _usernameController;
  TextEditingController get getNicknameController => _nicknameController;
  TextEditingController get getIdController => _idController;
  TextEditingController get getPinController => _pinController;
  TextEditingController get getPasswordController => _passwordController;

}