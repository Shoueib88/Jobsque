import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/Auth/controller/cubit/auth_cubit.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

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
                  child: Image.asset('asset/images/check email.png',
                      fit: BoxFit.fill)),
              J.sizeboxh10,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                width: 280.w,
                height: 100.h,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DefaultText(
                        text: 'Check your Email',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      DefaultText(
                        text:
                            'We have sent a reset password to your email address',
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
                  context.read<AuthCubit>().checkEmail(context);
                },
                text: 'Open email app',
                backgroundcolor: J.primaryColor,
                textcolor: J.whiteColor,
              ),
              J.sizeboxh30
            ])));
  }
}
