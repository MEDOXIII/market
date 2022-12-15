import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

ToastWidget(String text) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.cyan,
    textColor: Colors.white,
    fontSize: 16.0);
