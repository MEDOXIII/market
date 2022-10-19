import 'package:flutter/material.dart';

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
                onPressed: () {
                  Navigator.of(context).pushNamed('/screen5');
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
                color: Color(0xff2a386c),
              ),
            ],
          ),
          drawer: NavigationDrawer(),
          body: Center(
            child: Container(
              child: Image.asset('assets/images/market.png'),
            ),
          ),
        ),
      ),
    );
  }
}
