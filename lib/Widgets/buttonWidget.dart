import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  late final String text;

  ButtonWidget(this.text, this.onPressed);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xff2a386c),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.sail(
                textStyle: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
