import 'package:flutter/material.dart';
import 'package:hold_pass_en/components/pass_card_info.dart';
import 'package:hold_pass_en/components/pass_card_smry.dart';
import 'package:hold_pass_en/models/password.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:provider/provider.dart';

class PassEmailInfo extends StatelessWidget {
  const PassEmailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Consumer<PassProvider>(
        builder: (context, passProvider, _) => ListView.builder(
            itemCount: passProvider.getPassEmails.length,
            itemBuilder: (_, i) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                  onTap: (){
                    showDialog<void>(
                        context: context,
                        builder: (context) {
                          return PassCardInfo(passwordModel: passProvider.getPassEmails[i]);
                        }
                    );
                  },
                  child: PassCardSmry(passwordModel: passProvider.getPassEmails[i])
              ),
            )
        ),
      ),
    );
  }
}
