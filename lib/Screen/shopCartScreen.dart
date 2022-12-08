import 'package:flutter/material.dart';
import 'package:market/Screen/paymentScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../Widgets/neumorphismButtonWidget.dart';
import '../Widgets/searchWidget.dart';
import '../Widgets/zoomDrawerWidget.dart';
import 'checkoutScreen.dart';

class ShopCartScreen extends StatefulWidget {
  const ShopCartScreen({Key? key}) : super(key: key);

  @override
  State<ShopCartScreen> createState() => _ShopCartScreenState();
}

final TextEditingController searchTextController = TextEditingController();
final _drawerController = ZoomDrawerController();

class _ShopCartScreenState extends State<ShopCartScreen> {
  bool cardSelected = true;
  bool cashSelected = false;

  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawerWidget(
      myController: _drawerController,
      screen: MaterialApp(
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
                  child: SearchWidget(
                    controller: searchTextController,
                  ),
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
            body: SingleChildScrollView(
              child: Center(
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
                      Wrap(
                        spacing: 16,
                        children: [
                          ChoiceChip(
                            labelPadding: const EdgeInsets.all(6.0),
                            label: Text(
                              'Pay Credit Card',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            backgroundColor: Color(0xff2a386c),
                            selected: cardSelected,
                            selectedColor: Colors.cyan,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onSelected: (value) {
                              setState(() {
                                cardSelected = value;
                                cashSelected = !value;
                              });
                            },
                          ),
                          ChoiceChip(
                            labelPadding: const EdgeInsets.all(6.0),
                            label: Text(
                              ' Pay on Delivery',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            backgroundColor: Color(0xff2a386c),
                            selected: cashSelected,
                            selectedColor: Colors.cyan,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onSelected: (value) {
                              setState(() {
                                cashSelected = value;
                                cardSelected = !value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      SlideAction(
                        text: cardSelected ? 'Slid To Pay' : 'Slid To Checkout',
                        sliderButtonIcon: cardSelected
                            ? Icon(
                                Icons.monetization_on,
                                color: Colors.cyan,
                              )
                            : Icon(
                                Icons.wallet_rounded,
                                color: Colors.cyan,
                              ),
                        innerColor: Colors.white70,
                        outerColor: Colors.cyan,
                        onSubmit: cardSelected
                            ? () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PaymentScreen(),
                                ));
                              }
                            : () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CheckoutScreen(),
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
      ),
    );
  }
}
