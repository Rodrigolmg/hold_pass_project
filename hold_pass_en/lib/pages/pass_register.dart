import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_textfield.dart';
import 'package:hold_pass_en/components/pass_type_list.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:provider/provider.dart';

class PassRegister extends StatefulWidget {
  const PassRegister({Key? key}) : super(key: key);

  @override
  State<PassRegister> createState() => _PassRegisterState();
}

class _PassRegisterState extends State<PassRegister> {

  bool _obscureText = true;

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
              child: Consumer<PassProvider>(
                builder: (context, passProvider, _) => PassTextField(
                  label: 'Item Name',
                  suffixWidget: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.question_mark_rounded),
                    splashColor: Colors.transparent,
                  ),
                  validator: (value) {
                    return value == null || value.trim().isEmpty ?
                    'Please enter the item name' : null;
                  },
                  onChange: passProvider.setItemName,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: Consumer<PassProvider>(
                builder: (context, passProvider, _) => PassTextField(
                  label: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    bool isNotValid = passProvider.getPassType
                      == PassType.email && (value == null || value.trim().isEmpty);

                    return isNotValid ? 'Please enter your e-mail!' : null;
                  },
                  onChange: passProvider.setEmail,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: Consumer<PassProvider>(
                builder: (context, passProvider, _) => PassTextField(
                  label: 'Username',
                  suffixWidget: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.question_mark_rounded),
                    splashColor: Colors.transparent,
                  ),
                  onChange: passProvider.setUsername,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: Consumer<PassProvider>(
                builder: (context, passProvider, _) => PassTextField(
                  label: 'Nickname',
                  suffixWidget: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.question_mark_rounded),
                    splashColor: Colors.transparent,
                  ),
                  onChange: passProvider.setNickname,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: Consumer<PassProvider>(
                builder: (context, passProvider, _) => PassTextField(
                  label: 'ID',
                  onChange: passProvider.setNumId,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: Consumer<PassProvider>(
                builder: (context, passProvider, _) => PassTextField(
                  label: 'Pin',
                  onChange: passProvider.setPin,
                ),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: Consumer<PassProvider>(
                builder: (context, passProvider, _) => PassTextField(
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
                  validator: (value) {
                    return value == null || value.trim().isEmpty ?
                    'Please enter your password' : null;
                  },
                  onChange: passProvider.setPassword,
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