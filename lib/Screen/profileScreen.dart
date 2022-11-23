import 'package:flutter/material.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Widgets/infoWidget.dart';
import '../Widgets/navigationDrawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0093d3),
            title: const Text(
              'Profile',
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShopCartScreen(),
                  ));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            ],
          ),
          drawer: NavigationDrawer(),
          body: Column(
            children: [
              Container(
                height: 300.h,
                width: 300.w,
                child: CircleAvatar(
                  child: Image.asset('assets/images/avatar.png'),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24,
              ),
              infoWidget(
                labelText: "Name :",
                infoText: user.email != null ? user.email! : "My Name",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24,
              ),
              infoWidget(
                labelText: "Phone Number :",
                infoText: "My Phone Is ",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24,
              ),
              infoWidget(
                labelText: "Email :",
                infoText: "My Email Is ",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 24,
              ),
              infoWidget(
                labelText: "Address :",
                infoText: "My Address Is ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
