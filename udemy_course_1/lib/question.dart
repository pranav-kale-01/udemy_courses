import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
      ),
      width: double.infinity,
      child: Text(
        questionText,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
