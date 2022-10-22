import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hold_pass_en/presentation/bloc/password/register/pass_register_bloc.dart';
import 'package:hold_pass_en/presentation/components/pass_about_field_info.dart';
import 'package:hold_pass_en/presentation/components/pass_textfield.dart';
import 'package:hold_pass_en/presentation/components/pass_type_list.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/core/util/textfield_about.dart';
import 'package:hold_pass_en/core/util/textfield_validator.dart';

class PassRegister extends StatefulWidget {
  const PassRegister({Key? key}) : super(key: key);

  @override
  State<PassRegister> createState() => _PassRegisterState();
}

class _PassRegisterState extends State<PassRegister> {

  bool _revealText = true;

  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _emailController = GetIt.I<TextEditingController>();
  final TextEditingController _usernameController = GetIt.I<TextEditingController>();
  final TextEditingController _nicknameController = GetIt.I<TextEditingController>();
  final TextEditingController _idController = GetIt.I<TextEditingController>();
  final TextEditingController _pinController = GetIt.I<TextEditingController>();
  final TextEditingController _passwordController = GetIt.I<TextEditingController>();

  PassType? _passTypeToValidator;

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
              child: PassTypeList()
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
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
                onChange: (value){
                  context.read<PassRegisterBloc>()
                      .add(FillItemNameEvent(itemName: value));
                },
                textEditingController: _itemNameController,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: _emailController,
                label: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {

                  bool isNotValid = false;
                  String msg = '';

                  if(_passTypeToValidator
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
                onChange: (value){
                  context.read<PassRegisterBloc>()
                      .add(FillEmailEvent(email: value));
                },
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: _usernameController,
                label: 'Username',
                suffixWidget: IconButton(
                  onPressed: (){
                    _showAboutInfo(usernameAbout);
                  },
                  icon: const Icon(Icons.info_outline),
                  splashColor: Colors.transparent,
                ),
                onChange: (value){
                  context.read<PassRegisterBloc>()
                      .add(FillUsernameEvent(username: value));
                },
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: _nicknameController,
                label: 'Nickname',
                suffixWidget: IconButton(
                  onPressed: (){
                    _showAboutInfo(nicknameAbout);
                  },
                  icon: const Icon(Icons.info_outline),
                  splashColor: Colors.transparent,
                ),
                validator: (value) {
                  bool isNotValid = _passTypeToValidator == PassType.game
                      && (value == null || value.trim().isEmpty);

                  return validateTextfield(
                      isNotValid,
                      'Please enter your nickname in game'
                  );
                },
                onChange: (value){
                  context.read<PassRegisterBloc>()
                      .add(FillNicknameEvent(nickname: value));
                },
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                textEditingController: _idController,
                label: 'ID',
                keyboardType: TextInputType.number,
                onChange: (value){
                  context.read<PassRegisterBloc>()
                      .add(FillNumIdEvent(numId: value));
                },
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: PassTextField(
                  textEditingController: _pinController,
                  label: 'Pin',
                  keyboardType: TextInputType.number,
                  onChange: (value){
                    context.read<PassRegisterBloc>()
                        .add(FillPinEvent(pin: value));
                  }
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              width: width,
              child: BlocBuilder<PassRegisterBloc, PassRegisterState>(
                builder: (context, state){

                  if(state is PasswordTextRevealed){
                    _revealText = state.revealText!;
                  }

                  return PassTextField(
                    textEditingController: _passwordController,
                    label: 'Password',
                    obscureText: _revealText,
                    suffixWidget: IconButton(
                        onPressed: (){
                          context.read<PassRegisterBloc>()
                              .add(RevealPasswordTextEvent(
                                revealText: !_revealText)
                          );
                        },
                        splashColor: Colors.transparent,
                        icon: Icon(_revealText ? Icons.visibility
                            : Icons.visibility_off
                        )
                    ),
                    validator: (value) {
                      return value == null || value.trim().isEmpty ?
                      'Please enter your password' : null;
                    },
                    onChange: (value){
                      context.read<PassRegisterBloc>()
                          .add(FillPasswordEvent(password: value));
                    },
                  );
                },
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