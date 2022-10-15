import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'Detail',
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
              color: Color(0xff2a386c),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
                color: Color(0xff2a386c),
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/market.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'This is the text of the product which is been display on the detail screen , this text should contain  what is this product and what is used for .. ',
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
