import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/presentation/bloc/password/password_bloc.dart';
import 'package:hold_pass_en/presentation/components/pass_card_info.dart';
import 'package:hold_pass_en/presentation/components/pass_card_smry.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/presentation/pages/pass_loading.dart';

class PassGameInfo extends StatefulWidget {
  const PassGameInfo({Key? key}) : super(key: key);

  @override
  State createState() => _PassGameInfoState();
}

class _PassGameInfoState extends State<PassGameInfo> {

  Future<List<PasswordModel>?>? _futureList;

  int _delay = 300;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: BlocBuilder<PasswordBloc, PasswordState>(
          builder: (c, state) {

            if(state is PasswordListLoading){
              return const PassLoading();
            }

            if(state is EmptyPasswordList){
              return const Center(
                child: Text(
                  'No game registered',
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
                              .add(
                                FetchPasswordListEvent().call(PassType.game)
                          );
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
