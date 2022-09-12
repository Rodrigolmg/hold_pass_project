import 'package:flutter/material.dart';
import 'package:hold_pass_en/presentation/components/pass_card_smry.dart';
import 'package:hold_pass_en/data/models/password_model.dart';
import 'package:hold_pass_en/presentation/pages/pass_loading.dart';
import 'package:hold_pass_en/presentation/provider/pass_provider.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<PassProvider>(
        builder: (context, passProvider, child) => FutureBuilder(
           future: Future<List<PasswordModel>>.value(passProvider.getEmails),
           builder: (context, snap){
             if(snap.hasData){

               List<PasswordModel> list = snap.data as List<PasswordModel>;

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
                     return Padding(
                       padding: const EdgeInsets.only(bottom: 8.0),
                       child: PassCardSmry(
                         reloadListCallback: (){
                           passProvider.reloadEmailList();
                         },
                         passwordModel: list[i],
                         delay: _delay,
                       ),
                     );
                   }
               );
             }

             return const PassLoading();
           }
         )
      ),
    );
  }


}
