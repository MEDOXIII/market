import 'package:flutter/material.dart';
import 'package:market/Screen/loginScreen.dart';
import 'package:market/Widgets/BoardingWidget.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  bool onLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                        right: 10,
                        top: 10,
                      ),
                      child: NeumorphismButtonWidget(
                        myColor: Colors.white70,
                        onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.racingSansOne(
                            textStyle:
                                TextStyle(fontSize: 16.sp, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 500.h,
                      child: PageView(
                        controller: _pageController,
                        physics: ClampingScrollPhysics(),
                        onPageChanged: (index) {
                          setState(() {
                            onLastPage = (index == 2);
                          });
                        },
                        children: [
                          BoardingWidget(
                            image: Image.asset(
                              'assets/images/online_shopping.png',
                              height: 200.h,
                              width: 300.w,
                            ),
                            textAddress: "Online Shopping",
                            text:
                                "This is the text of the Boarding which is been display on the OnBoarding Screen",
                          ),
                          BoardingWidget(
                            image: Image.asset(
                              'assets/images/order_confirmed.png',
                              height: 200.h,
                              width: 300.w,
                            ),
                            textAddress: "Order Confirmed",
                            text:
                                "This is the text of the Boarding which is been display on the OnBoarding Screen",
                          ),
                          BoardingWidget(
                            image: Image.asset(
                              'assets/images/package_arrived.png',
                              height: 200.h,
                              width: 300.w,
                            ),
                            textAddress: "Package Arrived",
                            text:
                                "This is the text of the Boarding which is been display on the OnBoarding Screen",
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: SlideEffect(
                          activeDotColor: Colors.cyan,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: NeumorphismButtonWidget(
                        myColor: Colors.white70,
                        child: Center(
                          child: Text(
                            onLastPage ? "Get Ready" : "Next",
                            style: GoogleFonts.damion(
                              textStyle: TextStyle(
                                  fontSize: 25.sp, color: Colors.black),
                            ),
                          ),
                        ),
                        onClick: () {
                          onLastPage
                              ? Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ))
                              : _pageController.nextPage(
                                  duration: Duration(milliseconds: 150),
                                  curve: Curves.ease);
                        },
                      ),
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
