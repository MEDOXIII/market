import 'package:flutter/material.dart';
import 'package:market/Widgets/countRowWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductWidget extends StatelessWidget {
  final Object heroTag;
  final VoidCallback onClick;

  const ProductWidget({
    required this.heroTag,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 500.h,
        color: Colors.grey.shade100,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Hero(
              tag: heroTag,
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
      onTap: onClick,
    );
  }
}
