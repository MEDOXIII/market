import 'package:flutter/material.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/detailScreen.dart';
import 'package:market/Screen/profileScreen.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Screen/productScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [buildHeader(context), buildMenuItem(context)],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProfileScreen(),
          ));
        },
        child: Container(
          color: Color(0xff2a386c),
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 18,
              ),
              Text(
                "My Profile",
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  Widget buildMenuItem(BuildContext context) => Container(
        padding: EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xff2a386c),
              ),
              title: Text(
                "Category",
                style: GoogleFonts.racingSansOne(
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.cyan,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.price_change_outlined,
                color: Color(0xff2a386c),
              ),
              title: Text(
                "Product",
                style: GoogleFonts.racingSansOne(
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.cyan,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.dataset_outlined,
                color: Color(0xff2a386c),
              ),
              title: Text(
                "Detail",
                style: GoogleFonts.racingSansOne(
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.cyan,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailScreen(""),
                ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Color(0xff2a386c),
              ),
              title: Text(
                "ShopCart",
                style: GoogleFonts.racingSansOne(
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.cyan,
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShopCartScreen(),
                ));
              },
            ),
            Divider(
              color: Colors.black45,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Color(0xff2a386c),
              ),
              title: NeumorphismButtonWidget(
                myColor: Colors.white70,
                child: Center(
                  child: Text(
                    "Singe Out",
                    style: GoogleFonts.xanhMono(
                      textStyle: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onClick: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
          ],
        ),
      );
}
