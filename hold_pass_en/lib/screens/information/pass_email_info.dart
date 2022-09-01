import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_card_info.dart';
import 'package:hold_pass_en/components/pass_card_smry.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/pass_type.dart';

class PassEmailInfo extends StatefulWidget {
  const PassEmailInfo({Key? key}) : super(key: key);

  @override
  _PassEmailInfoState createState() => _PassEmailInfoState();
}

class _PassEmailInfoState extends State<PassEmailInfo> {

  List<Password> _getPass(){
    return [
      Password(
        itemNamePass: 'gmail',
        email: 'email.test@gmail.com',
        username: 'User 1',
        password: '88794',
        passType: PassType.email
      ),
      Password(
        itemNamePass: 'outlook',
        email: 'email.test@outlook.com',
          username: 'User 2',
        password: '5647892',
        passType: PassType.email
      ),
      Password(
        itemNamePass: 'hotmail',
        email: 'email.test@hotmail.com',
          username: 'User 3',
        password: '231457',
        passType: PassType.email
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListView.builder(
        itemCount: _getPass().length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GestureDetector(
            onTap: (){
              showDialog<void>(
                context: context,
                builder: (context) {
                  return PassCardInfo(passwordModel: _getPass()[i]);
                }
              );
            },
            child: PassCardSmry(passwordModel: _getPass()[i])
          ),
        )
      ),
    );
  }
}
