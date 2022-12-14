import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screen/addressScreen.dart';
import 'neumorphismButtonWidget.dart';

class AddressButtonWidget extends StatelessWidget {
  const AddressButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Address :",
            style: GoogleFonts.xanhMono(
              textStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 12,
          ),
          NeumorphismButtonWidget(
            child: Text(
              "Add Your Address",
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 16.sp,
              ),
            ),
            onClick: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddressScreen()));
            },
            myColor: Colors.white70,
          ),
        ],
      ),
    );
  }
}
