import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PassTextField extends StatelessWidget {

  Widget? suffixWidget;
  String? label;
  bool obscureText;

  PassTextField({Key? key,
    this.suffixWidget,
    @required this.label,
    this.obscureText = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            label!,
            style: const TextStyle(
              fontSize: 18
            ),
          ),
        ),
        TextField(
          obscureText: obscureText,
          cursorColor: Colors.orangeAccent,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.orangeAccent
                )
            ),
            focusColor: Colors.orangeAccent,
            suffixIcon: suffixWidget,
          ),
        )
      ],
    );
  }
}