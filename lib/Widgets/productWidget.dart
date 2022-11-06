import 'package:flutter/material.dart';
import 'package:market/Screen/detailScreen.dart';
import 'package:market/Widgets/countRowWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.white38,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              'assets/images/market.png',
              height: 140,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Product Name",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 16,
                    color: Color(0xff0093d3),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: countRowWidget(),
            ),
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
