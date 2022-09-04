import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_card_info.dart';
import 'package:hold_pass_en/components/pass_card_smry.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/pages/pass_loading.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:provider/provider.dart';

class PassEmailInfo extends StatefulWidget {
  const PassEmailInfo({Key? key}) : super(key: key);

  @override
  State<PassEmailInfo> createState() => _PassEmailInfoState();
}

class _PassEmailInfoState extends State<PassEmailInfo>{

  Future<List<Password>?>? _futureList;

  @override
  void initState() {
    super.initState();
    _futureList = Provider.of<PassProvider>(context, listen: false)
        .reloadPassList(PassType.email);
  }

  int _delay = 300;

  @override
  Widget build(BuildContext context) {

    PassProvider passProvider = Provider.of<PassProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: FutureBuilder(
          future: _futureList,
          builder: (c, snap) {

            if(snap.hasData){
              List<Password> list = snap.data! as List<Password>;

              if(list.isEmpty) {
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

              return ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (context, i) => const Divider(),
                  itemBuilder: (_, i) {
                    _delay = _delay + 100;
                    return Dismissible(
                      key: ObjectKey(list[i].id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent
                        ),
                        child: const Icon(Icons.delete_sweep_outlined),
                      ),
                      onDismissed: (direction){
                        passProvider.deletePassword(list[i], list[i].passType!);
                      },
                      child: Padding(
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
