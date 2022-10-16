import 'package:flutter/material.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/presentation/bloc/password/password_bloc.dart';
import 'package:hold_pass_en/presentation/components/pass_info_tile.dart';
import 'package:hold_pass_en/core/util/string_extension.dart';
import 'package:provider/provider.dart';

class PassCardInfo extends StatelessWidget {

  final Password? password;

  const PassCardInfo({
    @required this.password,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // PassProvider passProvider =
    //   Provider.of<PassProvider>(context, listen: false);

    return AlertDialog(
      elevation: 8,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
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
            'Back',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          )
        ),
        TextButton(
            onPressed: (){
              context.read<PasswordBloc>().add(
                SelectPassToEditEvent(passSelected: password!)
              );
              // passProvider.setPasswordToEdit(password!);
              Navigator.of(context).pop();

              // passProvider.animateToPage(0);
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
