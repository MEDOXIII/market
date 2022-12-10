import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'neumorphismButtonWidget.dart';

class SearchWidget extends StatefulWidget {
  SearchWidget({required this.controller, Key? key}) : super(key: key);
  final TextEditingController controller;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

bool isOpen = true;

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void initState() {
    isOpen = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphismButtonWidget(
      onClick: () {
        isOpen
            ? setState(() {
                isOpen = !isOpen;
              })
            : null;
      },
      myColor: Colors.white70,
      child: isOpen
          ? AnimatedContainer(
              duration: Duration(milliseconds: 375),
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.lightBlue,
              ),
            )
          : AnimatedContainer(
              duration: Duration(milliseconds: 375),
              width: 240.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      child: Icon(
                        Icons.clear,
                        size: 30,
                        color: Colors.lightBlue,
                      ),
                      onTap: () {
                        if (widget.controller.text.isEmpty) {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        } else {
                          setState(
                            () {
                              widget.controller.clear();
                            },
                          );
                        }
                      }),
                  SizedBox(
                    width: 140.w,
                    child: TextField(
                      // autofocus: true,
                      controller: widget.controller,
                      style: TextStyle(color: Colors.cyan),
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.cyan),
                        isDense: true,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.lightBlue,
                    ),
                    onTap: () {
                      if (widget.controller.text.isEmpty) {
                      } else {
                        Fluttertoast.showToast(
                            msg: widget.controller.text,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.cyan,
                            textColor: Colors.white,
                            fontSize: 16.sp);
                      }
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
