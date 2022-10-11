import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/presentation/components/pass_card_alert.dart';
import 'package:hold_pass_en/presentation/components/pass_card_info.dart';
import 'package:hold_pass_en/presentation/provider/pass_provider.dart';
import 'package:hold_pass_en/core/util/action_type.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/core/util/string_extension.dart';
import 'package:provider/provider.dart';

class PassCardSmry extends StatefulWidget {

  final Password? password;
  final int? delay;
  final Function? reloadListCallback;

  const PassCardSmry({
    Key? key,
    @required this.password,
    @required this.reloadListCallback,
    this.delay
  }) : super(key: key);

  @override
  State<PassCardSmry> createState() => _PassCardSmryState();
}

class _PassCardSmryState extends State<PassCardSmry>
    with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  Animation<Offset>? _animOffset;

  void _setUpAnimation(){
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300)
    );

    final curve = CurvedAnimation(
        parent: _controller!,
        curve: Curves.decelerate
    );

    _animOffset = Tween<Offset>(
        begin: const Offset(.35, .0),
        end: Offset.zero
    ).animate(curve);

    if(widget.delay == null){
      _controller!.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay!), (){_controller!.forward();});
    }
  }

  @override
  void initState() {
    super.initState();
    _setUpAnimation();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    PassProvider passProvider = Provider.of<PassProvider>(
      context,
      listen: false
    );

    return FadeTransition(
      opacity: _controller!,
      child: SlideTransition(
        position: _animOffset!,
        child: Align(
          child: SizedBox(
            width: width * .8,
            height: height * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: GestureDetector(
                    onTap: (){
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, a1, a2) => Container(),
                        transitionBuilder: (context, a1, a2, child) {
                          var curve = Curves.easeInQuad.transform(a1.value);
                          return Transform.scale(
                            scale: curve,
                            child: PassCardInfo(
                              password: widget.password!
                            ),
                          );
                        },
                        transitionDuration: const Duration(milliseconds: 230)
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.password!.itemNamePass!.capitalize()),
                        const SizedBox(
                          height: .8,
                        ),
                        Text(_getLabel(widget.password!.passType!))
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: (){
                      // passProvider
                      //     .setPasswordToDelete(widget.password!);
                      showGeneralDialog(
                          context: context,
                          pageBuilder: (context, a1, a2) => Container(),
                          transitionDuration: const Duration(milliseconds: 250),
                          transitionBuilder: (context, a1, a2, child){
                            var curve = Curves.easeInQuad.transform(a1.value);
                            return Transform.scale(
                              scale: curve,
                              child: PassCardAlert(
                                  actionType: ActionType.delete,
                                  password: widget.password!,
                                  callback: () {
                                    passProvider.deletePassword();
                                    widget.reloadListCallback!();
                                  }
                              ),
                            );
                          }
                      );
                    },
                    icon: const Icon(
                      Icons.delete_outlined,
                      color: Colors.red,
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getLabel(PassType type){
    switch(type){
      case PassType.email:
      case PassType.other:
        return 'E-mail: ${widget.password!.email}';
      case PassType.website:
      case PassType.app:
        return 'Username: ${widget.password!.username}';
      case PassType.game:
        return 'Nickname: ${widget.password!.nickname}';
    }
  }
}