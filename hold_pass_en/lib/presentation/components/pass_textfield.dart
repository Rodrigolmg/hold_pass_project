import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// ignore: must_be_immutable
class PassTextField extends StatelessWidget {

  Widget? suffixWidget;
  String? label;
  bool obscureText;
  TextInputType keyboardType;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  TextEditingController? textEditingController;
  Function(String)? onChange;

  PassTextField({Key? key,
    this.suffixWidget,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.inputFormatters,
    required this.textEditingController,
    required this.onChange
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
        TextFormField(
          controller: textEditingController,
          onChanged: onChange,
          keyboardType: keyboardType,
          validator: validator ?? (val) => null,
          obscureText: obscureText,
          cursorColor: Colors.orangeAccent,
          inputFormatters: inputFormatters,
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