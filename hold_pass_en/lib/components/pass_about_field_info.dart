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
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 270.0,
      ),
      alignment: Alignment.center,
      elevation: 8,
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