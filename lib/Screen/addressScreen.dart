import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
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

    Fluttertoast.showToast(
        msg: " hello",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.cyan,
        textColor: Colors.white,
        fontSize: 16.0);
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
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Location",
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
                            building != null && building.length < 2
                                ? 'Enter a valid Building'
                                : null,
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
                        validator: (floor) => floor != null && floor.length < 2
                            ? 'Enter a valid Floor'
                            : null,
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
                        validator: (apartment) =>
                            apartment != null && apartment.length < 2
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
