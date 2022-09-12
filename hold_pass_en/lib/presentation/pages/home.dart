import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hold_pass_en/presentation/components/pass_card_alert.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/presentation/provider/pass_provider.dart';
import 'package:hold_pass_en/presentation/pages/pass_information.dart';
import 'package:hold_pass_en/presentation/pages/pass_register.dart';
import 'package:hold_pass_en/core/util/action_type.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{

  final _formKey = GlobalKey<FormState>();
  final Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpened = MediaQuery.of(context).viewInsets.bottom > 0.0;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Consumer<PassProvider>(
          builder: (context, passProvider, _) => Stack(
            children: [
              Scaffold(
                body: PageView.builder(
                  physics: passProvider.isEditing ? const NeverScrollableScrollPhysics()
                    : const PageScrollPhysics(),
                  controller: passProvider.getPageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _getPages().length,
                  onPageChanged: (index) async {
                    if(index != passProvider.getPageIndex) {
                      passProvider.setIconHeight(.0);
                      passProvider.setPageIndex(index);
                      Timer(const Duration(milliseconds: 450), () {
                        passProvider.setIcon();
                        passProvider.setIconHeight(25.0);
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
                        currentIndex: passProvider.getPageIndex,
                        selectedItemColor: Colors.orangeAccent,
                        unselectedItemColor: Colors.white60,
                        onTap: (index){
                          if(index != passProvider.getPageIndex) {
                            passProvider.animateToPage(index);
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
                      if(passProvider.getPageIndex == 0){
                        _doFunction(!passProvider.isEditing ?
                            ActionType.register :
                            ActionType.edit,
                            passProvider
                        );
                      } else {
                        _doFunction(ActionType.export, passProvider);
                      }

                    },
                    backgroundColor: Colors.orangeAccent,
                    child: TweenAnimationBuilder<double>(
                        curve: Curves.easeOutQuad,
                        tween: Tween(begin: 25.0, end: passProvider.getIconHeight),
                        duration: const Duration(milliseconds: 250),
                        builder: (context, tween, child){
                          return Icon(passProvider.getIconButton,
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
                right: _offset.dx - (height * passProvider.getOffsetFactor),
                top: width * .05,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10)
                  ),
                  onPressed: () async {
                    if(passProvider.isEditing) {
                      passProvider.setIconHeight(.0);
                      passProvider.resetInfo();
                      Timer(const Duration(milliseconds: 450), () {
                        passProvider.setIcon();
                        passProvider.setIconHeight(25.0);
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
          ),
        )
    );
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

  void _doFunction(ActionType actionType, PassProvider passProvider) {
    switch(actionType){
      case ActionType.register:
        passProvider.confirmInfo();
        _showDialog(
          passProvider.getPassToRegister,
          (){
            passProvider.registerPassword();
            passProvider.reloadPassList(
              passProvider.getPassToRegister!.passType!
            );
          }
        );
        break;
      case ActionType.edit:
        passProvider.confirmInfoToEdit();
        _showDialog(
          passProvider.getPassToEdit,
          passProvider.updatePassword
        );
        break;
      case ActionType.export:
        break;
      case ActionType.delete:
        break;
    }
  }

  void _showDialog(PasswordModel? password, Function callback){
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

}
