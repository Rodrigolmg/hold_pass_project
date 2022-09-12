import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hold_pass_en/presentation/pages/home.dart';
import 'package:hold_pass_en/core/util/assets_path.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(milliseconds: 2500), (){
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home())
        );
      }
    );


    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Center(
          child: Lottie.asset(
            holdIntro,
            repeat: false,
            controller: _controller,
            onLoaded: (composition) {
              _controller..duration = composition.duration..forward();
            }
          ),
        ),
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2100)
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
