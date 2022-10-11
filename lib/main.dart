import 'package:flutter/material.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/loginScreen.dart';
import 'package:market/Screen/registerScreen.dart';

import 'Screen/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: <String, WidgetBuilder>{
        '/screen1': (BuildContext context) => new LoginScreen(),
        '/screen2': (BuildContext context) => new RegisterScreen(),
        '/screen3': (BuildContext context) => new CategoryScreen(),
      },
    );
  }
}
