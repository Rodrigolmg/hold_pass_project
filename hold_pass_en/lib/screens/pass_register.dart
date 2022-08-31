import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_textfield.dart';
import 'package:hold_pass_en/components/pass_type_list.dart';

class PassRegister extends StatefulWidget {
  const PassRegister({Key? key}) : super(key: key);

  @override
  State<PassRegister> createState() => _PassRegisterState();
}

class _PassRegisterState extends State<PassRegister> {

  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width * .8;
    final double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Password Register',
              style: TextStyle(
                  fontSize: 25.0
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            SizedBox(
              width: width,
              child: const PassTypeList()
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                label: 'Item Name',
                suffixWidget: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.question_mark_rounded),
                  splashColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                label: 'E-mail',
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                label: 'Username',
                suffixWidget: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.question_mark_rounded),
                  splashColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                label: 'Nickname',
                suffixWidget: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.question_mark_rounded),
                  splashColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                label: 'ID',
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                label: 'Password',
                obscureText: _obscureText,
                suffixWidget: IconButton(
                  onPressed: (){
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  splashColor: Colors.transparent,
                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off)
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}