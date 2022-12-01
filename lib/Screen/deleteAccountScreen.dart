import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/neumorphismButtonWidget.dart';
import '../Widgets/textFieldWidget.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'Delete Account',
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    Text(
                      'Confirm Email & Password To Delete Account',
                      style: GoogleFonts.sail(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    textFormFieldWidget(
                      lastIcon: IconButton(
                        icon: Icon(null),
                        onPressed: () {},
                      ),
                      controller: emailController,
                      text: 'Enter Your Email',
                      type: TextInputType.emailAddress,
                      isPass: false,
                      icon: Icon(Icons.email),
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid Email'
                              : null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24,
                    ),
                    textFormFieldWidget(
                      lastIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () =>
                            setState(() => showPassword = !showPassword),
                      ),
                      controller: passwordController,
                      text: 'Enter Your Password',
                      type: TextInputType.text,
                      isPass: showPassword,
                      icon: Icon(Icons.lock),
                      validator: (password) =>
                          password != null && password.length < 6
                              ? 'Enter min of 6 characters'
                              : null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24,
                    ),
                    NeumorphismButtonWidget(
                      child: Text(
                        'Delete Account',
                        style: GoogleFonts.sail(
                          textStyle: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onClick: () {},
                      myColor: Colors.white70,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
