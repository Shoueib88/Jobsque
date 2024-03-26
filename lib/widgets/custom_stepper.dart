import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/widgets/default_text.dart';

import '../consts/style.dart';

// ignore: must_be_immutable
class StepOne extends StatelessWidget {
  StepOne(
      {super.key,
      required this.hieght,
      required this.size,
      required this.width});
  double? width;
  double? hieght;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 34.w,
          height: 34.h,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: J.primaryColor),
          child:
              Center(child: Icon(Icons.check, size: 25, color: J.whiteColor)),
        ),
        DefaultText(
          text: 'Biodata',
          fontSize: 12,
          color: J.primaryColor,
        )
      ]),
      DefaultText(
          text: '-----', color: J.blackColor.withOpacity(0.3), fontSize: 15),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 34.w,
            height: 34.h,
            decoration: BoxDecoration(
                border: Border.all(color: J.blackColor.withOpacity(0.3)),
                shape: BoxShape.circle),
            child: Center(
                child: DefaultText(
                    text: '2', color: J.blackColor.withOpacity(0.3)))),
        DefaultText(text: 'Type of work', fontSize: 12)
      ]),
      DefaultText(
          text: '-----', fontSize: 15, color: J.blackColor.withOpacity(0.3)),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 34.w,
            height: 34.h,
            decoration: BoxDecoration(
                border: Border.all(color: J.blackColor.withOpacity(0.3)),
                shape: BoxShape.circle),
            child: Center(
                child: DefaultText(
                    text: '3', color: J.blackColor.withOpacity(0.3)))),
        DefaultText(text: 'UpLoad protfolio', fontSize: 12)
      ])
    ]);
  }
}

// ignore: must_be_immutable
class StepTwo extends StatelessWidget {
  StepTwo(
      {super.key,
      required this.hieght,
      required this.size,
      required this.width});
  double? width;
  double? hieght;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: J.primaryColor),
          child:
              Center(child: Icon(Icons.check, size: 30, color: J.whiteColor)),
        ),
        DefaultText(
          text: 'Biodata',
          fontSize: 12,
          color: J.primaryColor,
        )
      ]),
      DefaultText(text: '-----', color: J.primaryColor, fontSize: 15),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: J.primaryColor),
                shape: BoxShape.circle),
            child:
                Center(child: DefaultText(text: '2', color: J.primaryColor))),
        DefaultText(text: 'Type of work', fontSize: 12, color: J.primaryColor)
      ]),
      DefaultText(
          text: '-----', fontSize: 15, color: J.blackColor.withOpacity(0.3)),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: J.blackColor.withOpacity(0.3)),
                shape: BoxShape.circle),
            child: Center(
                child: DefaultText(
                    text: '3', color: J.blackColor.withOpacity(0.3)))),
        DefaultText(text: 'UpLoad protfolio', fontSize: 12)
      ])
    ]);
  }
}

// ignore: must_be_immutable
class StepThree extends StatelessWidget {
  StepThree(
      {super.key,
      required this.hieght,
      required this.size,
      required this.width});
  double? width;
  double? hieght;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: J.primaryColor),
          child:
              Center(child: Icon(Icons.check, size: 30, color: J.whiteColor)),
        ),
        DefaultText(
          text: 'Biodata',
          fontSize: 12,
          color: J.primaryColor,
        )
      ]),
      DefaultText(text: '-----', color: J.primaryColor, fontSize: 15),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: J.primaryColor),
                shape: BoxShape.circle,
                color: J.primaryColor),
            child: Center(
                child: Icon(Icons.check, size: 30, color: J.whiteColor))),
        DefaultText(text: 'Type of work', fontSize: 12, color: J.primaryColor)
      ]),
      DefaultText(text: '-----', color: J.primaryColor, fontSize: 15),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: J.primaryColor),
                shape: BoxShape.circle),
            child:
                Center(child: DefaultText(text: '3', color: J.primaryColor))),
        DefaultText(
            text: 'UpLoad protfolio', fontSize: 12, color: J.primaryColor)
      ])
    ]);
  }
}

class FinallyStep extends StatelessWidget {
  const FinallyStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 55.w,
          height: 55.h,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: J.primaryColor),
          child:
              Center(child: Icon(Icons.check, size: 30, color: J.whiteColor)),
        ),
        DefaultText(
          text: 'Biodata',
          fontSize: 12,
          color: J.primaryColor,
        )
      ]),
      DefaultText(text: '-----', color: J.primaryColor, fontSize: 15),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: J.primaryColor),
                shape: BoxShape.circle,
                color: J.primaryColor),
            child: Center(
                child: Icon(Icons.check, size: 30, color: J.whiteColor))),
        DefaultText(text: 'Type of work', fontSize: 12, color: J.primaryColor)
      ]),
      DefaultText(text: '-----', color: J.primaryColor, fontSize: 15),
      Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
                border: Border.all(color: J.primaryColor),
                color: J.primaryColor,
                shape: BoxShape.circle),
            child: Center(
                child: Icon(Icons.check, size: 30, color: J.whiteColor))),
        DefaultText(
            text: 'UpLoad protfolio', fontSize: 12, color: J.primaryColor)
      ])
    ]);
  }
}

List steps = [
  StepOne(hieght: 55.h, size: 30, width: 55.w),
  StepTwo(hieght: 55.h, size: 30, width: 55.w),
  StepThree(hieght: 55.h, size: 30, width: 55.w)
];
