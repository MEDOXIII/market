import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import '../Widgets/navigationDrawer.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0093d3),
        title: const Text(
          'Payment',
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
                          color: Colors.black,
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
    );
  }
}
