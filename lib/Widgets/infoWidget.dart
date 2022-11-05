import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class infoWidget extends StatelessWidget {
  final String labelText;
  final String infoText;
  const infoWidget({
    required this.labelText,
    required this.infoText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: GoogleFonts.xanhMono(
              textStyle: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            infoText,
            style: GoogleFonts.sail(
              textStyle: TextStyle(fontSize: 20, color: Colors.cyan),
            ),
          ),
        ],
      ),
    );
  }
}
