import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_info_tile.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/util/string_extension.dart';

class PassCardInfo extends StatefulWidget {

  final Password? passwordModel;

  const PassCardInfo({
    @required this.passwordModel,
    Key? key
  }) : super(key: key);

  @override
  _PassCardInfoState createState() => _PassCardInfoState();
}

class _PassCardInfoState extends State<PassCardInfo> {
  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      elevation: 8,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PassInfoTile(
            label: 'Item name:',
            detail: widget.passwordModel!.itemNamePass!.capitalize()
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'E-mail:',
            detail: widget.passwordModel!.email
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'Username:',
            detail: widget.passwordModel!.username
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'Nickname:',
            detail: widget.passwordModel!.nickname
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'ID:',
            detail: widget.passwordModel!.numId
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'Pin:',
            detail: widget.passwordModel!.pin
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'Password:',
            detail: widget.passwordModel!.password
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        },
            child: const Text(
              'Back',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            )
        )
      ],
    );
  }
}
