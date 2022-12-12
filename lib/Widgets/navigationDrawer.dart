import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market/Screen/categoryScreen.dart';
import 'package:market/Screen/detailScreen.dart';
import 'package:market/Screen/profileScreen.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:market/Screen/productScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/Widgets/drawerListTileWidget.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';

import '../Screen/boardingScreen.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final user = FirebaseAuth.instance.currentUser!;

  String profileImage = "";

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

  bool isEmpty() {
    if (profileImage.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      if (value.data()!["image"] == null) {
      } else {
        setState(() {
          profileImage = value.data()!["image"];
        });
      }
    });
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
                child: isEmpty()
                    ? Image.asset('assets/images/avatar.png')
                    : ClipOval(
                        child: Image.network(
                        profileImage,
                        width: 150.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      )),
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
            DrawerListTileWidget(
              icon: Icons.home,
              title: "Category",
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryScreen(),
                ));
              },
            ),
            DrawerListTileWidget(
              icon: Icons.price_change_outlined,
              title: "Product",
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductScreen(),
                ));
              },
            ),
            DrawerListTileWidget(
              icon: Icons.dataset_outlined,
              title: "Detail",
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailScreen(""),
                ));
              },
            ),
            DrawerListTileWidget(
                icon: Icons.shopping_cart,
                title: "ShopCart",
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShopCartScreen(),
                  ));
                }),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BoardingScreen()));
                },
              ),
            ),
          ],
        ),
      );
}
