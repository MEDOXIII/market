import 'package:flutter/material.dart';
import 'package:market/Screen/homeScreen.dart';
import 'package:market/Widgets/onBoardingWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  bool onLastPage = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                    },
                    // color: Colors.transparent,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 500,
                  child: PageView(
                    controller: _pageController,
                    physics: ClampingScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        onLastPage = (index == 2);
                      });
                    },
                    children: [
                      OnBoardingWidget(
                        image: Image.asset(
                          'assets/images/delivery.png',
                          height: 200,
                          width: 300,
                        ),
                        textAddress: "delivery",
                        text:
                            "This is the text of the Boarding which is been display on the OnBoarding Screen",
                      ),
                      OnBoardingWidget(
                        image: Image.asset(
                          'assets/images/food.png',
                          height: 200,
                          width: 300,
                        ),
                        textAddress: "food",
                        text:
                            "This is the text of the Boarding which is been display on the OnBoarding Screen",
                      ),
                      OnBoardingWidget(
                        image: Image.asset(
                          'assets/images/liveTracking.png',
                          height: 200,
                          width: 300,
                        ),
                        textAddress: "live Tracking",
                        text:
                            "This is the text of the Boarding which is been display on the OnBoarding Screen",
                      ),
                    ],
                  ),
                ),
                Center(
                    child: SmoothPageIndicator(
                        controller: _pageController, count: 3)),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: MaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Color(0xff2a386c),
                    onPressed: () {
                      onLastPage
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ))
                          : _pageController.nextPage(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.ease);
                    },
                    child: Text(
                      onLastPage ? "Get Ready" : "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
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