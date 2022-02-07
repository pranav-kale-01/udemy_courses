import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String textString;

  const MyText(this.textString, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
