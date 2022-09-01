import 'package:flutter/material.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:provider/provider.dart';

class PassTypeList extends StatefulWidget {
  const PassTypeList({Key? key}) : super(key: key);

  @override
  State<PassTypeList> createState() => _PassTypeListState();
}

class _PassTypeListState extends State<PassTypeList> {

  PassType _valueType = PassType.email;


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
          child: Consumer<PassProvider>(
            builder: (context, passProvider, _) => DropdownButton<PassType>(
                underline: Container(
                  height: .8,
                  color: Colors.orangeAccent,
                ),
                value: _valueType,
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
                onChanged: (PassType? type) {
                  setState(() {
                    _valueType = type!;
                  });
                }
            ),
          ),
        )
      ],
    );
  }
}