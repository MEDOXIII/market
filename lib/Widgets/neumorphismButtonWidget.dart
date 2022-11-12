import 'package:flutter/material.dart';

class NeumorphismButtonWidget extends StatelessWidget {
  final Widget child;
  const NeumorphismButtonWidget({required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: child,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade50,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            offset: Offset(5, 5),
            spreadRadius: 1,
            blurRadius: 15,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
      ),
    );
  }
}
