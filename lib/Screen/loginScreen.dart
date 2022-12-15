import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/Widgets/toastWidget.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/forgotPasswordScreen.dart';
import 'package:market/Screen/registerScreen.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import 'package:market/Widgets/suggestionWidget.dart';
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
  bool showPassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future singIn() async {
    final isValid = formGlobalKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      ToastWidget(e.message.toString());

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
          return MaterialApp(
            home: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
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
                          TextFieldWidget(
                            lastIcon: IconButton(
                              icon: Icon(null),
                              onPressed: () {},
                            ),
                            controller: emailController,
                            text: 'Email',
                            type: TextInputType.emailAddress,
                            isPass: false,
                            icon: Icon(Icons.email),
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? 'Enter a valid Email'
                                    : null,
                          ),
                          TextFieldWidget(
                            lastIcon: IconButton(
                              icon: Icon(showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () =>
                                  setState(() => showPassword = !showPassword),
                            ),
                            controller: passwordController,
                            text: 'Password',
                            type: TextInputType.text,
                            isPass: showPassword,
                            icon: Icon(Icons.lock),
                            validator: (password) =>
                                password != null && password.length < 6
                                    ? 'Enter min of 6 characters'
                                    : null,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen(),
                                  ));
                                },
                                child: Text(
                                  "Forgot Password ?",
                                  style: GoogleFonts.damion(
                                    textStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.cyan),
                                  ),
                                ),
                              ),
                            ],
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 24,
                          ),
                          SuggestionWidget(
                            text: "Don't have an account ? ",
                            clickText: "Register Here",
                            onClick: () {
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
              ),
            ),
          );
        }
      },
    );
  }
}
