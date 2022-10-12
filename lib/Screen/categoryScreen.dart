import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'Category',
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Color(0xff2a386c),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
                color: Color(0xff2a386c),
              ),
            ],
          ),
          body: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
              Image.asset('assets/images/market.png'),
            ],
          ),
        ),
      ),
    );
  }
}
