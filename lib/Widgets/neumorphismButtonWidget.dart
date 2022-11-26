import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class NeumorphismButtonWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onClick;
  final Color myColor;
  const NeumorphismButtonWidget(
      {required this.child,
      required this.onClick,
      required this.myColor,
      Key? key})
      : super(key: key);

  @override
  State<NeumorphismButtonWidget> createState() =>
      _NeumorphismButtonWidgetState();
}

class _NeumorphismButtonWidgetState extends State<NeumorphismButtonWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Offset distance = isPressed ? Offset(3, 3) : Offset(2, 2);
    double blur = isPressed ? 3 : 2;

    return GestureDetector(
      onTap: widget.onClick,
      child: Listener(
        onPointerUp: (_) {
          setState(() {
            isPressed = false;
          });
        },
        onPointerDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: EdgeInsets.all(8),
          child: widget.child,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.myColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                offset: distance,
                spreadRadius: 0.5,
                blurStyle: BlurStyle.inner,
                blurRadius: blur,
                inset: isPressed,
              ),
              BoxShadow(
                color: Colors.white,
                offset: -distance,
                spreadRadius: 0.5,
                blurStyle: BlurStyle.inner,
                blurRadius: blur,
                inset: isPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
