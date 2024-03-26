import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/strings.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/Auth/create_account/screen_one.dart';
import 'package:jobsque/view/OnBoarding/controller/cubit/splash_cubit.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../widgets/onboarding/custom_pageview.dart';
import '../../../widgets/onboarding/custom_smooth.dart';
import '../../../widgets/onboarding/onboard_stack.dart';

void main() => runApp(const Onboarding());

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final custompage = CustomPageview();
    return Scaffold(
      backgroundColor: J.whiteColor,
      body: SafeArea(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(alignment: Alignment.topCenter, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400.h,
                child: custompage.pageviewOfPhoto(),
              ),
              const CustomAppBar(),
            ]),
            SizedBox(
                width: 300.w,
                height: 100.h,
                child: custompage.pageviewOfBigText()),
            SizedBox(
              width: 300.w,
              height: 40.0.h,
              child: custompage.pageviewOfSmallText(),
            ),
            BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
              return CustomSmooth(index: context.read<SplashCubit>().count);
            }),
            BlocBuilder<SplashCubit, SplashState>(builder: (context, state) {
              return context.read<SplashCubit>().count < 2
                  ? DefultButton(
                      text: Strings.next,
                      textcolor: J.whiteColor,
                      backgroundcolor: J.primaryColor,
                      onpressed: () {
                        context.read<SplashCubit>().changeText();
                        custompage.pc.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeIn);
                        custompage.pc2.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeIn);
                        custompage.pc3.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeIn);
                      },
                    )
                  : DefultButton(
                      text: Strings.getstarted,
                      textcolor: J.whiteColor,
                      backgroundcolor: J.primaryColor,
                      onpressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CreateAccountScreen()),
                        );
                      });
            })
          ],
        )),
      ),
    );
  }
}
