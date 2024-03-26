import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/style.dart';
import '../../../../widgets/default_text.dart';

class DataAboutUser extends StatelessWidget {
  const DataAboutUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: J.greyColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12)),
          width: 320.w,
          height: 80.w,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                width: 70.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultText(text: 'Applied'),
                      DefaultText(text: '44')
                    ])),
            VerticalDivider(),
            Container(
                width: 70.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultText(text: 'Reviewed'),
                      DefaultText(text: '30')
                    ])),
            VerticalDivider(),
            Container(
                width: 70.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultText(text: 'Contacted'),
                      DefaultText(text: '22')
                    ])),
          ])),
      J.sizeboxh20,
      Container(
          width: 310.w,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(text: 'About'),
                DefaultText(text: 'Edit', color: J.primaryColor)
              ])),
      J.sizeboxh20,
      Container(
          width: 310,
          child: Center(
              child: DefaultText(
                  text:
                      "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.")))
    ]);
  }
}
