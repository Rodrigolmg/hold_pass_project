import 'package:flutter/material.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:hold_pass_en/util/string_extension.dart';

class PassCardSmry extends StatelessWidget {

  final Password? passwordModel;

  const PassCardSmry({
    Key? key,
    @required this.passwordModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Align(
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
                Text(passwordModel!.itemNamePass!.capitalize()),
                const SizedBox(
                  height: .8,
                ),
                Text(_getLabel(passwordModel!.passType!))
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
        return 'E-mail: ${passwordModel!.email}';
      case PassType.website:
      case PassType.app:
        return 'Username: ${passwordModel!.username}';
      case PassType.game:
        return 'Nickname: ${passwordModel!.nickname}';
    }
  }
}