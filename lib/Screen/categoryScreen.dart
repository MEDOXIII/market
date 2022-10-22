import 'package:flutter/material.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/categoryWidget.dart';

import '../Widgets/navigationDrawer.dart';

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
          body: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
              CategoryWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
