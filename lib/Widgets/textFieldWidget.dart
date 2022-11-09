import 'package:flutter/material.dart';

class textFormFieldWidget extends StatelessWidget {
  late final String text;
  final bool isPass;
  final Icon icon;
  final TextEditingController controller;
  textFormFieldWidget(
      {required this.text,
      required this.isPass,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
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
