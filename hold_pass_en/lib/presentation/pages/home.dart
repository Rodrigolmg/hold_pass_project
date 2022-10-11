import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/presentation/bloc/home/home_bloc.dart';
import 'package:hold_pass_en/presentation/bloc/password/password_bloc.dart';
import 'package:hold_pass_en/presentation/components/pass_card_alert.dart';
import 'package:hold_pass_en/presentation/pages/pass_information.dart';
import 'package:hold_pass_en/presentation/pages/pass_register.dart';
import 'package:hold_pass_en/core/util/action_type.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{

  final _formKey = GlobalKey<FormState>();
  final Offset _offset = Offset.zero;
  final PageController _pageController = PageController(
      initialPage: 0
  );

  ScrollPhysics? _scrollPhysics;
  int _pageIndex = 0;
  double _iconHeight = 25.0;
  double? _offsetFactor = .5;
  IconData? _icon = Icons.save;
  bool _isEditing = false;
  Password? _passToRegister = GetIt.I.get<Password>();

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpened = MediaQuery.of(context).viewInsets.bottom > 0.0;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<HomeBloc, HomeState>(
              listener: _homeListener
            ),
            BlocListener<PasswordBloc, PasswordState>(
              listener: _passwordListener
            ),
          ],
          child: Stack(
            children: [
              Scaffold(
                body: PageView.builder(
                    physics: _scrollPhysics,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _getPages().length,
                    onPageChanged: (index) async {
                      if(index != _pageIndex) {
                        context.read<HomeBloc>().add(
                          ChangePageEvent(
                           iconHeight: .0,
                           pageIndex: index
                          )
                        );
                        Timer(const Duration(milliseconds: 450), () {
                          context.read<HomeBloc>().add(
                            ChangePageEvent(
                              iconHeight: 25.0,
                              pageIndex: index
                            )
                          );
                          // passProvider.setIcon();
                          // passProvider.setIconHeight(25.0);
                        });
                      }
                    },
                    itemBuilder: (_, i) => _getPages()[i]
                ),
                bottomNavigationBar: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 8.0,
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    child: BottomNavigationBar(
                        backgroundColor: Colors.brown,
                        currentIndex: _pageIndex,
                        selectedItemColor: Colors.orangeAccent,
                        unselectedItemColor: Colors.white60,
                        onTap: (index){
                          if(index != _pageIndex) {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.decelerate
                            );
                          }
                        },
                        items: const [
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.app_registration_outlined,
                              ),
                              label: 'Register'
                          ),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.info_outline),
                              label: 'Passwords info'
                          )
                        ]
                    ),
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation
                    .miniCenterDocked,
                floatingActionButton: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isKeyboardOpened ? null : FloatingActionButton(
                    onPressed: (){
                      if(!_formKey.currentState!.validate()){
                        return;
                      }
                      if(_pageIndex == 0){
                        _doFunction(_isEditing ?
                          ActionType.edit :
                          ActionType.register,
                          context
                        );
                      } else {
                        _doFunction(ActionType.export, context);
                      }

                    },
                    backgroundColor: Colors.orangeAccent,
                    child: TweenAnimationBuilder<double>(
                        curve: Curves.easeOutQuad,
                        tween: Tween(begin: 25.0, end: _iconHeight),
                        duration: const Duration(milliseconds: 250),
                        builder: (context, tween, child){
                          return Icon(_icon,
                            size: tween,
                          );
                        }
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 500),
                  right: _offset.dx - (height * _offsetFactor!),
                  top: width * .05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10)
                    ),
                    onPressed: () async {
                      if(_isEditing) {
                        context.read<PasswordBloc>().add(
                          CancelPasswordEdit().call(.0)
                        );
                        Timer(const Duration(milliseconds: 450), () {
                          context.read<PasswordBloc>().add(
                            CancelPasswordEdit().call(25.0)
                          );
                        });
                      }
                    },
                    child: const Icon(
                      Icons.cancel_outlined,
                      size: 35,
                    ),
                  )
              )
            ],
          )
        )
    );
  }

  void _homeListener(BuildContext context, HomeState state){
    _pageIndex = state.pageIndex;
    _icon = state.icon;
    _iconHeight = state.iconHeightValue;
  }

  void _passwordListener(BuildContext context, PasswordState state){
    if(state is PasswordSelected){
      _isEditing = state.isEditing;
      _scrollPhysics = _isEditing ? const NeverScrollableScrollPhysics()
          : const PageScrollPhysics();
      _offsetFactor = state.offset;
      _icon = Icons.edit;
    } else if (state is ConfirmingPasswordToRegister){
      _passToRegister = state.passwordToRegister;
    } else {
      _fillPassFields(state);
    }
  }

  List<Widget> _getPages(){
    return [
      Form(
        key: _formKey,
        child: const PassRegister()
      ),
      const PassInformation()
    ];
  }

  void _doFunction(ActionType actionType, BuildContext context) {
    switch(actionType){
      case ActionType.register:
        context.read<PasswordBloc>().add(
            ConfirmPasswordRegisterEvent().call(_passToRegister!)
        );
        _showDialog(
          _passToRegister,
          (){
            context.read<PasswordBloc>().add(RegisterPasswordEvent()
                .call(_passToRegister!));
            // Reload event
          }
        );
        break;
      case ActionType.edit:
        // passProvider.confirmInfoToEdit();
        // _showDialog(
        //   passProvider.getPassToEdit,
        //   passProvider.updatePassword
        // );
        break;
      case ActionType.export:
        break;
      case ActionType.delete:
        break;
    }
  }

  void _showDialog(Password? password, Function callback){
    showGeneralDialog(
        context: context,
        pageBuilder: (context, a1, a2) => Container(),
        transitionBuilder: (context, a1, a2, child) {
          var curve = Curves.easeInQuad.transform(a1.value);
          return Transform.scale(
            scale: curve,
            child: PassCardAlert(
              password: password,
              callback: callback,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 230)
    );
  }

  void _fillPassFields(PasswordState state){

    if(state is PassTypeFilled){
      _passToRegister!.passType = state.passtType;
    }

    else if (state is ItemNameFilled){
      _passToRegister!.itemNamePass = state.itemName.isEmpty ? '-'
          : state.itemName;
    }

    else if (state is EmailFilled){
      _passToRegister!.email = state.email.isEmpty ? '-' : state.email;
    }

    else if (state is UsernameFilled){
      _passToRegister!.username = state.username.isEmpty ? '-' : state.username;
    }

    else if (state is NicknameFilled){
      _passToRegister!.nickname = state.nickname.isEmpty ? '-' : state.nickname;
    }

    else if (state is PasswordFilled){
      _passToRegister!.password = state.password.isEmpty ? '-' :
        state.password;
    }

    else if (state is NumIdFilled){
      _passToRegister!.numId = state.numId.isEmpty ? '-' : state.numId;
    }

    else if (state is PinFilled){
      _passToRegister!.pin = state.pin.isEmpty ? '-' : state.pin;
    }

    else if (state is AuthFilled){
      _passToRegister!.isAuth = state.isAuth;
    }
  }
}
