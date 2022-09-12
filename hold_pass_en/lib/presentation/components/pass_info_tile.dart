import 'package:flutter/material.dart';

class PassInfoTile extends StatelessWidget {

  final String? detail;
  final String? label;
  const PassInfoTile({
    @required this.label,
    @required this.detail,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label!,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(detail ?? '-'),
      ],
    );
  }
}