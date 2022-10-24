import 'package:flutter/material.dart';
import 'package:market/Screen/subCategoryScreen.dart';
import 'package:market/Widgets/countRowWidget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
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
              style: TextStyle(
                color: Color(0xff0093d3),
                fontSize: 16,
                fontWeight: FontWeight.bold,
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
          builder: (context) => SubCategoryScreen(),
        ));
      },
    );
  }
}
