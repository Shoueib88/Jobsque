import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/Complete_profile/Education_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/Complete_profile/Experience_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/EditProfile_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/Portfolio_screen.dart';
import 'package:jobsque/view/HomePage/Profile/view/widget/complete_items.dart';

import '../../../../../../consts/style.dart';
import '../../../../../../widgets/default_text.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Profile'),
        centerTitle: true,
      ),
      body: Center(child:
          BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        final profilecontrol = context.read<ProfileCubit>();
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: 100.h,
                  width: 100.w,
                  child: Stack(alignment: Alignment.center, children: [
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            height: 90.h,
                            width: 100.w,
                            child: CircularProgressIndicator(
                              value: profilecontrol.progressValue,
                              backgroundColor: J.greyColor.withOpacity(0.4),
                              color: J.primaryColor,
                              strokeWidth: 6.w,
                            ))),
                    Align(
                        alignment: Alignment.center,
                        child: DefaultText(
                            text: '${profilecontrol.percent} %',
                            fontSize: 23,
                            color: J.primaryColor)),
                  ])),
              DefaultText(
                  text: '${profilecontrol.num_completed}/4 Completed',
                  color: J.primaryColor,
                  fontSize: 20),
              DefaultText(
                  text: 'Complete your profile before applying for a job',
                  color: J.greyColor),
              J.sizeboxh10,
              Container(
                  width: MediaQuery.of(context).size.width - 15,
                  height: 422.h,
                  child: Column(children: [
                    One(),
                    Two(),
                    Three(),
                    Four(),
                  ]))
            ]);
      })),
    );
  }
}

List listcompletetext = [
  'Personal Details',
  'Portfolio',
  'Education',
  'Experience',
];

List listSubtitle = [
  'Full name, email, phone number, and your address',
  'Create your portfolio. Applying for various types of jobs is easier.',
  'Enter your educational history to be considered by the recruiter',
  'Enter your work experience to be considered by the recruiter',
];

List complete_screen = [
  EditProfileScreen(),
  Portfolio(),
  EducationScreen(),
  ExperienceScreen(),
];
