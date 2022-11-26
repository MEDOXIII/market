import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
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
    final _drawerController = ZoomDrawerController();

    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      borderRadius: 20.0,
      showShadow: true,
      angle: -10,
      slideWidth: MediaQuery.of(context).size.width * 0.80,
      menuBackgroundColor: Colors.grey,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      drawerShadowsBackgroundColor: Colors.white70,
      menuScreen: NavigationDrawer(),
      mainScreen: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Detail',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: NeumorphismButtonWidget(
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.lightBlue,
                    ),
                    onClick: () {},
                    myColor: Colors.white70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: NeumorphismButtonWidget(
                    child: Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.lightBlue,
                    ),
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShopCartScreen(),
                      ));
                    },
                    myColor: Colors.white70,
                  ),
                ),
              ],
              leading: Builder(
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: NeumorphismButtonWidget(
                    child: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.lightBlue,
                    ),
                    onClick: () {
                      ZoomDrawer.of(context)!.toggle();
                    },
                    myColor: Colors.white70,
                  ),
                ),
              ),
            ),
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
      ),
    );
  }
}
