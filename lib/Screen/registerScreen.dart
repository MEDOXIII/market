import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market/Widgets/toastWidget.dart';
import 'package:market/Screen/loginScreen.dart';
import 'package:market/Widgets/suggestionWidget.dart';
import 'package:market/Widgets/textFieldWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/neumorphismButtonWidget.dart';
import '../Widgets/offlineCheckerWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  bool showConfirmPassword = true;
  bool showPassword = true;

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
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      User? user = result.user;
      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'name': nameController.text.trim(),
        'phone': phoneController.text.trim(),
        'email': emailController.text.trim(),
        'address': {
          'Street': '',
          'Building': '',
          'Floor': '',
          'Apartment': '',
        },
        'image': '',
      });
    } on FirebaseAuthException catch (e) {
      ToastWidget(e.message.toString());

      print(e);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return OfflineCheckerWidget(
      body: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
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
                      Image.asset('assets/images/market.png'),
                      TextFieldWidget(
                        lastIcon: IconButton(
                          icon: Icon(null),
                          onPressed: () {},
                        ),
                        controller: nameController,
                        text: 'Name',
                        type: TextInputType.name,
                        isPass: false,
                        icon: Icon(Icons.person),
                        validator: (name) => name != null && name.length < 3
                            ? 'Enter a valid Name'
                            : null,
                      ),
                      TextFieldWidget(
                        lastIcon: IconButton(
                          icon: Icon(null),
                          onPressed: () {},
                        ),
                        controller: phoneController,
                        text: 'Phone Number',
                        type: TextInputType.phone,
                        isPass: false,
                        icon: Icon(Icons.phone),
                        validator: (phone) => phone != null && phone.length < 11
                            ? 'Enter a valid Phone Number'
                            : null,
                      ),
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
                      TextFieldWidget(
                        lastIcon: IconButton(
                          icon: Icon(showConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () => setState(
                              () => showConfirmPassword = !showConfirmPassword),
                        ),
                        controller: confirmPasswordController,
                        text: 'Confirm Password',
                        type: TextInputType.text,
                        isPass: showConfirmPassword,
                        icon: Icon(Icons.lock),
                        validator: (confirmPassword) =>
                            confirmPassword != passwordController.text
                                ? 'Password Is Not Match'
                                : null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 48,
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
                        height: MediaQuery.of(context).size.height / 48,
                      ),
                      SuggestionWidget(
                        text: "Already have an account ? ",
                        clickText: "Log In",
                        onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen(),
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
      ),
    );
  }
}
