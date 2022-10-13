import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'Detail',
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              height: 300,
              child: Image.asset('assets/images/market.png'),
            ),
          ),
        ),
      ),
    );
  }
}
