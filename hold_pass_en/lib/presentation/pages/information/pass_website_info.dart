import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/domain/entities/password.dart';
import 'package:hold_pass_en/presentation/bloc/password/information/pass_information_bloc.dart';
import 'package:hold_pass_en/presentation/components/pass_card_smry.dart';
import 'package:hold_pass_en/presentation/pages/pass_loading.dart';

class PassWebsiteInfo extends StatefulWidget {
  const PassWebsiteInfo({Key? key}) : super(key: key);

  @override
  State createState() => _PassWebsiteInfoState();
}

class _PassWebsiteInfoState extends State<PassWebsiteInfo> {


  int _delay = 300;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: BlocBuilder<PassInformationBloc, PassInformationState>(
          builder: (context, state) {

            if(state is PasswordListLoading){
              return const PassLoading();
            }

            if(state is EmptyPasswordList){
              return const Center(
                child: Text(
                  'No wesite registered',
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
                          context.read<PassInformationBloc>()
                            .add(const LoadPasswordListEvent(
                              passType: PassType.website
                          ));
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
