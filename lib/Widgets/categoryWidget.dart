import 'package:flutter/material.dart';
import 'package:market/Screen/subCategoryScreen.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/market.png',
              height: 130,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Product Name",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0093d3),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
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
