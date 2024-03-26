import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/view/HomePage/Profile/view/General_Proparities/LoginAndSecurity/screens/two_step_verification/otp_screen.dart';

import '../../../../../../../../consts/style.dart';
import '../../../../../../../../widgets/default_text.dart';
import '../../../../../../../../widgets/defult_button.dart';
import '../../../../../../Home/controller/cubit/home_cubit.dart';

class AddPhone extends StatelessWidget {
  const AddPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-Step Verification'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final homecontrol = context.read<HomeCubit>();
              final profilecontrol = context.read<ProfileCubit>();
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(text: 'Add phone number'),
                          DefaultText(
                            text:
                                'We will send a verification code to this number',
                            fontSize: 12.sp,
                            color: J.greyColor,
                          ),
                          SizedBox(height: 4.h),
                          TextFormField(
                              controller: TextEditingController(),
                              keyboardType: TextInputType.phone,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  focusColor: J.primaryColor,
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: GestureDetector(
                                          onTap: () {
                                            homecontrol
                                                .countrycodepicker(context);
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                    child: homecontrol
                                                                .countryCode !=
                                                            null
                                                        ? homecontrol
                                                            .countryCode!
                                                            .flagImage(
                                                                fit:
                                                                    BoxFit.fill)
                                                        : null),
                                                const SizedBox(width: 5),
                                                Icon(Icons
                                                    .keyboard_arrow_down_rounded),
                                                DefaultText(
                                                    text: '|',
                                                    fontSize: 20,
                                                    color: J.blackColor
                                                        .withOpacity(0.3))
                                              ]))),
                                  hintText: 'phone number')),
                          J.sizeboxh10,
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(text: 'Enter your password'),
                                TextFormField(
                                    controller: profilecontrol.oldPassword,
                                    obscureText: profilecontrol.obscureText,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.r))),
                                        prefixIcon: Icon(Icons.lock_outline,
                                            color:
                                                J.blackColor.withOpacity(0.3)),
                                        suffixIcon: IconButton(
                                            icon: profilecontrol.eyeIcon,
                                            onPressed: () {
                                              profilecontrol.switchEyeIcon();
                                            }),
                                        hintText: 'enter password'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your  password';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) => profilecontrol
                                        .oldPassword.text = value!)
                              ])
                        ]),
                    DefultButton(
                        onpressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OtpSreen()));
                        },
                        text: 'Next',
                        textcolor: J.whiteColor,
                        backgroundcolor: J.primaryColor)
                  ]);
            },
          )),
    );
  }
}
