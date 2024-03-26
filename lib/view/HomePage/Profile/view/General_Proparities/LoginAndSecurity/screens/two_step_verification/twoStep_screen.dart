import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/view/HomePage/Profile/view/widget/Screens_Verification.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

class TwoStepVerification extends StatelessWidget {
  const TwoStepVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Two-Step Verification'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                context.read<ProfileCubit>().two_step = 'first';
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back))),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final homecontroller = context.read<HomeCubit>();
              final profilecontroller = context.read<ProfileCubit>();
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Container(
                        height: 80.h,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                                color: J.blackColor.withOpacity(0.3))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 190.w,
                                  child: DefaultText(
                                      text:
                                          'Secure your account with two-step verification')),
                              Switch(
                                  value: homecontroller.selectjobtype,
                                  onChanged: (val) {
                                    homecontroller.selectJobType(val, 0);
                                  })
                            ])),
                    if (profilecontroller.two_step == 'first')
                      FirstScreenVerification()
                    else if (profilecontroller.two_step == 'second')
                      SecondScreenVerification()
                  ]),
                  DefultButton(
                      onpressed: () {},
                      text: 'Next',
                      textcolor: J.whiteColor,
                      backgroundcolor: J.primaryColor)
                ],
              );
            },
          )),
    );
  }
}
