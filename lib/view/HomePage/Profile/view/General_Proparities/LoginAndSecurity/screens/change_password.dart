import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../../../../../consts/style.dart';
import '../../../../../../../widgets/default_text.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Change password'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final controller = context.read<ProfileCubit>();
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                          key: controller.formKey,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(text: 'Enter your old password'),
                                  TextFormField(
                                    controller: controller.oldPassword,
                                    obscureText: controller.obscureText,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.r))),
                                        prefixIcon: Icon(Icons.lock_outline,
                                            color:
                                                J.blackColor.withOpacity(0.3)),
                                        suffixIcon: IconButton(
                                          icon: controller.eyeIcon,
                                          onPressed: () {
                                            controller.switchEyeIcon();
                                          },
                                        ),
                                        hintText: 'old password'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your old password';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) =>
                                        controller.oldPassword.text = value!,
                                  )
                                ]),
                            SizedBox(height: 8.h),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(text: 'Enter your new password'),
                                  TextFormField(
                                    controller: controller.newPassword,
                                    obscureText: controller.obscureTexttwo,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.r))),
                                        prefixIcon: Icon(Icons.lock_outline,
                                            color:
                                                J.blackColor.withOpacity(0.3)),
                                        suffixIcon: IconButton(
                                          icon: controller.eyeIcontwo,
                                          onPressed: () {
                                            controller.switchEyeIconTwo();
                                          },
                                        ),
                                        hintText: ' new password'),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your new password';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) =>
                                        controller.newPassword.text = value!,
                                  )
                                ]),
                            SizedBox(height: 8.h),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DefaultText(
                                      text: 'Confirm your new password'),
                                  TextFormField(
                                    obscureText: controller.obscureTextthree,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.r))),
                                        prefixIcon: Icon(Icons.lock_outline,
                                            color:
                                                J.blackColor.withOpacity(0.3)),
                                        suffixIcon: IconButton(
                                          icon: controller.eyeIconthree,
                                          onPressed: () {
                                            controller.switchEyeIconThree();
                                          },
                                        ),
                                        hintText: 'Confirm password'),
                                    validator: (value) {
                                      if (value !=
                                          controller.newPassword.text) {
                                        return 'no match';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) =>
                                        controller.newPassword.text = value!,
                                  )
                                ])
                          ])),
                      // SizedBox(height: 288.h),
                      DefultButton(
                        text: 'Save',
                        textcolor: J.whiteColor,
                        backgroundcolor: J.primaryColor,
                        onpressed: () {
                          if (controller.formKey.currentState!.validate()) {}
                        },
                      )
                    ]);
              },
            )));
  }
}
