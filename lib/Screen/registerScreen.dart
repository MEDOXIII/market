import 'package:flutter/material.dart';
import 'package:market/Screen/loginScreen.dart';
import 'package:market/Widgets/textFieldWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/neumorphismButtonWidget.dart';
import 'categoryScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    final isValid = formGlobalKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          fontSize: 16.0);
      print(e);
    }
    Navigator.of(context).pop();
  }

  Future addUser() async {}

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
                  'Register',
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
                        Container(
                          height: 300.h,
                          child: Image.asset('assets/images/market.png'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        textFormFieldWidget(
                          controller: nameController,
                          text: 'Enter Your Name',
                          type: TextInputType.name,
                          isPass: false,
                          icon: Icon(Icons.person),
                          validator: (name) => name != null && name.length < 4
                              ? 'Enter Your Name'
                              : null,
                        ),
                        textFormFieldWidget(
                          controller: phoneController,
                          text: 'Enter Your Phone Number',
                          type: TextInputType.phone,
                          isPass: false,
                          icon: Icon(Icons.phone),
                          validator: (phone) =>
                              phone != null && phone.length < 11
                                  ? 'Enter Your Phone Number'
                                  : null,
                        ),
                        textFormFieldWidget(
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
                        textFormFieldWidget(
                          controller: passwordController,
                          text: 'Enter Your Password',
                          type: TextInputType.text,
                          isPass: true,
                          icon: Icon(Icons.lock),
                          validator: (password) =>
                              password != null && password.length < 6
                                  ? 'Enter min of 6 characters'
                                  : null,
                        ),
                        textFormFieldWidget(
                          controller: confirmPasswordController,
                          text: 'Confirm Your Password',
                          type: TextInputType.text,
                          isPass: true,
                          icon: Icon(Icons.lock),
                          validator: (confirmPassword) =>
                              confirmPassword != passwordController.text
                                  ? 'Password Is Not Match'
                                  : null,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        NeumorphismButtonWidget(
                          child: Text(
                            'Register',
                            style: GoogleFonts.sail(
                              textStyle: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onClick: signUp,
                          myColor: Colors.white70,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ? ",
                              style: GoogleFonts.racingSansOne(
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                              },
                              child: Text(
                                "Log In",
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
        });
  }
}
