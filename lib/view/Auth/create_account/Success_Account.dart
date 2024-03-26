import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/Auth/login/login_screen.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../widgets/auth/title_login.dart';

class Successing extends StatelessWidget {
  const Successing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                  child: Image.asset(
                      'asset/images/Success Account Ilustration.png',
                      fit: BoxFit.fill)),
              Container(
                  width: 280.w,
                  alignment: Alignment.center,
                  child: TitleLogin(
                      title: 'Your account has been set up!',
                      destrbute:
                          'We have customized feeds according to your preferences',
                      fontsize: 20,
                      hieght: 100,
                      fontsizesubtitle: 13)),
              SizedBox(height: 170.h),
              DefultButton(
                onpressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                text: 'Get Started',
                backgroundcolor: J.primaryColor,
                textcolor: J.whiteColor,
              ),
              J.sizeboxh30
            ])));
  }
}
