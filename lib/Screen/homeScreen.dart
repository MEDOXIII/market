import 'package:flutter/material.dart';
import 'package:market/Screen/loginScreen.dart';
import 'package:market/Screen/registerScreen.dart';
import '../Widgets/ButtonWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'Market',
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/market.png'),
                SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                  "Login",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonWidget(
                  "Register",
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
