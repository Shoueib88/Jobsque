import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../default_text.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText({super.key, required this.text, required this.onPressed});
  String? text;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          DefaultText(
              text: text!, fontSize: 21.sp, fontWeight: FontWeight.bold),
          TextButton(onPressed: onPressed, child: DefaultText(text: 'View all'))
        ]));
  }
}
