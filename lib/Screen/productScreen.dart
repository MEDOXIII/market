import 'package:flutter/material.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/navigationDrawer.dart';
import 'package:market/Widgets/productWidget.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../Widgets/neumorphismButtonWidget.dart';
import '../Widgets/searchWidget.dart';
import 'detailScreen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

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
                'Product',
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
            body: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey.shade300,
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.75,
                ),
                children: [
                  ProductWidget(
                    heroTag: 'image',
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          'image',
                        ),
                      ));
                    },
                  ),
                  ProductWidget(
                    heroTag: 'image1',
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          'image1',
                        ),
                      ));
                    },
                  ),
                  ProductWidget(
                    heroTag: 'image2',
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          'image2',
                        ),
                      ));
                    },
                  ),
                  ProductWidget(
                    heroTag: 'image3',
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          'image3',
                        ),
                      ));
                    },
                  ),
                  ProductWidget(
                    heroTag: 'image4',
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          'image4',
                        ),
                      ));
                    },
                  ),
                  ProductWidget(
                    heroTag: 'image5',
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          'image5',
                        ),
                      ));
                    },
                  ),
                  ProductWidget(
                    heroTag: 'image6',
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          'image6',
                        ),
                      ));
                    },
                  ),
                  ProductWidget(
                    heroTag: 'image7',
                    onClick: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          'image7',
                        ),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
