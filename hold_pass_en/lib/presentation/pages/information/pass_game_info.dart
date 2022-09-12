import 'package:flutter/material.dart';
import 'package:hold_pass_en/presentation/components/pass_card_info.dart';
import 'package:hold_pass_en/presentation/components/pass_card_smry.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/presentation/pages/pass_loading.dart';

class PassGameInfo extends StatefulWidget {
  const PassGameInfo({Key? key}) : super(key: key);

  @override
  _PassGameInfoState createState() => _PassGameInfoState();
}

class _PassGameInfoState extends State<PassGameInfo> {

  Future<List<PasswordModel>?>? _futureList;

  int _delay = 300;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: FutureBuilder(
          future: _futureList,
          builder: (c, snap) {
            if(snap.hasData){
              List<PasswordModel> list = snap.data! as List<PasswordModel>;

              if(list.isEmpty) {
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

              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, i) {
                    _delay = _delay + 100;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: GestureDetector(
                          onTap: () {
                            showDialog<void>(
                                context: context,
                                builder: (context) {
                                  return PassCardInfo(passwordModel: list[i]);
                                }
                            );
                          },
                          child: PassCardSmry(
                            passwordModel: list[i],
                            delay: _delay,
                          )
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
