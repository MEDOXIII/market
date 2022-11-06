import 'package:flutter/material.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/ButtonWidget.dart';
import 'package:market/Widgets/countRowWidget.dart';
import 'package:market/Widgets/navigationDrawer.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(child: countRowWidget()),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ButtonWidget(
                          'BUY',
                          () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ShopCartScreen(),
                            ));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
