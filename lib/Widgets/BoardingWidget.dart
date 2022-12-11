import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardingWidget extends StatelessWidget {
  final Image image;
  final String textAddress;
  final String text;
  const BoardingWidget({
    Key? key,
    required this.image,
    required this.textAddress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: image),
          SizedBox(
            height: MediaQuery.of(context).size.height / 24,
          ),
          Text(
            textAddress,
            style: GoogleFonts.aclonica(
              textStyle: TextStyle(
                fontSize: 20.sp,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 24,
          ),
          Text(
            text,
            style: GoogleFonts.acme(
              textStyle: TextStyle(
                fontSize: 10.sp,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
