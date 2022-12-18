import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:market/Widgets/toastWidget.dart';
import 'package:market/Screen/deleteAccountScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market/Widgets/dialogWidget.dart';
import 'package:market/Widgets/zoomDrawerWidget.dart';
import '../Widgets/addressButtonWidget.dart';
import '../Widgets/addressWidget.dart';
import '../Widgets/appBarWidget.dart';
import '../Widgets/dialogTextFieldWidget.dart';
import '../Widgets/infoWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/neumorphismButtonWidget.dart';
import '../Widgets/offlineCheckerWidget.dart';
import '../Widgets/searchWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

TextEditingController searchTextController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController streetController = TextEditingController();
TextEditingController buildingController = TextEditingController();
TextEditingController floorController = TextEditingController();
TextEditingController apartmentController = TextEditingController();

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final formGlobalKey = GlobalKey<FormState>();
  late String name;
  late String phoneNumber;
  late String email;
  late String address;
  late String street;
  late String building;
  late String floor;
  late String apartment;
  late Future data;
  late String profileImage;
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
    streetController.dispose();
    buildingController.dispose();
    floorController.dispose();
    apartmentController.dispose();
    super.dispose();
  }

  bool isEmpty(String value) {
    if (value.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isValid() {
    final Valid = formGlobalKey.currentState!.validate();

    if (Valid) {
      return true;
    } else {
      return false;
    }
  }

  Future getUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
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
      if (value.data()!["address"]["Street"] == null) {
        street = "";
      } else {
        street = value.data()!["address"]["Street"];
      }
      if (value.data()!["address"]["Building"] == null) {
        building = "";
      } else {
        building = value.data()!["address"]["Building"];
      }
      if (value.data()!["address"]["Floor"] == null) {
        floor = "";
      } else {
        floor = value.data()!["address"]["Floor"];
      }
      if (value.data()!["address"]["Apartment"] == null) {
        apartment = "";
      } else {
        apartment = value.data()!["address"]["Apartment"];
      }
      if (value.data()!["image"] == null) {
        profileImage = "";
      } else {
        profileImage = value.data()!["image"];
      }
    });

    address = apartment + floor + building + street;
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? imageTemporary = File(image.path);
      imageTemporary = await cropImage(imageFile: imageTemporary);
      setState(() {
        this.imagePicker = imageTemporary;
        uploadImage();
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

  Future uploadImage() async {
    final imagePath = 'Profiles/${user.uid}';
    final file = File(imagePicker!.path);
    final firebaseStorageReference =
        FirebaseStorage.instance.ref().child(imagePath);
    final uploadTask = firebaseStorageReference.putFile(file);
    final snapShot = await uploadTask.whenComplete(() {});
    final imageURL = await snapShot.ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'image': imageURL,
    });
  }

  @override
  Widget build(BuildContext context) {
    final _drawerController = ZoomDrawerController();

    return OfflineCheckerWidget(
      body: ZoomDrawerWidget(
        myController: _drawerController,
        screen: MaterialApp(
          home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBarWidget(
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                child: SearchWidget(
                  controller: searchTextController,
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
                                          : isEmpty(profileImage)
                                              ? Image.asset(
                                                  'assets/images/avatar.png')
                                              : Image.network(
                                                  profileImage,
                                                  width: 150.w,
                                                  height: 150.h,
                                                  fit: BoxFit.cover,
                                                ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Choose Your Photo",
                                                    style: TextStyle(
                                                        color: Colors.cyan),
                                                  ),
                                                  NeumorphismButtonWidget(
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Colors.cyan,
                                                    ),
                                                    onClick: () =>
                                                        Navigator.pop(context),
                                                    myColor: Colors.white70,
                                                  ),
                                                ],
                                              ),
                                              content: Text(
                                                "Where Do You Want To Choose Your Photo?",
                                                style: TextStyle(
                                                    color: Colors.cyan),
                                              ),
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
                                                    pickImage(
                                                        ImageSource.camera);
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
                                      child: DialogWidget(
                                        title: 'Edit Name',
                                        myWidget: DialogTextFieldWidget(
                                          text: 'Name',
                                          controller: nameController,
                                          validator: (name) =>
                                              name != null && name.length < 3
                                                  ? 'Enter Your Name'
                                                  : null,
                                        ),
                                        doneButton: () {
                                          isValid()
                                              ? {
                                                  print(nameController.text),
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(user.uid)
                                                      .update({
                                                    'name': nameController.text
                                                        .trim(),
                                                  }),
                                                  setState(() {
                                                    name = nameController.text
                                                        .trim();
                                                  }),
                                                  Navigator.pop(context),
                                                }
                                              : {
                                                  ToastWidget(
                                                      "Your Name Is Not Valid"),
                                                };
                                        },
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
                                      child: DialogWidget(
                                          title: 'Edit Phone',
                                          myWidget: DialogTextFieldWidget(
                                            text: 'Phone',
                                            controller: phoneController,
                                            validator: (phone) =>
                                                phone != null &&
                                                        phone.length < 11
                                                    ? 'Enter Your Phone Number'
                                                    : null,
                                          ),
                                          doneButton: () {
                                            isValid()
                                                ? {
                                                    print(phoneController.text),
                                                    FirebaseFirestore.instance
                                                        .collection('users')
                                                        .doc(user.uid)
                                                        .update({
                                                      'phone': phoneController
                                                          .text
                                                          .trim(),
                                                    }),
                                                    setState(() {
                                                      phoneNumber =
                                                          phoneController.text
                                                              .trim();
                                                    }),
                                                    Navigator.pop(context),
                                                  }
                                                : {
                                                    ToastWidget(
                                                        "Your Phone Number Is Not Valid"),
                                                  };
                                          }),
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
                                      child: DialogWidget(
                                        title: 'Edit Email',
                                        myWidget: DialogTextFieldWidget(
                                          text: 'Email',
                                          controller: emailController,
                                          validator: (email) => email != null &&
                                                  !EmailValidator.validate(
                                                      email)
                                              ? 'Enter a valid Email'
                                              : null,
                                        ),
                                        doneButton: () {
                                          isValid()
                                              ? {
                                                  print(emailController.text),
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(user.uid)
                                                      .update({
                                                    'email': emailController
                                                        .text
                                                        .trim(),
                                                  }),
                                                  setState(() {
                                                    email = emailController.text
                                                        .trim();
                                                  }),
                                                  Navigator.pop(context),
                                                }
                                              : {
                                                  ToastWidget(
                                                      "Your Email Is Not Valid"),
                                                };
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 24,
                              ),
                              isEmpty(address)
                                  ? AddressButtonWidget()
                                  : infoWidget(
                                      labelText: "Address :",
                                      infoText: apartment +
                                          '/' +
                                          floor +
                                          '/' +
                                          building +
                                          '/' +
                                          street,
                                      onClick: () {
                                        streetController.text = street;
                                        buildingController.text = building;
                                        floorController.text = floor;
                                        apartmentController.text = apartment;

                                        showDialog(
                                          context: context,
                                          builder: (context) => DialogWidget(
                                            title: 'Edit Address',
                                            myWidget: Form(
                                              key: formGlobalKey,
                                              child: SingleChildScrollView(
                                                child: AddressWidget(
                                                  streetController:
                                                      streetController,
                                                  buildingController:
                                                      buildingController,
                                                  floorController:
                                                      floorController,
                                                  apartmentController:
                                                      apartmentController,
                                                ),
                                              ),
                                            ),
                                            doneButton: () {
                                              isValid()
                                                  ? {
                                                      FirebaseFirestore.instance
                                                          .collection('users')
                                                          .doc(user.uid)
                                                          .update({
                                                        'address': {
                                                          'Street':
                                                              streetController
                                                                  .text
                                                                  .trim(),
                                                          'Building':
                                                              buildingController
                                                                  .text
                                                                  .trim(),
                                                          'Floor':
                                                              floorController
                                                                  .text
                                                                  .trim(),
                                                          'Apartment':
                                                              apartmentController
                                                                  .text
                                                                  .trim(),
                                                        },
                                                      }),
                                                      setState(() {
                                                        street =
                                                            streetController
                                                                .text
                                                                .trim();
                                                        building =
                                                            buildingController
                                                                .text
                                                                .trim();
                                                        floor = floorController
                                                            .text
                                                            .trim();
                                                        apartment =
                                                            apartmentController
                                                                .text
                                                                .trim();
                                                      }),
                                                      Navigator.pop(context),
                                                    }
                                                  : {
                                                      ToastWidget(
                                                          "Your Address Is Not Valid"),
                                                    };
                                            },
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
                                      builder: (context) => DialogWidget(
                                        title: ("Delete Account!!!"),
                                        myWidget: Text(
                                          "Do You Want To Delete Your Account??",
                                          style: TextStyle(color: Colors.cyan),
                                        ),
                                        doneButton: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeleteAccountScreen()));
                                          await FirebaseAuth.instance.signOut();
                                        },
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
      ),
    );
  }
}
