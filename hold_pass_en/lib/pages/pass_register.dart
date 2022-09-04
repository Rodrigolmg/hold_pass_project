import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hold_pass_en/components/pass_about_field_info.dart';
import 'package:hold_pass_en/components/pass_textfield.dart';
import 'package:hold_pass_en/components/pass_type_list.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:hold_pass_en/util/textfield_about.dart';
import 'package:hold_pass_en/util/textfield_validator.dart';
import 'package:provider/provider.dart';

class PassRegister extends StatefulWidget {
  const PassRegister({Key? key}) : super(key: key);

  @override
  State<PassRegister> createState() => _PassRegisterState();
}

class _PassRegisterState extends State<PassRegister> {

  bool _obscureText = true;


  void _showAboutInfo(String about){
    showGeneralDialog(
      context: context,
      pageBuilder: (context, a1, a2) => Container(),
      transitionDuration: const Duration(milliseconds: 250),
      transitionBuilder: (context, a1, a2, child) {
        var curve = Curves.easeInQuad.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: PassAboutFieldInfo(aboutInfo: about),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width * .8;
    final double height = MediaQuery.of(context).size.height;

    PassProvider passProvider = Provider.of<PassProvider>(context, listen: false);

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
                textEditingController: passProvider.getItemNameController,
                label: 'Item Name',
                suffixWidget: IconButton(
                  onPressed: (){
                    _showAboutInfo(itemAbout);
                  },
                  icon: const Icon(Icons.info_outline),
                  splashColor: Colors.transparent,
                ),
                validator: (value) {
                  return validateTextfield(value == null || value.trim().isEmpty,
                      'Please enter the item name');
                },
                onChange: passProvider.setItemName,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: passProvider.getEmailController,
                label: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {

                  bool isNotValid = false;
                  String msg = '';

                  if(passProvider.getPassType
                      == PassType.email && (value == null ||
                      value.trim().isEmpty)){
                    isNotValid = true;
                    msg = 'Please enter your e-mail';
                  } else if ((value != null &&
                      value.trim().isNotEmpty) && !value.contains('@')){
                    msg = 'Please enter a valid e-mail';
                    isNotValid = true;
                  }

                  return validateTextfield(isNotValid, msg);
                },
                onChange: passProvider.setEmail,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: passProvider.getUsernameController,
                label: 'Username',
                suffixWidget: IconButton(
                  onPressed: (){
                    _showAboutInfo(usernameAbout);
                  },
                  icon: const Icon(Icons.info_outline),
                  splashColor: Colors.transparent,
                ),
                onChange: passProvider.setUsername,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: passProvider.getNicknameController,
                label: 'Nickname',
                suffixWidget: IconButton(
                  onPressed: (){
                    _showAboutInfo(nicknameAbout);
                  },
                  icon: const Icon(Icons.info_outline),
                  splashColor: Colors.transparent,
                ),
                validator: (value) {
                  bool isNotValid = passProvider.getPassType == PassType.game
                      && (value == null || value.trim().isEmpty);

                  return validateTextfield(
                      isNotValid,
                      'Please enter your nickname in game'
                  );
                },
                onChange: passProvider.setNickname,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: passProvider.getIdController,
                label: 'ID',
                keyboardType: TextInputType.number,
                onChange: passProvider.setNumId,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: passProvider.getPinController,
                label: 'Pin',
                keyboardType: TextInputType.number,
                onChange: passProvider.setPin,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: passProvider.getPasswordController,
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
            SizedBox(
              height: height * .05,
            ),
          ],
        ),
      ),
    );
  }
}