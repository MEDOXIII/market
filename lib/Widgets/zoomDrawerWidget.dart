import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'navigationDrawer.dart';

class ZoomDrawerWidget extends StatelessWidget {
  const ZoomDrawerWidget(
      {Key? key, required this.myController, required this.screen})
      : super(key: key);
  final ZoomDrawerController myController;
  final Widget screen;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: myController,
      style: DrawerStyle.defaultStyle,
      borderRadius: 20.0,
      showShadow: true,
      angle: 0,
      slideWidth: MediaQuery.of(context).size.width * 0.80,
      menuBackgroundColor: Colors.white,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      drawerShadowsBackgroundColor: Colors.white,
      menuScreen: NavigationDrawer(),
      mainScreen: screen,
    );
  }
}
