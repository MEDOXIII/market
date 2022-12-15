import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/Screen/profileScreen.dart';
import 'package:market/Widgets/addressWidget.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import '../Widgets/toastWidget.dart';
import '../Widgets/appBarWidget.dart';
import '../Widgets/searchWidget.dart';
import '../Widgets/zoomDrawerWidget.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

final _drawerController = ZoomDrawerController();
final formGlobalKey = GlobalKey<FormState>();
late String street;
late String building;
late String floor;
late String apartment;

final user = FirebaseAuth.instance.currentUser!;

TextEditingController searchTextController = TextEditingController();
TextEditingController streetController = TextEditingController();
TextEditingController buildingController = TextEditingController();
TextEditingController floorController = TextEditingController();
TextEditingController apartmentController = TextEditingController();

class _AddressScreenState extends State<AddressScreen> {
  @override
  void dispose() {
    searchTextController.dispose();
    streetController.dispose();
    buildingController.dispose();
    floorController.dispose();
    apartmentController.dispose();
    super.dispose();
  }

  Future addAddress() async {
    final isValid = formGlobalKey.currentState!.validate();
    if (!isValid) return;

    street = streetController.text.toString();
    building = buildingController.text.toString();
    floor = floorController.text.toString();
    apartment = apartmentController.text.toString();

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
        'address': {
          'Street': street,
          'Building': building,
          'Floor': floor,
          'Apartment': apartment,
        },
      });
    } on FirebaseAuthException catch (e) {
      ToastWidget(e.message.toString());
      print(e);
    }

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawerWidget(
      myController: _drawerController,
      screen: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBarWidget(
              title: const Text(
                'Address',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
              child: SearchWidget(
                controller: searchTextController,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ِArea :",
                              style: GoogleFonts.xanhMono(
                                textStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.black),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 12,
                            ),
                            Text(
                              "",
                              style: GoogleFonts.sail(
                                textStyle: TextStyle(
                                    fontSize: 16.sp, color: Colors.cyan),
                              ),
                            ),
                            NeumorphismButtonWidget(
                              child: Text(
                                "Add Location",
                                style: GoogleFonts.sail(
                                  textStyle: TextStyle(
                                      fontSize: 16.sp, color: Colors.cyan),
                                ),
                              ),
                              onClick: () {},
                              myColor: Colors.white70,
                            )
                          ],
                        ),
                      ),
                      AddressWidget(
                          streetController: streetController,
                          buildingController: buildingController,
                          floorController: floorController,
                          apartmentController: apartmentController),
                      NeumorphismButtonWidget(
                        child: Text(
                          "Add Your Address",
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 16.sp,
                          ),
                        ),
                        onClick: () {
                          addAddress();
                        },
                        myColor: Colors.white70,
                      )
                    ],
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
