import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_info_tile.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:hold_pass_en/util/pass_type_name.dart';
import 'package:hold_pass_en/util/string_extension.dart';
import 'package:provider/provider.dart';

class PassCardRegisterAlert extends StatelessWidget {
  
  final Password? passToRegister;
  final bool isRegister;

  const PassCardRegisterAlert({
    @required this.passToRegister,
    this.isRegister = true,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PassProvider passProvider =
      Provider.of<PassProvider>(context, listen: false);
    
    return AlertDialog(
      elevation: 8,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(child: Text('Is password info correct?')),
          const SizedBox(
            height: 25,
          ),
          PassInfoTile(
              label: 'Item type:',
              detail: PassTypeName.getTypeName(passToRegister!.passType!).capitalize()
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Item name:',
              detail: passToRegister!.itemNamePass!.capitalize()
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'E-mail:',
              detail: passToRegister!.email
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Username:',
              detail: passToRegister!.username
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Nickname:',
              detail: passToRegister!.nickname
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'ID:',
              detail: passToRegister!.numId
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Pin:',
              detail: passToRegister!.pin
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Password:',
              detail: passToRegister!.password
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text(
              'No, I\'ll edit it',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            )
        ),
        TextButton(
            onPressed: (){
              passProvider.registerPassword();
              Navigator.of(context).pop();
            },
            child: const Text(
              'Yes, register',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            )
        ),
      ],
    );
  }
}