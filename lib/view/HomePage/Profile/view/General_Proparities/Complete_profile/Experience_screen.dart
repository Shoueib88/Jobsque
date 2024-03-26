import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Profile/controller/cubit/profile_cubit.dart';
import 'package:jobsque/view/HomePage/Profile/view/widget/custom_checkbox.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../../../../consts/style.dart';
import '../../../../../../widgets/default_text.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final controller = context.watch<ProfileCubit>();
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          height: 640.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: J.blackColor.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(12)),
                          child: SingleChildScrollView(
                            child: Form(
                              key: controller.experienceformstate,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    J.sizeboxh10,
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(text: 'Position*'),
                                          TextFormField(
                                            controller: controller.position,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                                hintText: 'Position'),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Not Valid ';
                                              }
                                              return null;
                                            },
                                          )
                                        ]),
                                    J.sizeboxh10,
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(text: 'Type of work'),
                                          TextFormField(
                                            controller: controller.typeofwork,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                                hintText: 'Type of work'),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Not Valid ';
                                              }
                                              return null;
                                            },
                                          )
                                        ]),
                                    J.sizeboxh10,
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(text: 'Company name*'),
                                          TextFormField(
                                            controller: controller.companyname,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                                hintText: 'Company name'),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Not Valid ';
                                              }
                                              return null;
                                            },
                                          )
                                        ]),
                                    J.sizeboxh10,
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(text: 'Location'),
                                          // SizedBox(height: 8.h),
                                          TextFormField(
                                            controller: controller.location,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r))),
                                                prefixIcon: GestureDetector(
                                                    onTap: () {},
                                                    child: const Icon(Icons
                                                        .location_on_outlined)),
                                                hintText: 'Location'),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Not Valid ';
                                              }
                                              return null;
                                            },
                                          )
                                        ]),
                                    CustomCheckBox(),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(text: 'Start year*'),
                                          // SizedBox(height: 8.h),
                                          TextFormField(
                                              controller: controller.startyear,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.r))),
                                                  hintText: 'Start year'),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Not Valid ';
                                                }
                                                return null;
                                              })
                                        ]),
                                    J.sizeboxh10,
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(text: 'End year*'),
                                          // SizedBox(height: 8.h),
                                          TextFormField(
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Not Valid ';
                                                }
                                                return null;
                                              },
                                              controller: controller.endyear,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.r))),
                                                  hintText: 'End year'))
                                        ]),
                                    J.sizeboxh10,
                                    DefultButton(
                                        onpressed: () {
                                          if (controller
                                              .experienceformstate.currentState!
                                              .validate()) {
                                            controller
                                                .experienceService(context);
                                          }

                                          context
                                              .read<ProfileCubit>()
                                              .experienceModel();
                                          Timer(Duration(seconds: 2), () {
                                            Navigator.of(context).pop();
                                            controller.position.clear();
                                            controller.typeofwork.clear();
                                            controller.companyname.clear();
                                            controller.location.clear();
                                            controller.startyear.clear();
                                            controller.endyear.clear();
                                          });
                                        },
                                        text: 'Save',
                                        textcolor: J.whiteColor,
                                        backgroundcolor: J.primaryColor)
                                  ]),
                            ),
                          )),
                      J.sizeboxh30,
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: J.blackColor.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: ListTile(
                                trailing:
                                    Icon(Icons.edit, color: J.primaryColor),
                                title: DefaultText(
                                    text: 'Senior UI/UX Designer',
                                    fontWeight: FontWeight.bold),
                                subtitle: DefaultText(
                                    text:
                                        'Remote • GrowUp Studio \n 2012 - 2015',
                                    color: J.greyColor),
                                leading: SizedBox(
                                  width: 35.w,
                                  height: 35.h,
                                  child: Image.asset(
                                      'asset/images/education.png',
                                      fit: BoxFit.fill),
                                )),
                          ))
                    ]);
              },
            ),
          )),
    );
  }
}
