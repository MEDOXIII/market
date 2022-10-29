import 'package:flutter/material.dart';
import 'package:market/Screen/shopCartScreen.dart';

import '../Widgets/infoWidget.dart';
import '../Widgets/navigationDrawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'Profile',
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
          body: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                child: CircleAvatar(
                  child: Image.asset('assets/images/avatar.png'),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              infoWidget(
                labelText: "Name :",
                infoText: "My Name Is ",
              ),
              SizedBox(
                height: 25,
              ),
              infoWidget(
                labelText: "Phone Number :",
                infoText: "My Phone Is ",
              ),
              SizedBox(
                height: 25,
              ),
              infoWidget(
                labelText: "Email :",
                infoText: "My Email Is ",
              ),
              SizedBox(
                height: 25,
              ),
              infoWidget(
                labelText: "Address :",
                infoText: "My Address Is ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
