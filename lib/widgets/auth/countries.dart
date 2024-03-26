import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/default_text.dart';

// ignore: must_be_immutable
class Countries extends StatelessWidget {
  Countries(
      {super.key,
      required this.countryicons,
      required this.text,
      required this.bordercolor,
      required this.color,
      required this.width});
  String? countryicons;
  String? text;
  double? width;
  Color? bordercolor;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 37.h,
        width: width!.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: bordercolor!),
            color: color!),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(countryicons!,
                  fit: BoxFit.fill, height: 29.h, width: 29.w),
              DefaultText(text: text!)
            ]));
  }
}
