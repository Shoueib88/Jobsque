import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Home/controller/cubit/home_cubit.dart';
import 'package:jobsque/widgets/defult_button.dart';

import '../../../../../../consts/style.dart';
import '../../../../../../widgets/default_text.dart';
import '../../../home_screen.dart';

void main() => runApp(const SendSuccessfully());

class SendSuccessfully extends StatelessWidget {
  const SendSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: J.whiteColor,
        appBar: AppBar(
          backgroundColor: J.whiteColor,
          title: const Text('Apply Job'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Image.asset('asset/images/applied_job.png',
                        fit: BoxFit.fill)),
                J.sizeboxh10,
                Container(
                    width: 290.w,
                    height: 130.h,
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          DefaultText(
                            text: 'Your data has been successfully sent',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                          DefaultText(
                              text:
                                  'You will get a message from our team, about the announcement of employee acceptance',
                              fontSize: 13,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600)
                        ]))),
                SizedBox(height: 120.h),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return DefultButton(
                        onpressed: () {
                          context.read<HomeCubit>().currentValue();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        },
                        text: 'Back to home',
                        backgroundcolor: J.primaryColor,
                        textcolor: J.whiteColor);
                  },
                ),
                J.sizeboxh30
              ]),
        ));
  }
}
