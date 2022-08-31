import 'package:flutter/material.dart';

class PassInformation extends StatefulWidget {
  const PassInformation({Key? key}) : super(key: key);

  @override
  _PassInformationState createState() => _PassInformationState();
}

class _PassInformationState extends State<PassInformation> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Password information'),
    );
  }
}

