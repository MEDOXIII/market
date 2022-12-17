import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InternetConnectionScreen extends StatefulWidget {
  const InternetConnectionScreen({Key? key}) : super(key: key);

  @override
  State<InternetConnectionScreen> createState() =>
      _InternetConnectionScreenState();
}

class _InternetConnectionScreenState extends State<InternetConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    Image.asset('assets/images/no_connection.png'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    Text(
                      'There Is No Internet Connection',
                      style: GoogleFonts.damion(
                        textStyle:
                            TextStyle(fontSize: 20.sp, color: Colors.cyan),
                      ),
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
