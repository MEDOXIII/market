import 'package:flutter/material.dart';
import 'package:market/Widgets/navigationDrawer.dart';

class ShopCartScreen extends StatelessWidget {
  const ShopCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'ShopCart',
            ),
            centerTitle: true,
          ),
          drawer: NavigationDrawer(),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/empty_cart.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your Shop Cart is Empty ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.cyan,
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
