import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key? key, required this.icon, required this.title, this.onClick})
      : super(key: key);

  final IconData icon;
  final String title;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xff2a386c),
      ),
      title: Text(
        title,
        style: GoogleFonts.racingSansOne(
          textStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.cyan,
          ),
        ),
      ),
      onTap: onClick,
    );
  }
}
