import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/presentation/bloc/password/password_bloc.dart';
import 'package:hold_pass_en/presentation/components/pass_card_smry.dart';
import 'package:hold_pass_en/presentation/pages/pass_loading.dart';

class PassEmailInfo extends StatefulWidget {
  const PassEmailInfo({Key? key}) : super(key: key);

  @override
  State<PassEmailInfo> createState() => _PassEmailInfoState();
}

class _PassEmailInfoState extends State<PassEmailInfo>{

  int _delay = 300;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: BlocBuilder<PasswordBloc, PasswordState>(
        builder: (context, state) {

          if(state is PasswordListLoading){
            return const PassLoading();
          }

          if(state is EmptyPasswordList){
            return const Center(
              child: Text(
                'No e-mail registered',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            );
          }

          if(state is PasswordListLoaded){

            List<Password>? list = state.passwords;

            return ListView.separated(
                itemCount: list!.length,
                separatorBuilder: (context, i) => const Divider(),
                itemBuilder: (_, i) {
                  _delay = _delay + 100;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PassCardSmry(
                      reloadListCallback: (){
                        context.read<PasswordBloc>()
                            .add(FetchPasswordListEvent().call(PassType.email));
                      },
                      password: list[i],
                      delay: _delay,
                    ),
                  );
                }
            );
          }

          return const PassLoading();
        }
      ),
    );
  }


}
