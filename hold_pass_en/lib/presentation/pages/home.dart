import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/presentation/bloc/home/home_bloc.dart';
import 'package:hold_pass_en/presentation/bloc/password/register/pass_register_bloc.dart';
import 'package:hold_pass_en/presentation/components/pass_card_alert.dart';
import 'package:hold_pass_en/presentation/pages/pass_information.dart';
import 'package:hold_pass_en/presentation/pages/pass_register.dart';
import 'package:hold_pass_en/core/util/action_type.dart';
import 'package:hold_pass_en/presentation/util/home/home_util.dart';

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
  double? _offsetFactor = .5;
  IconData _icon = Icons.save;
  final Password _passToRegister = GetIt.I.get<Password>()
    ..passType = PassType.email;
  HomeUtil? _homeUtil;

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpened = MediaQuery.of(context).viewInsets.bottom > 0.0;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<PassRegisterBloc, PassRegisterState>(
                listener: _fillPassFields
            ),
            BlocListener<HomeBloc, HomeState>(
              listenWhen: (pS, cS) => cS is PasswordSelected,
                listener: (context, state){
                  if(state is PasswordSelected){
                    _pageController.animateToPage(
                      state.pageIndex,
                      duration: const Duration(milliseconds: 850),
                      curve: Curves.decelerate
                    );

                    if(state.iconHeightValue == .0){
                      Timer(const Duration(milliseconds: 450), () {
                        context.read<HomeBloc>().add(
                          SelectPassToEditEvent(
                            passSelected: state.passwordSelection,
                            offset: state.offset,
                            iconHeight: 25.0
                          ));
                      });
                    }

                  }
                }
            ),
          ],
          child: Stack(
            children: [
              Scaffold(
                body: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state){
                    _homeUtil = HomeUtil(
                        context: context,
                        state: state
                    );

                    if(state is PasswordSelected){
                      _scrollPhysics = const NeverScrollableScrollPhysics();
                    } else if (state is PasswordEditCancelled){
                      _scrollPhysics = const PageScrollPhysics();
                    }

                    return PageView.builder(
                        physics: _scrollPhysics,
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        itemCount: _getPages().length,
                        onPageChanged: (index) {
                          if(state is! PasswordSelected){
                            _homeUtil!.onPageChange(index);
                          }
                        },
                        itemBuilder: (_, i) => _getPages()[i]
                    );
                  },
                ),
                bottomNavigationBar: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 8.0,
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return BottomNavigationBar(
                            backgroundColor: Colors.brown,
                            currentIndex: state.pageIndex,
                            selectedItemColor: Colors.orangeAccent,
                            unselectedItemColor: Colors.white60,
                            onTap: (index){
                              if(state is! PasswordSelected){
                                if(index != state.pageIndex) {
                                  _pageController.animateToPage(
                                      index,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.decelerate
                                  );
                                }
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
                        );
                      },
                    ),
                  ),
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation
                    .miniCenterDocked,
                floatingActionButton: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: isKeyboardOpened ? null : FloatingActionButton(
                    onPressed: (){
                      if(_pageController.page!.toInt() == 0){
                        if(!_formKey.currentState!.validate()){
                          return;
                        }

                        _doFunction(ActionType.register,
                            context
                        );
                      } else {
                        // _doFunction(ActionType.export, context);
                      }

                    },
                    backgroundColor: Colors.orangeAccent,
                    child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state){
                          return TweenAnimationBuilder<double>(
                            curve: Curves.easeOutQuad,
                            tween: Tween(begin: 25.0, end: state.iconHeightValue),
                            duration: const Duration(milliseconds: 250),
                            builder: (context, tween, child){
                              if(tween == .0){
                                if(state is! HomeInitial){
                                  if(state is PasswordSelected) {
                                    _icon = Icons.edit;
                                  } else if (state is PasswordsInformationSelected){
                                    _icon = Icons.upload_rounded;
                                  } else {
                                    _icon = Icons.save;
                                  }
                                }
                              }

                              return Icon(_icon,
                                size: tween,
                              );
                            },
                          );
                        }
                    ),
                  ),
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state){

                    if(state is PasswordSelected){
                      _offsetFactor = state.offset!;
                    } else if (state is PasswordEditCancelled){
                      _offsetFactor = .5;
                    }

                    return AnimatedPositioned(
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
                            context.read<HomeBloc>().add(
                                const CancelPasswordEditEvent(
                                  iconHeight: .0,
                                )
                            );
                            Timer(const Duration(milliseconds: 450), () {
                              context.read<HomeBloc>().add(
                                  const CancelPasswordEditEvent(iconHeight: 25.0)
                              );
                            });
                          },
                          child: const Icon(
                            Icons.cancel_outlined,
                            size: 35,
                          ),
                        )
                    );
                  }
              )
            ],
          ),
        )
    );
  }

  List<Widget> _getPages(){
    return [
      PassRegister(formKey: _formKey),
      const PassInformation()
    ];
  }

  void _doFunction(ActionType actionType, BuildContext context) {
    switch(actionType){
      case ActionType.register:
        _showDialog(
          _passToRegister,
          (){
            context.read<PassRegisterBloc>().add(RegisterPasswordEvent(
                passReadyToRegister: _passToRegister
            ));
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
        transitionDuration: const Duration(milliseconds: 250)
    );
  }

  void _fillPassFields(BuildContext context, PassRegisterState state){

    if(state is PassTypeFilled){
      _passToRegister.passType = state.passtType;
    }

    else if (state is ItemNameFilled){
      _passToRegister.itemNamePass = state.itemName.isEmpty ? '-'
          : state.itemName;
    }

    else if (state is EmailFilled){
      _passToRegister.email = state.email.isEmpty ? '-' : state.email;
    }

    else if (state is UsernameFilled){
      _passToRegister.username = state.username.isEmpty ? '-' : state.username;
    }

    else if (state is NicknameFilled){
      _passToRegister.nickname = state.nickname.isEmpty ? '-' : state.nickname;
    }

    else if (state is PasswordFilled){
      _passToRegister.password = state.password.isEmpty ? '-' :
        state.password;
    }

    else if (state is NumIdFilled){
      _passToRegister.numId = state.numId.isEmpty ? '-' : state.numId;
    }

    else if (state is PinFilled){
      _passToRegister.pin = state.pin.isEmpty ? '-' : state.pin;
    }

    else if (state is AuthFilled){
      _passToRegister.isAuth = state.isAuth;
    }
  }
}
