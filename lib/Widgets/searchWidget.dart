import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'neumorphismButtonWidget.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

bool isOpen = true;
final TextEditingController searchTextController = TextEditingController();

class _SearchWidgetState extends State<SearchWidget> {
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
              width: 240,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: 30,
                        ),
                        color: Colors.lightBlue,
                        onPressed: () {
                          if (searchTextController.text.isEmpty) {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          } else {
                            setState(
                              () {
                                searchTextController.clear();
                              },
                            );
                          }
                        }),
                  ),
                  Container(
                    height: 50,
                    width: 140,
                    child: TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: "Search",
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      color: Colors.lightBlue,
                      onPressed: () {
                        if (searchTextController.text.isEmpty) {
                        } else {
                          Fluttertoast.showToast(
                              msg: searchTextController.text,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.cyan,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
