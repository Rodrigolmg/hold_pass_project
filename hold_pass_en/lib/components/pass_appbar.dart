import 'package:flutter/material.dart';
import 'package:hold_pass_en/provider/pass_provider.dart';
import 'package:provider/provider.dart';

class PassAppBar extends StatefulWidget {

  final double width;
  final double height;

  const PassAppBar({
    this.width = .0,
    this.height = .0,
    Key? key
  }) : super(key: key);

  @override
  State<PassAppBar> createState() => _PassAppBarState();
}

class _PassAppBarState extends State<PassAppBar>
    with SingleTickerProviderStateMixin{

  AnimationController? _animationController;
  Animation<Offset>? _animOffset;
  PassProvider? _passProvider;

  @override
  void initState() {
    super.initState();

    _passProvider =
        Provider.of<PassProvider>(context, listen: false);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300)
    );

    final curve = CurvedAnimation(
        parent: _animationController!,
        curve: Curves.decelerate
    );

    _animOffset = Tween<Offset>(
        begin: const Offset(.0, .35),
        end: Offset.zero
    ).animate(curve);

    if(_passProvider!.getPassToEdit != null){
      _animationController!.forward();
    } else {
      _animationController!.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return FadeTransition(
      opacity: _animationController!,
      child: SlideTransition(
        position: _animOffset!,
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30)
              )
          ),
          elevation: 0,
          title: GestureDetector(
            onTap: _passProvider!.resetInfo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Cancel editing'),
                SizedBox(
                  width: width * .05,
                ),
                const Icon(Icons.cancel_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }
}