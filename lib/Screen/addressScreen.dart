import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/Screen/profileScreen.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';
import 'package:market/Widgets/textFieldWidget.dart';
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
      Fluttertoast.showToast(
          msg: e.message.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          fontSize: 16.0);
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
                      TextFieldWidget(
                        text: 'Street',
                        isPass: false,
                        icon: Icon(null),
                        controller: streetController,
                        validator: (street) =>
                            street != null && street.length < 6
                                ? 'Enter a valid Street'
                                : null,
                        type: TextInputType.streetAddress,
                        lastIcon: IconButton(
                          icon: Icon(null),
                          onPressed: () {},
                        ),
                      ),
                      TextFieldWidget(
                        text: 'Building',
                        isPass: false,
                        icon: Icon(null),
                        controller: buildingController,
                        validator: (building) =>
                            building == null ? 'Enter a valid Building' : null,
                        type: TextInputType.text,
                        lastIcon: IconButton(
                          icon: Icon(null),
                          onPressed: () {},
                        ),
                      ),
                      TextFieldWidget(
                        text: 'Floor',
                        isPass: false,
                        icon: Icon(null),
                        controller: floorController,
                        validator: (floor) =>
                            floor == null ? 'Enter a valid Floor' : null,
                        type: TextInputType.text,
                        lastIcon: IconButton(
                          icon: Icon(null),
                          onPressed: () {},
                        ),
                      ),
                      TextFieldWidget(
                        text: 'Apartment',
                        isPass: false,
                        icon: Icon(null),
                        controller: apartmentController,
                        validator: (apartment) => apartment == null
                            ? 'Enter a valid Apartment'
                            : null,
                        type: TextInputType.text,
                        lastIcon: IconButton(
                          icon: Icon(null),
                          onPressed: () {},
                        ),
                      ),
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
