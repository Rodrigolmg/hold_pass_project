import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PassAboutFieldInfo extends StatelessWidget {

  String? aboutInfo;

  PassAboutFieldInfo({
    @required this.aboutInfo,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      elevation: 3,
      content: Center(
        child: Text(aboutInfo!),
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
        )
      ],
    );
  }
}