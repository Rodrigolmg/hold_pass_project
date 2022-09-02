import 'package:flutter/material.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:hold_pass_en/pages/information/pass_app_info.dart';
import 'package:hold_pass_en/pages/information/pass_email_info.dart';
import 'package:hold_pass_en/pages/information/pass_game_info.dart';
import 'package:hold_pass_en/pages/information/pass_other_info.dart';
import 'package:hold_pass_en/pages/information/pass_website_info.dart';
import 'package:hold_pass_en/util/pass_type.dart';
import 'package:provider/provider.dart';

class PassInformation extends StatefulWidget {
  const PassInformation({Key? key}) : super(key: key);

  @override
  _PassInformationState createState() => _PassInformationState();
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    PassProvider passProvider =
      Provider.of<PassProvider>(context, listen: false);
    passProvider.reloadPassList(PassType.email);
  }

  _onPageChange(index){
    setState(() {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TabBar(
          unselectedLabelColor: Colors.brown,
          indicatorColor: Colors.orangeAccent,
          onTap: _onPageChange,
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
    );


  }
}

