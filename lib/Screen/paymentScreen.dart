import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import 'package:flutter_zoom_drawer/config.dart';
import '../Widgets/toastWidget.dart';
import '../Widgets/appBarWidget.dart';
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
TextEditingController searchTextController = TextEditingController();

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
            backgroundColor: Colors.white,
            appBar: AppBarWidget(
              title: const Text(
                'Payment',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
              child: SearchWidget(
                controller: searchTextController,
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
                  cardBgColor: Colors.grey,
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
                              ToastWidget("Your card is invalid!");
                              print('invalid!');
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
