import 'package:flutter/material.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/loginScreen.dart';
import 'package:market/Widgets/ButtonWidget.dart';
import 'package:market/Widgets/textFieldWidget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

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
                controller: nameController,
                text: 'Enter Your Name',
                type: TextInputType.name,
                isPass: false,
                icon: Icon(Icons.person),
              ),
              textFieldWidget(
                controller: phoneController,
                text: 'Enter Your Phone Number',
                type: TextInputType.number,
                isPass: false,
                icon: Icon(Icons.phone),
              ),
              textFieldWidget(
                controller: emailController,
                text: 'Enter Your Email',
                type: TextInputType.emailAddress,
                isPass: false,
                icon: Icon(Icons.email),
              ),
              textFieldWidget(
                controller: addressController,
                text: 'Enter Your Address',
                type: TextInputType.streetAddress,
                isPass: false,
                icon: Icon(Icons.home),
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
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
