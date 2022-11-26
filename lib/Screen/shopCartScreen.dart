import 'package:flutter/material.dart';
import 'package:market/Screen/paymentScreen.dart';
import 'package:market/Widgets/navigationDrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../Widgets/neumorphismButtonWidget.dart';
import '../Widgets/searchWidget.dart';

class ShopCartScreen extends StatelessWidget {
  const ShopCartScreen({Key? key}) : super(key: key);

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
                'ShopCart',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
                  child: SearchWidget(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
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
                    Image.asset('assets/images/empty_cart.png'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    Text(
                      'Your Shop Cart is Empty ',
                      style: GoogleFonts.damion(
                        textStyle:
                            TextStyle(fontSize: 20.sp, color: Colors.cyan),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    SlideAction(
                      text: 'Slid To Pay',
                      sliderButtonIcon: Icon(
                        Icons.monetization_on,
                        color: Colors.cyan,
                      ),
                      innerColor: Colors.white70,
                      outerColor: Colors.cyan,
                      onSubmit: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ));
                      },
                    ),
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
