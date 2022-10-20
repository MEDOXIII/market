import 'package:flutter/material.dart';

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
                  Navigator.of(context).pushNamed('/screen5');
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
              GestureDetector(
                child: Image.asset('assets/images/market.png'),
                onTap: () => Navigator.of(context).pushNamed('/screen6'),
              ),
              GestureDetector(
                child: Image.asset('assets/images/market.png'),
                onTap: () => Navigator.of(context).pushNamed('/screen6'),
              ),
              GestureDetector(
                child: Image.asset('assets/images/market.png'),
                onTap: () => Navigator.of(context).pushNamed('/screen6'),
              ),
              GestureDetector(
                child: Image.asset('assets/images/market.png'),
                onTap: () => Navigator.of(context).pushNamed('/screen6'),
              ),
              GestureDetector(
                child: Image.asset('assets/images/market.png'),
                onTap: () => Navigator.of(context).pushNamed('/screen6'),
              ),
              GestureDetector(
                child: Image.asset('assets/images/market.png'),
                onTap: () => Navigator.of(context).pushNamed('/screen6'),
              ),
              GestureDetector(
                child: Image.asset('assets/images/market.png'),
                onTap: () => Navigator.of(context).pushNamed('/screen6'),
              ),
              GestureDetector(
                child: Image.asset('assets/images/market.png'),
                onTap: () => Navigator.of(context).pushNamed('/screen6'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
