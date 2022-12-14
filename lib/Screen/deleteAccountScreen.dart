import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/Widgets/toastWidget.dart';
import 'package:market/Screen/boardingScreen.dart';
import '../Widgets/neumorphismButtonWidget.dart';
import '../Widgets/offlineCheckerWidget.dart';
import '../Widgets/textFieldWidget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = true;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!");
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BoardingScreen()));
    return true;
  }

  Future delete() async {
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

      final user = FirebaseAuth.instance.currentUser!;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();

      final image =
          FirebaseStorage.instance.ref().child('Profiles/${user.uid}');

      image.getDownloadURL().then((response) => {
            image.delete(),
          });

      await FirebaseAuth.instance.currentUser?.delete();
      ToastWidget("Your Account Is Deleted");
    } on FirebaseAuthException catch (e) {
      ToastWidget(e.message.toString());
      print(e);
    }
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BoardingScreen()));
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 24,
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
                        onClick: () {
                          delete();
                        },
                        myColor: Colors.white70,
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
