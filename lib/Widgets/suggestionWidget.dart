import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget(
      {Key? key,
      required this.text,
      required this.clickText,
      required this.onClick})
      : super(key: key);

  final String text;
  final String clickText;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.racingSansOne(
            textStyle: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ),
        GestureDetector(
          onTap: onClick,
          child: Text(
            clickText,
            style: GoogleFonts.damion(
              textStyle: TextStyle(fontSize: 16.sp, color: Colors.cyan),
            ),
          ),
        ),
      ],
    );
  }
}
