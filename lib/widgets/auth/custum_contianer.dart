import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/widgets/default_text.dart';

import '../../consts/style.dart';

// ignore: must_be_immutable
class CustomContainerActive extends StatelessWidget {
  CustomContainerActive({super.key, required this.text, required this.asset});
  String? text;
  String? asset;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140.w,
        height: 100.h,
        decoration: BoxDecoration(
          border: Border.all(color: J.primaryColor),
          color: Color(0xffD6E4FF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //CircleAvatar(child: Icon(Icons.abc)),
                  Image.asset(asset!, fit: BoxFit.fill),

                  DefaultText(
                      text: text!, fontSize: 13, fontWeight: FontWeight.bold)
                ])));
  }
}

// ignore: must_be_immutable
class CustomContainerNoActive extends StatelessWidget {
  CustomContainerNoActive({super.key, required this.text, required this.asset});
  String? text;
  String? asset;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140.w,
        height: 100.h,
        decoration: BoxDecoration(
          border: Border.all(color: J.greyColor),
          color: Color(0xffD1D5DB).withOpacity(0.2),
          // color: Color(0xffD1D5DB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //CircleAvatar(child: Icon(Icons.abc)),
                  Image.asset(asset!, fit: BoxFit.fill),
                  DefaultText(
                      text: text!, fontSize: 13, fontWeight: FontWeight.bold)
                ])));
  }
}
