import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/LoginAndSecurity/screens/two_step_verification/add_phone.dart';

import '../../../../../consts/style.dart';
import '../../../../../widgets/default_text.dart';

class FirstScreenVerification extends StatelessWidget {
  const FirstScreenVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              context.read<ProfileCubit>().setTwoStepVerificationType();
            },
            child: Container(
                height: 90.h,
                padding: const EdgeInsets.all(5),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: J.activecolor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Icon(Icons.lock_outline, color: J.primaryColor)),
                  ),
                  J.sizeboxw10,
                  Container(
                      width: 250.w,
                      child: DefaultText(
                          fontSize: 12.sp,
                          text:
                              'Two-step verification provides additional security by asking for a verification code every time you log in on another device.'))
                ])),
          );
        },
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPhone()));
        },
        child: Container(
            height: 90.h,
            padding: const EdgeInsets.all(5),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  width: 50.w,
                  height: 50.h,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: J.activecolor, shape: BoxShape.circle),
                  child: Image.asset('asset/images/external_drive.png',
                      fit: BoxFit.fill)),
              J.sizeboxw10,
              Container(
                  width: 250.w,
                  child: DefaultText(
                      fontSize: 12.sp,
                      text:
                          'Adding a phone number or using an authenticator will help keep your account safe from harm.'))
            ])),
      )
    ]);
  }
}

class SecondScreenVerification extends StatelessWidget {
  const SecondScreenVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220.h,
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DefaultText(
                text: 'Select a verification method', color: J.blackColor),
            TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                    hintText: 'Telephone number (SMS)',
                    hintStyle: TextStyle(color: J.blackColor),
                    suffixIcon: Icon(Icons.keyboard_arrow_down))),
            DefaultText(
                text:
                    'Note : Turning this feature will sign you out anywhere you’re currently signed in. We will then require you to enter a verification code the first time you sign with a new device or Joby mobile application.',
                color: J.blackColor)
          ],
        ));
  }
}
