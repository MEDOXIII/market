import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class infoWidget extends StatelessWidget {
  final String labelText;
  final String infoText;
  final VoidCallback onClick;
  const infoWidget({
    required this.labelText,
    required this.infoText,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText,
            style: GoogleFonts.xanhMono(
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 12,
          ),
          Text(
            infoText,
            style: GoogleFonts.xanhMono(
              textStyle: TextStyle(fontSize: 16.sp, color: Colors.cyan),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.lightBlue,
            ),
            onPressed: onClick,
          ),
        ],
      ),
    );
  }
}
