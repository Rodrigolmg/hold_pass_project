import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hold_pass_en/core/util/pass_type.dart';
import 'package:hold_pass_en/presentation/bloc/password/password_bloc.dart';
import 'package:hold_pass_en/presentation/pages/information/pass_app_info.dart';
import 'package:hold_pass_en/presentation/pages/information/pass_email_info.dart';
import 'package:hold_pass_en/presentation/pages/information/pass_game_info.dart';
import 'package:hold_pass_en/presentation/pages/information/pass_other_info.dart';
import 'package:hold_pass_en/presentation/pages/information/pass_website_info.dart';

class PassInformation extends StatefulWidget {
  const PassInformation({Key? key}) : super(key: key);

  @override
  State createState() => _PassInformationState();
}

class _PassInformationState extends State<PassInformation> {

  final PageController _pageController = PageController(initialPage: 0);


  List<Widget> _getPages() => [
    const PassEmailInfo(),
    const PassWebsiteInfo(),
    const PassAppInfo(),
    const PassGameInfo(),
    const PassOtherInfo(),
  ];

  _onPageChange(index){
    setState(() {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate
      );
    });
  }

  PassType _getPassType(int index) {
    switch(index){
      case 1: return PassType.email;
      case 2: return PassType.website;
      case 3: return PassType.app;
      case 4: return PassType.game;
      case 5: return PassType.other;
      default: return PassType.email;
    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<PasswordBloc, PasswordState>(
      listener: (context, state){
        if(state is PasswordListLoading){
          if(state.passList != null){
            if(state.passList!.isEmpty){
              context.read<PasswordBloc>().add(EmptyPasswordListEvent());
            } else {
              context.read<PasswordBloc>().add(
                PasswordListLoadedEvent(passwords: state.passList!)
              );
            }
          }
        }
      },
      child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: TabBar(
              unselectedLabelColor: Colors.brown,
              indicatorColor: Colors.orangeAccent,
              onTap: (index) {
                context.read<PasswordBloc>()
                    .add(LoadPasswordListEvent(passType: _getPassType(index + 1)));
                _onPageChange(index);
              },
              tabs: const [
                Tab(
                  icon: Icon(
                    Icons.alternate_email,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.http,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.phone_android,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.videogame_asset,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.question_mark,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            body: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _getPages().length,
              itemBuilder: (_, i) => _getPages()[i],
            ),
          )
      ),
    );


  }
}

