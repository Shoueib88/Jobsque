import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/strings.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/widgets/default_text.dart';
import 'package:jobsque/widgets/defult_button.dart';

class SetFilter {
  setFilter(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        isDismissible: true,
        builder: (BuildContext context) {
          return Container(
            // width: 400,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            context.read<HomeCubit>().selectJobType(false, 0);
                          },
                          child: Icon(Icons.arrow_back)),
                      DefaultText(
                          text: ' Set filter', fontWeight: FontWeight.bold),
                      TextButton(
                          onPressed: () {}, child: DefaultText(text: 'Reset'))
                    ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    J.sizeboxh10,
                    DefaultText(
                        text: 'Job Tittle', fontWeight: FontWeight.bold),
                    SizedBox(height: 5.h),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: J.blackColor.withOpacity(0.4))),
                        width: 340.w,
                        height: 50.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Image.asset(
                                  'asset/icons/briefcase.png',
                                  color: J.blackColor)),
                        ))
                  ],
                ),
                J.sizeboxh20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(text: 'Location', fontWeight: FontWeight.bold),
                    SizedBox(height: 5.h),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: J.blackColor.withOpacity(0.4))),
                        width: 340.w,
                        height: 50.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.location_on_outlined)),
                        ))
                  ],
                ),
                J.sizeboxh20,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  DefaultText(text: 'Salary', fontWeight: FontWeight.bold),
                  SizedBox(height: 5.h),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: J.blackColor.withOpacity(0.4))),
                      width: 340.w,
                      height: 50.h,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                Image.asset('asset/icons/dollar-circle.png')),
                      ))
                ]),
                J.sizeboxh20,
                DefaultText(text: 'Job Type', fontWeight: FontWeight.bold),
                SizedBox(height: 5.h),
                Container(
                  width: 275.w,
                  height: 160.h,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2.5,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 15.0),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      final controller = context.read<HomeCubit>();
                      return BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return GestureDetector(
                              onTap: () {
                                controller.selectJobType(true, index);
                              },
                              child: controller.selectjobtype == true
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: J.activecolor,
                                          border:
                                              Border.all(color: J.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      width: 80.w,
                                      height: 20.h,
                                      child: Center(
                                        child: DefaultText(
                                            text: jobtype[index],
                                            color: J.primaryColor,
                                            fontSize: 12),
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: J.blackColor
                                                  .withOpacity(0.4)),
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      width: 80.w,
                                      height: 20.h,
                                      child: Center(
                                        child: DefaultText(
                                            text: jobtype[index],
                                            color:
                                                J.blackColor.withOpacity(0.4),
                                            fontSize: 12),
                                      ),
                                    ));
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 70.h),
                DefultButton(
                    text: 'Show Result',
                    backgroundcolor: J.primaryColor,
                    textcolor: J.whiteColor)
              ],
            ),
          );
        });
  }
}
