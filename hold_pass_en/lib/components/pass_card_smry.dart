import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:hold_pass_en/util/string_extension.dart';

class PassCardSmry extends StatefulWidget {

  final Password? passwordModel;
  final int? delay;

  const PassCardSmry({
    Key? key,
    @required this.passwordModel,
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

    return FadeTransition(
      opacity: _controller!,
      child: SlideTransition(
        position: _animOffset!,
        child: Align(
          child: SizedBox(
            width: width * .8,
            height: height * .1,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.passwordModel!.itemNamePass!.capitalize()),
                    const SizedBox(
                      height: .8,
                    ),
                    Text(_getLabel(widget.passwordModel!.passType!))
                  ],
                ),
              ),
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
        return 'E-mail: ${widget.passwordModel!.email}';
      case PassType.website:
      case PassType.app:
        return 'Username: ${widget.passwordModel!.username}';
      case PassType.game:
        return 'Nickname: ${widget.passwordModel!.nickname}';
    }
  }
}