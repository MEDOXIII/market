import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market/Screen/deleteAccountScreen.dart';
import 'package:market/Screen/shopCartScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/Widgets/zoomDrawerWidget.dart';
import '../Widgets/infoWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/neumorphismButtonWidget.dart';
import '../Widgets/searchWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final TextEditingController searchTextController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController addressController = TextEditingController();

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final formGlobalKey = GlobalKey<FormState>();
  late String name;
  late String phoneNumber;
  late String email;
  late String address;
  late Future data;
  File? imagePicker;

  @override
  void initState() {
    data = getUser();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  bool isEmpty() {
    if (address.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future getUser() async {
    print((user.uid));

    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      print((value.data()));

      if (value.data()!["name"] == null) {
        name = "Add Your Name";
      } else {
        name = value.data()!["name"];
      }
      if (value.data()!["phone"] == null) {
        phoneNumber = "Add Your Phone";
      } else {
        phoneNumber = value.data()!["phone"];
      }
      if (value.data()!["email"] == null) {
        email = "Add Your Email";
      } else {
        email = value.data()!["email"];
      }
      if (value.data()!["address"] == null) {
        address = "";
      } else {
        address = value.data()!["address"];
      }
    });
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? imageTemporary = File(image.path);
      imageTemporary = await cropImage(imageFile: imageTemporary);
      setState(() {
        this.imagePicker = imageTemporary;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future cropImage({required File imageFile}) async {
    try {
      CroppedFile? croppedImage =
          await ImageCropper().cropImage(sourcePath: imageFile.path);
      if (croppedImage == null) return;
      return File(croppedImage.path);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _drawerController = ZoomDrawerController();

    return ZoomDrawerWidget(
      myController: _drawerController,
      screen: MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5),
                  child: SearchWidget(
                    controller: searchTextController,
                  ),
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
            body: FutureBuilder(
                future: getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 150.h,
                              width: 150.w,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ClipOval(
                                    child: imagePicker != null
                                        ? Image.file(
                                            imagePicker!,
                                            width: 150.w,
                                            height: 150.h,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            'assets/images/avatar.png'),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Choose Your Photo"),
                                            content: Text(
                                                "Where Do You Want To Choose Your Photo"),
                                            actions: [
                                              NeumorphismButtonWidget(
                                                child: Text(
                                                  'Gallery',
                                                  style: TextStyle(
                                                      color: Colors.cyan),
                                                ),
                                                onClick: () {
                                                  pickImage(
                                                      ImageSource.gallery);
                                                  Navigator.pop(context);
                                                },
                                                myColor: Colors.white70,
                                              ),
                                              NeumorphismButtonWidget(
                                                child: Text(
                                                  'Camera',
                                                  style: TextStyle(
                                                      color: Colors.cyan),
                                                ),
                                                myColor: Colors.white70,
                                                onClick: () {
                                                  pickImage(ImageSource.camera);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.cyan,
                                        size: 30,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 24,
                            ),
                            infoWidget(
                              labelText: "Name :",
                              infoText: name,
                              onClick: () {
                                nameController.text = name;

                                showDialog(
                                  context: context,
                                  builder: (context) => Form(
                                    key: formGlobalKey,
                                    child: AlertDialog(
                                      title: Text('Edit Name'),
                                      content: TextFormField(
                                        keyboardType: TextInputType.name,
                                        autofocus: true,
                                        controller: nameController,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (name) =>
                                            name != null && name.length < 3
                                                ? 'Enter Your Name'
                                                : null,
                                      ),
                                      actions: [
                                        NeumorphismButtonWidget(
                                          child: Text(
                                            'Done',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                          myColor: Colors.white70,
                                          onClick: () {
                                            final isValid = formGlobalKey
                                                .currentState!
                                                .validate();

                                            if (isValid) {
                                              print(nameController.text);
                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(user.uid)
                                                  .update({
                                                'name':
                                                    nameController.text.trim(),
                                              });
                                              Navigator.pop(context);
                                            }
                                            if (!isValid) {
                                              print("Your Name Is Not Valid");
                                              Fluttertoast.showToast(
                                                  msg: "Your Name Is Not Valid",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.cyan,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                          },
                                        ),
                                        NeumorphismButtonWidget(
                                          child: Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                          myColor: Colors.white70,
                                          onClick: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 24,
                            ),
                            infoWidget(
                              labelText: "Phone Number :",
                              infoText: phoneNumber,
                              onClick: () {
                                phoneController.text = phoneNumber;

                                showDialog(
                                  context: context,
                                  builder: (context) => Form(
                                    key: formGlobalKey,
                                    child: AlertDialog(
                                      title: Text('Edit Phone'),
                                      content: TextFormField(
                                        keyboardType: TextInputType.phone,
                                        autofocus: true,
                                        controller: phoneController,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (phone) =>
                                            phone != null && phone.length < 11
                                                ? 'Enter Your Phone Number'
                                                : null,
                                      ),
                                      actions: [
                                        NeumorphismButtonWidget(
                                          child: Text(
                                            'Done',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                          myColor: Colors.white70,
                                          onClick: () {
                                            final isValid = formGlobalKey
                                                .currentState!
                                                .validate();

                                            if (isValid) {
                                              print(phoneController.text);
                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(user.uid)
                                                  .update({
                                                'phone':
                                                    phoneController.text.trim(),
                                              });
                                              Navigator.pop(context);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Your Phone Number Is Not Valid",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.cyan,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                          },
                                        ),
                                        NeumorphismButtonWidget(
                                          child: Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                          myColor: Colors.white70,
                                          onClick: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 24,
                            ),
                            infoWidget(
                              labelText: "Email :",
                              infoText: email,
                              onClick: () {
                                emailController.text = email;

                                showDialog(
                                  context: context,
                                  builder: (context) => Form(
                                    key: formGlobalKey,
                                    child: AlertDialog(
                                      title: Text('Edit Email'),
                                      content: TextFormField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autofocus: true,
                                        controller: emailController,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (email) => email != null &&
                                                !EmailValidator.validate(email)
                                            ? 'Enter a valid Email'
                                            : null,
                                      ),
                                      actions: [
                                        NeumorphismButtonWidget(
                                          child: Text(
                                            'Done',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                          myColor: Colors.white70,
                                          onClick: () {
                                            final isValid = formGlobalKey
                                                .currentState!
                                                .validate();

                                            if (isValid) {
                                              print(emailController.text);
                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(user.uid)
                                                  .update({
                                                'email':
                                                    emailController.text.trim(),
                                              });
                                              Navigator.pop(context);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Your Email Is Not Valid",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.cyan,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                          },
                                        ),
                                        NeumorphismButtonWidget(
                                          child: Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                          myColor: Colors.white70,
                                          onClick: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 24,
                            ),
                            isEmpty()
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Address :",
                                          style: GoogleFonts.xanhMono(
                                            textStyle: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              12,
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
                                            Fluttertoast.showToast(
                                                msg: "Add Your Address",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.cyan,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          },
                                          myColor: Colors.white70,
                                        ),
                                      ],
                                    ),
                                  )
                                : infoWidget(
                                    labelText: "Address :",
                                    infoText: address,
                                    onClick: () {
                                      addressController.text = address;

                                      showDialog(
                                        context: context,
                                        builder: (context) => Form(
                                          key: formGlobalKey,
                                          child: AlertDialog(
                                            title: Text('Edit Address'),
                                            content: TextFormField(
                                              keyboardType:
                                                  TextInputType.streetAddress,
                                              autofocus: true,
                                              controller: addressController,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (address) =>
                                                  address != null &&
                                                          address.length < 10
                                                      ? 'Enter Your Address'
                                                      : null,
                                            ),
                                            actions: [
                                              NeumorphismButtonWidget(
                                                child: Text(
                                                  'Done',
                                                  style: TextStyle(
                                                      color: Colors.cyan),
                                                ),
                                                onClick: () {
                                                  final isValid = formGlobalKey
                                                      .currentState!
                                                      .validate();
                                                  if (isValid) {
                                                    print(
                                                        addressController.text);
                                                    Navigator.pop(context);
                                                  } else {
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Your Address Is Not Valid",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.cyan,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0);
                                                  }
                                                },
                                                myColor: Colors.white70,
                                              ),
                                              NeumorphismButtonWidget(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.cyan),
                                                ),
                                                myColor: Colors.white70,
                                                onClick: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: NeumorphismButtonWidget(
                                child: Text(
                                  "Delete Your Account",
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onClick: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Delete Account!!!"),
                                      content: Text(
                                          "Do You Want To Delete Your Account??"),
                                      actions: [
                                        NeumorphismButtonWidget(
                                          child: Text(
                                            'Yes',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                          onClick: () async {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DeleteAccountScreen()));
                                            await FirebaseAuth.instance
                                                .signOut();
                                          },
                                          myColor: Colors.white70,
                                        ),
                                        NeumorphismButtonWidget(
                                          child: Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.cyan),
                                          ),
                                          myColor: Colors.white70,
                                          onClick: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                myColor: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
