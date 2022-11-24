import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import '../Widgets/navigationDrawer.dart';
import '../Widgets/categoryWidget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
                'Category',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: NeumorphismButtonWidget(
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.lightBlue,
                    ),
                    onClick: () {},
                    myColor: Colors.white70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
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
                  padding: const EdgeInsets.all(5.0),
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

            // drawer: NavigationDrawer(),

            body: SingleChildScrollView(
              child: Column(
                children: [
                  CategoryWidget(),
                  CategoryWidget(),
                  CategoryWidget(),
                  CategoryWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
