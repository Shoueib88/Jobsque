import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/Auth/create_account/Success_Account.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../widgets/auth/title_login.dart';
import '../../../widgets/auth/listofcountries.dart';

class Locations extends StatelessWidget {
  const Locations({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          J.sizeboxh10,
                          TitleLogin(
                              title: 'Where are you prefefred Location?',
                              destrbute:
                                  'Let us know, where is the work location you want at this time, so we can adjust it.',
                              fontsize: 23,
                              hieght: 100,
                              fontsizesubtitle: 15),
                          Container(
                              height: 38.h,
                              width: 340.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: J.greyColor.withOpacity(0.4)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        height: 38.h,
                                        width: 160.w,
                                        child: DefaultText(
                                            text: 'Work From Office')),
                                    Container(
                                        alignment: Alignment.center,
                                        height: 38.h,
                                        width: 180.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color(0xff091A7A)),
                                        child: DefaultText(
                                            text: 'Remote Work',
                                            color: J.whiteColor))
                                  ])),
                          DefaultText(
                              text: 'Select the country you want for your job'),
                          ListOfCountries(),
                          DefultButton(
                              onpressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Successing()));
                              },
                              text: 'next',
                              textcolor: J.whiteColor,
                              backgroundcolor: J.primaryColor)
                        ])))));
  }
}
