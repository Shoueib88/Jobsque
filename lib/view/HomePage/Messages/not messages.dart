import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/widgets/homepage/custom_search_job.dart';

import '../../../consts/style.dart';
import '../../../widgets/default_text.dart';

class NoMessages extends StatelessWidget {
  const NoMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SearchJobs(text: 'Search messages....', width: 240.w),
              GestureDetector(
                child: Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: J.blackColor.withOpacity(0.3)),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('asset/icons/filter.png')),
              )
            ]),
            SizedBox(height: 120.h),
            Container(
                child: Image.asset(
                    'asset/images/notification/Data Ilustration.png',
                    fit: BoxFit.fill)),
            Container(
                width: 290.w,
                height: 130.h,
                child: Center(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DefaultText(
                        text: 'You have not received any messages',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      DefaultText(
                        text:
                            'Once your application has reached the interview stage, you will get a message from the recruiter.',
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ))
          ])),
    );
  }
}
