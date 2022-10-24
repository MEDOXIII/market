import 'package:flutter/material.dart';

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
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: () {
              if (sum > 1) {
                setState(() {
                  sum--;
                });
              }
            },
            icon: Icon(
              Icons.remove,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          "$sum",
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 20,
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                sum++;
              });
            },
            icon: Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
