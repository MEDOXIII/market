import 'package:flutter/material.dart';
import 'neumorphismButtonWidget.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    Key? key,
    required this.title,
    required this.myWidget,
    required this.doneButton,
  }) : super(key: key);

  final String title;
  final Widget myWidget;
  final VoidCallback doneButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: myWidget,
      actions: [
        NeumorphismButtonWidget(
          child: Text(
            'Done',
            style: TextStyle(color: Colors.cyan),
          ),
          myColor: Colors.white70,
          onClick: doneButton,
        ),
        NeumorphismButtonWidget(
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.cyan),
          ),
          myColor: Colors.white70,
          onClick: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
