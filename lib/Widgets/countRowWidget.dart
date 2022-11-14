import 'package:flutter/material.dart';
import 'package:market/Widgets/neumorphismButtonWidget.dart';

class countRowWidget extends StatefulWidget {
  const countRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<countRowWidget> createState() => _countRowWidgetState();
}

class _countRowWidgetState extends State<countRowWidget> {
  int sum = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NeumorphismButtonWidget(
          child: Center(
            child: Icon(
              Icons.remove,
              size: 20,
              color: Colors.black,
            ),
          ),
          onClick: () {
            if (sum > 1) {
              setState(() {
                sum--;
              });
            }
          },
          myColor: Colors.white70,
        ),
        Text(
          "$sum",
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 20,
          ),
        ),
        NeumorphismButtonWidget(
          child: Center(
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.black,
            ),
          ),
          onClick: () {
            setState(() {
              sum++;
            });
          },
          myColor: Colors.white70,
        ),
      ],
    );
  }
}
