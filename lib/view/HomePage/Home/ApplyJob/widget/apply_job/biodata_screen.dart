import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Saved/controller/cubit/saved_cubit.dart';
import 'package:jobsque/widgets/default_text.dart';

import '../../../controller/cubit/home_cubit.dart';

class BioDataScreen extends StatelessWidget {
  const BioDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        height: 380.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                        text: 'Biodata',
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700),
                    DefaultText(
                        text: 'Fill in your bio data correctly',
                        fontSize: 14.sp,
                        color: J.blackColor.withOpacity(0.5))
                  ]),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Full Name ', style: TextStyle(color: J.blackColor)),
                const TextSpan(text: '*', style: TextStyle(color: Colors.red))
              ])),
              SizedBox(height: 8.h),
              TextFormField(
                  controller: context.watch<SavedCubit>().name,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.person_outline,
                          color: J.blackColor.withOpacity(0.3)),
                      hintText: 'Full Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Not Valid ';
                    }
                    return null;
                  })
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'Email ', style: TextStyle(color: J.blackColor)),
                const TextSpan(text: '*', style: TextStyle(color: Colors.red))
              ])),
              SizedBox(height: 8.h),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  // controller: context.watch<SavedCubit>().email,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Icon(Icons.email_outlined,
                          color: J.blackColor.withOpacity(0.3)),
                      hintText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Not Valid ';
                    }
                    return null;
                  })
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'No.Handphone ',
                      style: TextStyle(color: J.blackColor)),
                  const TextSpan(text: '*', style: TextStyle(color: Colors.red))
                ])),
                SizedBox(height: 8.h),
                TextFormField(
                    // controller: context.watch<SavedCubit>().mobile,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Not Valid ';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusColor: J.primaryColor,
                        prefixIcon: Padding(
                            padding: const EdgeInsets.all(5),
                            child: BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                final controller = context.watch<HomeCubit>();
                                return GestureDetector(
                                  onTap: () {
                                    controller.countrycodepicker(context);
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            child: controller.countryCode !=
                                                    null
                                                ? controller.countryCode!
                                                    .flagImage(fit: BoxFit.fill)
                                                : null),
                                        const SizedBox(width: 5),
                                        Icon(Icons.keyboard_arrow_down_rounded),
                                        DefaultText(
                                            text: '|',
                                            fontSize: 20,
                                            color:
                                                J.blackColor.withOpacity(0.3))
                                      ]),
                                );
                              },
                            )),
                        hintText: 'phone number'))
              ],
            )
          ],
        ));
  }
}
