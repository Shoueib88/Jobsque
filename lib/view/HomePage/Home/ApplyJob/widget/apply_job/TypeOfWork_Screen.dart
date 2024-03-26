import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Saved/controller/cubit/saved_cubit.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../../consts/style.dart';
import '../../../../../../widgets/default_text.dart';
import '../../../controller/cubit/home_cubit.dart';

class TypeOfWorkScreen extends StatelessWidget {
  const TypeOfWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 450.h,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                DefaultText(
                    text: 'Type of work',
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700),
                DefaultText(
                  text: 'Fill in your bio data correctly',
                  fontSize: 14.sp,
                  color: J.blackColor.withOpacity(0.5),
                )
              ]),
              Container(
                  height: 300.h,
                  child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                    final controller = context.read<HomeCubit>();
                    final controlapplyjob = context.read<SavedCubit>();
                    return ListView.separated(
                        itemCount: controller.listOfData.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return J.sizeboxh20;
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              padding: const EdgeInsets.all(15),
                              height: 78.h,
                              decoration: BoxDecoration(
                                  color: controller.currentindex == index &&
                                          controller.selectjobtype == true
                                      ? J.primaryColor.withOpacity(0.2)
                                      : null,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: (controller.currentindex == index &&
                                            controller.selectjobtype == true)
                                        ? J.primaryColor
                                        : J.blackColor.withOpacity(0.4),
                                  )),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          DefaultText(
                                            text: controller
                                                .listOfData[index].name!,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          DefaultText(
                                              text: 'CV.pdf . Protfolio.pdf',
                                              color:
                                                  J.blackColor.withOpacity(0.3))
                                        ]),
                                    RoundCheckBox(
                                        onTap: (selected) {
                                          controller.selectJobType(
                                              selected!, index);
                                          controlapplyjob.worktype = controller
                                              .listOfData[index].jobType!;
                                          controlapplyjob.jobid = controller
                                              .listOfData[index].id
                                              .toString();
                                        },
                                        isChecked:
                                            controller.currentindex == index
                                                ? controller.selectjobtype
                                                : false,
                                        checkedColor: J.whiteColor,
                                        checkedWidget: Container(
                                            decoration: BoxDecoration(
                                                color: J.primaryColor,
                                                shape: BoxShape.circle),
                                            margin: EdgeInsets.all(2)),
                                        size: 20,
                                        border: Border.all(
                                          color: (controller.currentindex ==
                                                      index &&
                                                  controller.selectjobtype ==
                                                      true)
                                              ? J.primaryColor
                                              : J.blackColor.withOpacity(0.4),
                                        ))
                                  ]));
                        });
                  }))
            ]));
  }
}
