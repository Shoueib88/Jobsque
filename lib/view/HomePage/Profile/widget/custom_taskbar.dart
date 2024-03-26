import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';

import '../../../../widgets/default_text.dart';

// ignore: must_be_immutable
class CustomTaskBar extends StatelessWidget {
  CustomTaskBar({super.key, required this.text});
  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        height: 30.h,
        decoration: BoxDecoration(
            color: J.greyColor.withOpacity(0.3),
            border: Border.symmetric(
                horizontal: BorderSide(color: J.blackColor.withOpacity(0.1)))),
        child: DefaultText(text: '\t\t$text'));
  }
}
