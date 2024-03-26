import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/default_text.dart';

// ignore: must_be_immutable
class TitleLogin extends StatelessWidget {
  TitleLogin(
      {super.key,
      required this.title,
      required this.destrbute,
      required this.fontsize,
      required this.hieght,
      required this.fontsizesubtitle});
  String? title;
  String? destrbute;
  double? fontsizesubtitle;
  double? fontsize;
  double? hieght;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        height: hieght!.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(
                text: title!,
                fontSize: fontsize!.sp,
                fontWeight: FontWeight.bold),
            DefaultText(
                text: destrbute!,
                fontSize: fontsizesubtitle!.sp,
                fontWeight: FontWeight.w400),
          ],
        ));
  }
}
