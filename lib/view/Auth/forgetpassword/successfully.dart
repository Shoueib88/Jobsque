import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Home/home_screen.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

class Successfully extends StatelessWidget {
  const Successfully({super.key});

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
                      'asset/images/Password Succesfully Ilustration.png',
                      fit: BoxFit.fill)),
              J.sizeboxh10,
              Container(
                width: 290.w,
                height: 130.h,
                child: Center(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DefaultText(
                        text: 'Password changed succesfully!',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      DefaultText(
                        text:
                            'Your password has been changed successfully, we will let you know if there are more problems with your account',
                        fontSize: 13,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 170.h),
              DefultButton(
                onpressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                text: 'Open email app',
                backgroundcolor: J.primaryColor,
                textcolor: J.whiteColor,
              ),
              J.sizeboxh30
            ])));
  }
}
