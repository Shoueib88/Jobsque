import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/widgets/default_text.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  CustomContainer(
      {super.key,
      required this.color,
      required this.text,
      required this.backgroundcolor});

  Color color;
  Color backgroundcolor;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 35.h,
      decoration: BoxDecoration(
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: J.blackColor.withOpacity(0.2))),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DefaultText(text: text!, color: color),
          Icon(Icons.keyboard_arrow_down_sharp, color: color)
        ],
      )),
    );
  }
}
