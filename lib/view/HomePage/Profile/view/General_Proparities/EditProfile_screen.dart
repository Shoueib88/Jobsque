import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../Home/controller/cubit/home_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 27,
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    final controllerprofile = context.read<ProfileCubit>();
                    return SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //SizedBox(height: 55.h),
                            CircleAvatar(
                                radius: 35.r,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                        'asset/images/img_profile_90x90.png',
                                        fit: BoxFit.fill),
                                    // ignore: unrelated_type_equality_checks
                                    controllerprofile.image == ''
                                        ? Icon(Icons.camera_alt_outlined,
                                            color: J.whiteColor)
                                        : CircleAvatar(
                                            radius: 35.r,
                                            backgroundImage: FileImage(
                                                controllerprofile.image))
                                  ],
                                )),
                            J.sizeboxh20,
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                            actions: [
                                              InkWell(
                                                  onTap: () async {
                                                    await controllerprofile
                                                        .pickImage(
                                                            ImageSource.camera);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                      height: 35.h,
                                                      width: 60.w,
                                                      decoration: BoxDecoration(
                                                          color: J.primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.r)),
                                                      child: Center(
                                                        child: DefaultText(
                                                            text: 'Camera',
                                                            color:
                                                                J.whiteColor),
                                                      ))),
                                              InkWell(
                                                  onTap: () async {
                                                    await controllerprofile
                                                        .pickImage(ImageSource
                                                            .gallery);

                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Container(
                                                      height: 35.h,
                                                      width: 60.w,
                                                      decoration: BoxDecoration(
                                                          color: J.primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.r)),
                                                      child: Center(
                                                        child: DefaultText(
                                                            text: 'Gallery',
                                                            color:
                                                                J.whiteColor),
                                                      ))),
                                              SizedBox(width: 40.w),
                                            ],
                                            title: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.cancel,
                                                    size: 30,
                                                    color: J.primaryColor)));
                                      });
                                },
                                child: DefaultText(
                                    text: 'Change Photo',
                                    color: J.primaryColor)),
                            Container(
                              height: 400.h,
                              child: Form(
                                key: controllerprofile.formprofilestate,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DefaultText(text: 'Name'),
                                        //SizedBox(height: 8.h),
                                        TextFormField(
                                            controller: controllerprofile.name,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                                hintText: 'Name'),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Not Valid ';
                                              }
                                              return null;
                                            })
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DefaultText(text: 'Bio'),
                                        // SizedBox(height: 8.h),
                                        TextFormField(
                                            controller: controllerprofile.bio,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                                hintText: 'Bio'),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Not Valid ';
                                              }
                                              return null;
                                            })
                                      ],
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(text: 'Address'),
                                          // SizedBox(height: 8.h),
                                          TextFormField(
                                              controller:
                                                  controllerprofile.address,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.r))),
                                                  hintText: 'Address'),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Not Valid ';
                                                }
                                                return null;
                                              })
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(text: 'No.Handphone'),
                                          // SizedBox(height: 8.h),
                                          TextFormField(
                                              controller:
                                                  controllerprofile.mobile,
                                              keyboardType: TextInputType.phone,
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.r))),
                                                  focusColor: J.primaryColor,
                                                  prefixIcon: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      child: BlocBuilder<
                                                              HomeCubit,
                                                              HomeState>(
                                                          builder:
                                                              (context, state) {
                                                        final controller =
                                                            context.read<
                                                                HomeCubit>();
                                                        return GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .countrycodepicker(
                                                                      context);
                                                            },
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Container(
                                                                      child: controller.countryCode !=
                                                                              null
                                                                          ? controller
                                                                              .countryCode!
                                                                              .flagImage(fit: BoxFit.fill)
                                                                          : null),
                                                                  const SizedBox(
                                                                      width: 5),
                                                                  Icon(Icons
                                                                      .keyboard_arrow_down_rounded),
                                                                  DefaultText(
                                                                      text: '|',
                                                                      fontSize:
                                                                          20,
                                                                      color: J
                                                                          .blackColor
                                                                          .withOpacity(
                                                                              0.3))
                                                                ]));
                                                      })),
                                                  hintText: 'phone number'),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Not Valid ';
                                                }
                                                return null;
                                              })
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                            DefultButton(
                                onpressed: () {
                                  context
                                      .read<ProfileCubit>()
                                      .personalDetailsModel();
                                  if (controllerprofile
                                      .formprofilestate.currentState!
                                      .validate()) {
                                    controllerprofile.editProfile(
                                        context,
                                        controllerprofile.bio.text,
                                        controllerprofile.address.text,
                                        controllerprofile.mobile.text);
                                    controllerprofile
                                        .addProfileService(context);
                                    Timer(Duration(seconds: 2), () {
                                      Navigator.of(context).pop();
                                      controllerprofile.name.clear();
                                      controllerprofile.bio.clear();
                                      controllerprofile.address.clear();
                                      controllerprofile.mobile.clear();
                                      controllerprofile.image = File(
                                          '/data/user/0/com.example.jobsque/cache/18f88e9a-02cc-416a-8362-ca8f794d1e21/1000023064.jpg');
                                    });
                                  }
                                },
                                text: 'Save',
                                backgroundcolor: J.primaryColor,
                                textcolor: J.whiteColor)
                          ]),
                    );
                  },
                ))));
  }
}
