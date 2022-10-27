import 'package:flutter/material.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/detailScreen.dart';
import 'package:market/Screen/profileScreen.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Screen/subCategoryScreen.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [buildHeader(context), buildMenuItem(context)],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ));
        },
        child: Container(
          color: Color(0xff2a386c),
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "My Name",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
  Widget buildMenuItem(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Category"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.price_change_outlined),
              title: Text("SubCategory"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SubCategoryScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(Icons.dataset_outlined),
              title: Text("Detail"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("ShopCart"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShopCartScreen(),
                ));
              },
            ),
          ],
        ),
      );
}