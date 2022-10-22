import 'package:flutter/material.dart';
import 'package:market/Screen/detailScreen.dart';

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
                  style: TextStyle(fontSize: 20, color: Colors.cyan),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Price',
                  style: TextStyle(fontSize: 16, color: Colors.cyan),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Discount',
                  style: TextStyle(fontSize: 8, color: Colors.cyan),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
