import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/registerScreen.dart';
import 'package:market/Widgets/ButtonWidget.dart';
import 'package:market/Widgets/textFieldWidget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future singIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CategoryScreen();
        } else {
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
                      controller: emailController,
                      text: 'Enter Your Email',
                      type: TextInputType.emailAddress,
                      isPass: false,
                      icon: Icon(Icons.email),
                    ),
                    textFieldWidget(
                      controller: passwordController,
                      text: 'Enter Your Password',
                      type: TextInputType.visiblePassword,
                      isPass: true,
                      icon: Icon(Icons.lock),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                      'Login',
                      singIn,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                          },
                          child: Text(
                            "Register Here",
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
      },
    );
  }
}
