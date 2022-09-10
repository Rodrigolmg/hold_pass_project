import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_info_tile.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/action_type.dart';
import 'package:hold_pass_en/util/pass_type_name.dart';
import 'package:hold_pass_en/util/string_extension.dart';

class PassCardAlert extends StatelessWidget {
  
  final Password? password;
  final ActionType actionType;
  final Function? callback;

  const PassCardAlert({
    @required this.password,
    this.actionType = ActionType.register,
    @required this.callback,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String title = actionType == ActionType.delete ? 'Are you sure to delete?'
        : 'Is password info correct?';

    return AlertDialog(
      elevation: 8,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(title)
          ),
          const SizedBox(
            height: 25,
          ),
          PassInfoTile(
              label: 'Item type:',
              detail: PassTypeName.getTypeName(password!.passType!).capitalize()
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Item name:',
              detail: password!.itemNamePass!.capitalize()
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'E-mail:',
              detail: password!.email
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Username:',
              detail: password!.username
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Nickname:',
              detail: password!.nickname
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'ID:',
              detail: password!.numId
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Pin:',
              detail: password!.pin
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
              label: 'Password:',
              detail: password!.password
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text(
              'No',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            )
        ),
        TextButton(
            onPressed: (){
              callback!();
              Navigator.of(context).pop();
            },
            child: Text(
              'Yes, ${actionType.descr}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold
              ),
            )
        ),
      ],
    );
  }
}