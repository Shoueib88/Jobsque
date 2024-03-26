import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Applied/applied_screen.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';

import '../../../consts/style.dart';
import '../../../data.dart';
import '../../../widgets/custom_stepper.dart';
import '../../../widgets/default_text.dart';
import '../../../widgets/defult_button.dart';

// ignore: must_be_immutable
class ApplyJobNow extends StatelessWidget {
  ApplyJobNow({super.key, required this.index});
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Applied Job'),
        centerTitle: true,
        leading: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AppliedScreen()));
                  context.read<HomeCubit>().counter = 0;
                },
                icon: Icon(Icons.arrow_back));
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final controller = context.read<HomeCubit>();
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(controller.listOfData[index!].image!,
                          //Assets.facebook,
                          height: 55.h,
                          width: 60.w,
                          fit: BoxFit.fill),
                      DefaultText(
                          text: controller.listOfData[index!].name!,
                          //'Senior UI Designer',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                      DefaultText(
                          text: (controller.listOfData[index!].jobType! +
                              ' , ' +
                              controller.listOfData[index!].compName!),
                          fontSize: 16.sp),
                      steps.elementAt(controller.counter),
                      applyJobs.elementAt(controller.counter),
                      DefultButton(
                          onpressed: () {
                            controller.stepperOfJobs(context);
                          },
                          text: (controller.counter < 2) ? 'Next' : 'Submit',
                          backgroundcolor: J.primaryColor,
                          textcolor: J.whiteColor)
                    ]),
              );
            },
          )),
    );
  }
}
