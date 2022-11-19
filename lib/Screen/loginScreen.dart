import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/registerScreen.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import 'package:market/Widgets/textFieldWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future singIn() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    final isValid = formGlobalKey.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.of(context).pop();
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
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/market.png'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      textFormFieldWidget(
                        controller: emailController,
                        text: 'Enter Your Email',
                        isPass: false,
                        icon: Icon(Icons.email),
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid Email'
                                : null,
                      ),
                      textFormFieldWidget(
                        controller: passwordController,
                        text: 'Enter Your Password',
                        isPass: true,
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
                          'Login',
                          style: GoogleFonts.sail(
                            textStyle: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onClick: singIn,
                        myColor: Colors.white70,
                      ),
                      // ButtonWidget(
                      //   'Login',
                      //   singIn,
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 24,
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
            ),
          );
        }
      },
    );
  }
}
