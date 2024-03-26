import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../../../../../../consts/style.dart';
import '../../../../../../../../widgets/default_text.dart';

class OtpSreen extends StatelessWidget {
  const OtpSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Two-Step Verification'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DefaultText(text: 'Enter the 6 digit code'),
                        DefaultText(
                          text:
                              'Please confirm your account by entering the authorization code sen to ****-****-7234',
                          fontSize: 13.sp,
                          color: J.greyColor,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70.h,
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                // physics: BouncingScrollPhysics(),
                                itemCount: 6,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return J.sizeboxw10;
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      width: 43.w,
                                      height: 45.h,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        11.r))),
                                      ));
                                })),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DefaultText(text: 'Resend code'),
                              DefaultText(text: '42s', color: J.primaryColor),
                            ])
                      ]),
                  DefultButton(
                      text: 'Verify',
                      textcolor: J.whiteColor,
                      backgroundcolor: J.primaryColor)
                ])));
  }
}
