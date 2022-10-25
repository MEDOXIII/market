import 'package:flutter/material.dart';
import 'package:market/Screen/homeScreen.dart';
import 'package:market/Widgets/onBoardingWidget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int numberPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numberPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: isActive ? 24 : 16,
      decoration: BoxDecoration(
          color: isActive ? Colors.blueAccent : Colors.lightBlue,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
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
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
