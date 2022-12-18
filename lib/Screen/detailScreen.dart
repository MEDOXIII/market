import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/countRowWidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import '../Widgets/appBarWidget.dart';
import '../Widgets/offlineCheckerWidget.dart';
import '../Widgets/searchWidget.dart';
import '../Widgets/zoomDrawerWidget.dart';

class DetailScreen extends StatefulWidget {
  final Object tag;

  const DetailScreen(this.tag);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

TextEditingController searchTextController = TextEditingController();

class _DetailScreenState extends State<DetailScreen> {
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _drawerController = ZoomDrawerController();

    return OfflineCheckerWidget(
      body: ZoomDrawerWidget(
        myController: _drawerController,
        screen: MaterialApp(
          home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBarWidget(
                title: const Text(
                  'Detail',
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                child: SearchWidget(
                  controller: searchTextController,
                ),
              ),
              body: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: widget.tag,
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
                                          color: Colors.cyan,
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
        ),
      ),
    );
  }
}
