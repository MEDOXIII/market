import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../Widgets/searchWidget.dart';
import '../Widgets/zoomDrawerWidget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

String cardNumber = "";
String expiryDate = "";
String cardHolderName = "";
String cvvCode = "";
bool isCvvFocused = false;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final TextEditingController searchTextController = TextEditingController();

class _PaymentScreenState extends State<PaymentScreen> {
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _drawerController = ZoomDrawerController();
    return ZoomDrawerWidget(
      myController: _drawerController,
      screen: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Payment',
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
            body: Column(
              children: [
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.blue.shade700,
                  onCreditCardWidgetChange: (CreditCardBrand) {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CreditCardForm(
                          formKey: formKey,
                          onCreditCardModelChange: onCreditCardModelChange,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumberDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                          ),
                          expiryDateDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder Name',
                          ),
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          themeColor: Colors.white,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 12,
                        ),
                        NeumorphismButtonWidget(
                          child: Text(
                            'Validate',
                            style: GoogleFonts.sail(
                              textStyle: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          onClick: () {
                            if (formKey.currentState!.validate()) {
                              print('valid!');
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      "valid!!",
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      "Your card is valid!",
                                      textAlign: TextAlign.center,
                                    ),
                                    actions: <Widget>[
                                      NeumorphismButtonWidget(
                                        child: Text("OK"),
                                        onClick: () {
                                          Navigator.of(context).pop();
                                        },
                                        myColor: Colors.white70,
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              print('invalid!');
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              // 0    return AlertDialog(
                              //       title: Text("invalid!!"),
                              //       content: Text("Your card is invalid!"),
                              //       actions: <Widget>[
                              //         MaterialButton(
                              //           child: Text("OK"),
                              //           onPressed: () {
                              //             Navigator.of(context).pop();
                              //           },
                              //         ),
                              //       ],
                              //     );
                              //   },
                              // );
                            }
                          },
                          myColor: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
