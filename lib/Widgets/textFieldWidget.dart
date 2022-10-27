import 'package:flutter/material.dart';

class textFieldWidget extends StatelessWidget {
  late final String text;
  final TextInputType type;
  final bool isPass;
  final Icon icon;
  textFieldWidget(this.text, this.type, this.isPass, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        keyboardType: type,
        obscureText: isPass,
        textAlign: TextAlign.center,
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: text,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
