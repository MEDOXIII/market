import 'package:flutter/material.dart';
import 'package:market/Screen/detailScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailScreen(),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/market.png'),
            ),
            Column(
              children: [
                Text(
                  'Name',
                  style: GoogleFonts.damion(
                    textStyle: TextStyle(fontSize: 20, color: Colors.cyan),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Price',
                  style: GoogleFonts.damion(
                    textStyle: TextStyle(fontSize: 15, color: Colors.cyan),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Discount',
                  style: GoogleFonts.damion(
                    textStyle: TextStyle(fontSize: 10, color: Colors.cyan),
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
