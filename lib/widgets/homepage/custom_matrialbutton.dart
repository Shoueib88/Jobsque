import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts/style.dart';
import '../default_text.dart';

// ignore: must_be_immutable
class CustomMatrialButton extends StatelessWidget {
  CustomMatrialButton({super.key, required this.text, required this.onPressed});
  String? text;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28.h,
      width: 76.w,
      decoration: BoxDecoration(
          color: J.activecolor, borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: onPressed,
        child: DefaultText(
          text: text!,
          color: J.primaryColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
