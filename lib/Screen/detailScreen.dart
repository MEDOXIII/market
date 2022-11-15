import 'package:flutter/material.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/countRowWidget.dart';
import 'package:market/Widgets/navigationDrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';

class DetailScreen extends StatelessWidget {
  final Object tag;

  const DetailScreen(this.tag);
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
                  Hero(
                    tag: tag,
                    child: Image.asset('assets/images/market.png'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Text(
                    'This is the text of the product which is been display on the detail screen , this text should contain  what is this product and what is used for .. ',
                    style: GoogleFonts.acme(
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  Row(
                    children: [
                      Expanded(child: countRowWidget()),
                      SizedBox(
                        width: MediaQuery.of(context).size.height / 12,
                      ),
                      Expanded(
                        child: NeumorphismButtonWidget(
                          myColor: Colors.white70,
                          child: Center(
                            child: Text(
                              "BUY",
                              style: GoogleFonts.xanhMono(
                                textStyle: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onClick: () {
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
