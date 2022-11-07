import 'package:flutter/material.dart';
import 'package:market/Widgets/navigationDrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    Image.asset('assets/images/empty_cart.png'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your Shop Cart is Empty ',
                      style: GoogleFonts.damion(
                        textStyle:
                            TextStyle(fontSize: 20.sp, color: Colors.cyan),
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
