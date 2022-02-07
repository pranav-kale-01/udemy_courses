import 'package:flutter/material.dart';
import './my_text.dart';

class TextControl extends StatefulWidget {
  const TextControl({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  int _textIndex = 0;

  var texts = const [
    'this is my first default text',
    'this is my second default text',
    'this is my third default text',
    'this is my fourth default text'
  ];

  void _changeText() {
    setState(() {
      if (_textIndex < 3) {
        _textIndex += 1;
      } else {
        _textIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyText(
          texts[_textIndex],
        ),
        ElevatedButton(
          child: const Text('Click to Change!'),
          onPressed: _changeText,
        ),
      ],
    );
  }
}
