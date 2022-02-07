import 'package:flutter/material.dart';
import './text_control.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyApp'),
        ),
        body: const Center(
          child: TextControl(),
        ),
      ),
    );
  }
}
