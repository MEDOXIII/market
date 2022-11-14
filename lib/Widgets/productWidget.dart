import 'package:flutter/material.dart';
import 'package:market/Screen/detailScreen.dart';
import 'package:market/Widgets/countRowWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 500.h,
        color: Colors.white38,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Hero(
              tag: 'image',
              child: Image.asset(
                'assets/images/market.png',
                height: 100.h,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 48,
            ),
            Text(
              "Product Name",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xff0093d3),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 48,
            ),
            countRowWidget(),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailScreen(),
        ));
      },
    );
  }
}
