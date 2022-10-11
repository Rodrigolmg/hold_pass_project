// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hold_pass_en/presentation/bloc/password/password_bloc.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';

class PassTypeList extends StatelessWidget {

  PassTypeList({Key? key,}) : super(key: key);

  PassType? _passType = PassType.email;

  void _getPassTypeValue(context, PasswordState state){
    if(state is PassTypeFilled){
      _passType = const PassTypeFilled().passtType;
    } else {
      _passType = PassType.email;
    }
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Item Type',
          style: TextStyle(
            fontSize: 18
          ),
        ),
        SizedBox(
          height: height * .08,
          child: BlocListener<PasswordBloc, PasswordState>(
            listener: _getPassTypeValue,
            child: DropdownButton<PassType>(
                underline: Container(
                  height: .8,
                  color: Colors.orangeAccent,
                ),
                value: _passType,
                isExpanded: true,
                icon: const Icon(
                  Icons.arrow_downward,
                  size: 20,
                ),
                items: [
                  DropdownMenuItem<PassType>(
                    value: PassType.email,
                    child: Row(
                      children: [
                        const Icon(Icons.alternate_email),
                        SizedBox(
                          width: width * .08,
                        ),
                        const Text('E-mail'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<PassType>(
                    value: PassType.website,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.http,
                          size: 25,
                        ),
                        SizedBox(
                          width: width * .08,
                        ),
                        const Text('Website'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<PassType>(
                    value: PassType.app,
                    child: Row(
                      children: [
                        const Icon(Icons.phone_android),
                        SizedBox(
                          width: width * .08,
                        ),
                        const Text('App'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<PassType>(
                    value: PassType.game,
                    child: Row(
                      children: [
                        const Icon(Icons.videogame_asset),
                        SizedBox(
                          width: width * .08,
                        ),
                        const Text('Game'),
                      ],
                    ),
                  ),
                  DropdownMenuItem<PassType>(
                    value: PassType.other,
                    child: Row(
                      children: [
                        const Icon(Icons.question_mark),
                        SizedBox(
                          width: width * .08,
                        ),
                        const Text('Other'),
                      ],
                    ),
                  )
                ],
                onChanged: (passType) => context.read<PasswordBloc>()
                    .add(SelectPassTypeEvent().call(passType!))
            ),
          ),
        )
      ],
    );
  }
}