import 'package:flutter/material.dart';
import 'package:hold_pass_en/screens/pass_information.dart';
import 'package:hold_pass_en/screens/pass_register.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(
      initialPage: 0
  );

  @override
  Widget build(BuildContext context) {

    bool isKeyboardOpened = MediaQuery.of(context).viewInsets.bottom > 0.0;

    return SafeArea(
        child: Scaffold(
          body: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: _getPages().length,
            onPageChanged: _setIndex,
            itemBuilder: (_, i) => _getPages()[i]
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              child: BottomNavigationBar(
                backgroundColor: Colors.brown,
                currentIndex: _currentIndex,
                selectedItemColor: Colors.orangeAccent,
                unselectedItemColor: Colors.white60,
                onTap: _setNextPage,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.app_registration_outlined,
                      ),
                      label: 'Register'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.info_outline),
                      label: 'Passwords info'
                  )
                ]
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: isKeyboardOpened ? null : FloatingActionButton(
              onPressed: (){},
              backgroundColor: Colors.orangeAccent,
              child: Icon(
                _currentIndex == 0 ? Icons.save : Icons.upload_rounded
              ),
            ),
          ),
        )
    );
  }

  List<Widget> _getPages(){
    return [
      const PassRegister(),
      const PassInformation()
    ];
  }
  _setNextPage(int index){
    setState(() {
      _pageController.animateToPage(
        index, duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate
      );
    });
  }
  _setIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
