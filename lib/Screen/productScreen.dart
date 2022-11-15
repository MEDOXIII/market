import 'package:flutter/material.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/navigationDrawer.dart';
import 'package:market/Widgets/productWidget.dart';

import 'detailScreen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'Product',
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
          body: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey.shade300,
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              children: [
                ProductWidget(
                  heroTag: 'image',
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        'image',
                      ),
                    ));
                  },
                ),
                ProductWidget(
                  heroTag: 'image1',
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        'image1',
                      ),
                    ));
                  },
                ),
                ProductWidget(
                  heroTag: 'image2',
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        'image2',
                      ),
                    ));
                  },
                ),
                ProductWidget(
                  heroTag: 'image3',
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        'image3',
                      ),
                    ));
                  },
                ),
                ProductWidget(
                  heroTag: 'image4',
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        'image4',
                      ),
                    ));
                  },
                ),
                ProductWidget(
                  heroTag: 'image5',
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        'image5',
                      ),
                    ));
                  },
                ),
                ProductWidget(
                  heroTag: 'image6',
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        'image6',
                      ),
                    ));
                  },
                ),
                ProductWidget(
                  heroTag: 'image7',
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        'image7',
                      ),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
