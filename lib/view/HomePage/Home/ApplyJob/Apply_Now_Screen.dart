import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/view/HomePage/Saved/controller/cubit/saved_cubit.dart';

import '../../../../consts/style.dart';
import '../../../../data.dart';
import '../../../../widgets/custom_stepper.dart';
import '../../../../widgets/defult_button.dart';

class ApplyNowScreen extends StatelessWidget {
  const ApplyNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Apply Job'),
          centerTitle: true,
        ),
        body: Center(child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final controller = context.read<HomeCubit>();
            return SingleChildScrollView(
              child: Column(children: [
                steps.elementAt(controller.counter),
                J.sizeboxh10,
                applyJobs.elementAt(controller.counter),
                J.sizeboxh10,
                DefultButton(
                    onpressed: () {
                      controller.stepperOfJobs(context);
                      if (controller.counter == 2) {
                        context.read<SavedCubit>().applyJob(context);
                      }
                    },
                    text: (controller.counter < 2) ? 'Next' : 'Submit',
                    backgroundcolor: J.primaryColor,
                    textcolor: J.whiteColor),
                SizedBox(height: 40.h),
              ]),
            );
          },
        )));
  }
}
