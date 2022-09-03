import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_card_register_alert.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:hold_pass_en/pages/pass_information.dart';
import 'package:hold_pass_en/pages/pass_register.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin{

  double _height = 25.0;
  IconData _icon = Icons.save;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpened = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return SafeArea(
        child: Consumer<PassProvider>(
          builder: (context, passProvider, _) => Scaffold(
            body: PageView.builder(
                controller: passProvider.getPageController,
                scrollDirection: Axis.horizontal,
                itemCount: _getPages().length,
                onPageChanged: (index){
                  if(index != passProvider.getPageIndex) {
                    passProvider.setPageIndex(index);
                    setState(() {
                      _height = 0;
                    });

                    Timer(const Duration(milliseconds: 200), () {
                      setState(() {
                        _icon = index == 0 ? Icons.save : Icons.upload_rounded;
                        _height = 25.0;
                      });
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
                        setState(() {
                          _height = .0;
                        });

                        Timer(const Duration(milliseconds: 200), () {
                          setState(() {
                            _icon =
                            index == 0 ? Icons.save : Icons.upload_rounded;
                            _height = 25.0;
                          });
                        });
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
            floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isKeyboardOpened ? null : FloatingActionButton(
                onPressed: (){
                  if(!_formKey.currentState!.validate()){
                    return;
                  }
                  passProvider.confirmInfo();
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, a1, a2) => Container(),
                    transitionBuilder: (context, a1, a2, child) {
                      var curve = Curves.easeInQuad.transform(a1.value);
                      return Transform.scale(
                        scale: curve,
                        child: PassCardRegisterAlert(
                          passToRegister: passProvider.getPassToRegister
                        ),
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 250)
                  );
                },
                backgroundColor: Colors.orangeAccent,
                child: TweenAnimationBuilder<double>(
                  curve: Curves.easeOutQuad,
                  tween: Tween(begin: 25.0, end: _height),
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
}
