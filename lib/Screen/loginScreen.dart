import 'package:flutter/material.dart';
import 'package:market/Widgets/ButtonWidget.dart';
import 'package:market/Widgets/textFieldWidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0093d3),
        title: const Text(
          'Login',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/market.png'),
              SizedBox(
                height: 20,
              ),
              textFieldWidget(
                'Enter Your Email',
              ),
              textFieldWidget(
                'Enter Your Password',
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget('Login', () {
                Navigator.of(context).pushNamed('/screen3');
              })
            ],
          ),
        ),
      ),
    );
  }
}
