import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Applied/applyJobNow.dart';

import '../../../../consts/assets.dart';
import '../../../../consts/style.dart';
import '../../../../widgets/custom_stepper.dart';
import '../../../../widgets/default_text.dart';
import '../../../../widgets/homepage/custom_matrialbutton.dart';
import '../../Home/controller/cubit/home_cubit.dart';
import '../../Profile/widget/custom_taskbar.dart';

class ActiveJobs extends StatelessWidget {
  const ActiveJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomTaskBar(text: '3 Jobs'),
      J.sizeboxh10,
      BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        final controller = context.read<HomeCubit>();
        return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 450.h,
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: context.read<HomeCubit>().listOfData.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 20);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 183.h,
                      //color: J.activecolor,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ApplyJobNow(index: index)));
                              },
                              child: ListTile(
                                  leading: Image.network(
                                      controller.listOfData[index].image!,
                                      height: 45.h,
                                      width: 50.w,
                                      fit: BoxFit.fill),
                                  trailing: Image.asset(archivemunse[index],
                                      fit: BoxFit.fill),
                                  isThreeLine: true,
                                  title: DefaultText(
                                      text: controller.listOfData[index].name!,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.sp),
                                  subtitle: DefaultText(
                                      text: (controller
                                              .listOfData[index].jobType! +
                                          ' , ' +
                                          controller
                                              .listOfData[index].compName!))),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomMatrialButton(
                                      text: 'Fulltime', onPressed: () {}),
                                  CustomMatrialButton(
                                      text: 'Remote', onPressed: () {}),
                                  SizedBox(width: 45.w),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            controller.listOfData[index].salary,
                                        // "\K",
                                        style: TextStyle(
                                            color: J.greenColor, fontSize: 14)),
                                    TextSpan(
                                        text: '/Month',
                                        style: TextStyle(
                                            color: J.blackColor, fontSize: 12)),
                                  ]))
                                ]),
                            J.sizeboxh10,
                            Container(
                                padding: EdgeInsets.all(2),
                                width: MediaQuery.of(context).size.width,
                                height: 64.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                        color: J.blackColor.withOpacity(0.3))),
                                child: Center(
                                    child: StepOne(
                                        hieght: 34.h, size: 25, width: 34.w)))
                          ]));
                }));
      })
    ]);
  }
}
