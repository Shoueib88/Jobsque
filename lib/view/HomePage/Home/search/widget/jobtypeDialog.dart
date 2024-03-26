import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

class JobTypeDialog {
  jobTypeDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return Container(
            height: 190.h,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  DefaultText(
                      text: 'On-Site/Remote',
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: J.activecolor,
                          border: Border.all(color: J.primaryColor),
                          borderRadius: BorderRadius.circular(25)),
                      width: 75.w,
                      height: 30.h,
                      child: Center(
                        child: DefaultText(
                            text: 'Remote',
                            color: J.primaryColor,
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: J.activecolor,
                          border: Border.all(color: J.primaryColor),
                          borderRadius: BorderRadius.circular(25)),
                      width: 75.w,
                      height: 30.h,
                      child: Center(
                        child: DefaultText(
                            text: 'OnSite',
                            color: J.primaryColor,
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: J.blackColor.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(25)),
                      width: 75.w,
                      height: 30.h,
                      child: Center(
                        child: DefaultText(
                            text: 'Hybird',
                            color: J.blackColor.withOpacity(0.4),
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: J.blackColor.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(25)),
                      width: 75.w,
                      height: 30.h,
                      child: Center(
                        child: DefaultText(
                            text: 'Any',
                            color: J.blackColor.withOpacity(0.4),
                            fontSize: 12),
                      ),
                    )
                  ],
                ),
                DefultButton(
                    text: 'Show Result',
                    backgroundcolor: J.primaryColor,
                    textcolor: J.whiteColor)
              ],
            ),
          );
        });
  }
}
