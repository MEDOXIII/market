import 'package:flutter/material.dart';
import 'package:market/Screen/categoryScreen.dart';
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
              textFieldWidget(
                'Enter Your Name',
                TextInputType.name,
                false,
                Icon(Icons.person),
              ),
              textFieldWidget(
                'Enter Your Phone Number',
                TextInputType.number,
                false,
                Icon(Icons.phone),
              ),
              textFieldWidget(
                'Enter Your Email',
                TextInputType.emailAddress,
                false,
                Icon(Icons.email),
              ),
              textFieldWidget(
                'Enter Your Address',
                TextInputType.streetAddress,
                false,
                Icon(Icons.home),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonWidget(
                'Register',
                () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryScreen(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
