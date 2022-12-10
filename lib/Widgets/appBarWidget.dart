import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../Screen/shopCartScreen.dart';
import 'neumorphismButtonWidget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final Widget child;
  const AppBarWidget({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 7,
            top: 3,
            bottom: 2,
          ),
          child: child,
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 7,
            top: 3,
            bottom: 2,
          ),
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
          padding: const EdgeInsets.only(
            top: 3,
            left: 8,
            bottom: 2,
          ),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
