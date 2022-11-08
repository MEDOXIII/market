import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/Screen/productScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductScreen(),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 200.h,
              width: 200.w,
              child: Image.asset('assets/images/market.png'),
            ),
            Column(
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.damion(
                    textStyle: TextStyle(fontSize: 20.sp, color: Colors.cyan),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
                Text(
                  'Price',
                  style: GoogleFonts.damion(
                    textStyle: TextStyle(fontSize: 15.sp, color: Colors.cyan),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
                Text(
                  'Discount',
                  style: GoogleFonts.damion(
                    textStyle: TextStyle(fontSize: 10.sp, color: Colors.cyan),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
