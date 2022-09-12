import 'package:flutter/material.dart';
import 'package:hold_pass_en/core/util/assets_path.dart';
import 'package:lottie/lottie.dart';

class PassLoading extends StatelessWidget {
  const PassLoading({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: Lottie.asset(
          holdLoading
        ),
      ),
    );
  }
}
