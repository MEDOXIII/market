import 'package:flutter/material.dart';
import 'package:market/Widgets/ButtonWidget.dart';
import 'package:market/Widgets/textFieldWidget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0093d3),
        title: const Text(
          'Register',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 300,
                child: Image.asset('assets/images/market.png'),
              ),
              SizedBox(
                height: 20,
              ),
              textFieldWidget('Enter Your Name'),
              textFieldWidget('Enter Your Phone Number'),
              textFieldWidget('Enter Your Email'),
              SizedBox(
                height: 20,
              ),
              ButtonWidget('Register', () {
                Navigator.of(context).pushNamed('/screen3');
              })
            ],
          ),
        ),
      ),
    );
  }
}
