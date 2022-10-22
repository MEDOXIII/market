import 'package:flutter/material.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/navigationDrawer.dart';

import '../Widgets/productWidget.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'SubCategory',
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShopCartScreen(),
                  ));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            ],
          ),
          drawer: NavigationDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ProductWidget(),
                ProductWidget(),
                ProductWidget(),
                ProductWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
