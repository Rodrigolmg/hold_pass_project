import 'package:flutter/material.dart';
import 'package:hold_pass_en/presentation/components/pass_info_tile.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/presentation/provider/pass_provider.dart';
import 'package:hold_pass_en/core/util/string_extension.dart';
import 'package:provider/provider.dart';

class PassCardInfo extends StatelessWidget {

  final PasswordModel? passwordModel;

  const PassCardInfo({
    @required this.passwordModel,
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
          PassInfoTile(
            label: 'Item name:',
            detail: passwordModel!.itemNamePass!.capitalize()
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'E-mail:',
            detail: passwordModel!.email
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'Username:',
            detail: passwordModel!.username
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'Nickname:',
            detail: passwordModel!.nickname
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'ID:',
            detail: passwordModel!.numId
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'Pin:',
            detail: passwordModel!.pin
          ),
          const SizedBox(
            height: .5,
          ),
          PassInfoTile(
            label: 'Password:',
            detail: passwordModel!.password
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text(
            'Back',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          )
        ),
        TextButton(
            onPressed: (){
              passProvider.setPasswordToEdit(passwordModel!);
              Navigator.of(context).pop();
              passProvider.animateToPage(0);
            },
            child: const Text(
              'Edit',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            )
        ),
      ],
    );
  }
}
