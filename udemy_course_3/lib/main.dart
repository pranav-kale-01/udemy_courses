import 'package:flutter/material.dart';
import 'package:udemy_course_3/screens/my_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.amber, error: Colors.black),
          fontFamily: 'QuickSand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                bodyText1: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 22,
              fontWeight: FontWeight.w100,
            ),
          ),
          buttonTheme: const ButtonThemeData().copyWith(
              colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.purple,
            secondary: Colors.white,
          ))),
      home: const MyHomePage(),
    );
  }
}

