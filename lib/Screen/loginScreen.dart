import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/registerScreen.dart';
import 'package:market/Widgets/ButtonWidget.dart';
import 'package:market/Widgets/textFieldWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
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
                      height: MediaQuery.of(context).size.height / 12,
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
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    ButtonWidget(
                      'Login',
                      singIn,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ? ",
                          style: GoogleFonts.racingSansOne(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                          },
                          child: Text(
                            "Register Here",
                            style: GoogleFonts.damion(
                              textStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.cyan),
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
