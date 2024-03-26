import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/default_text.dart';

class RejectedJobs extends StatelessWidget {
  const RejectedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 320.h,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('asset/images/rejected_job.png'),
            DefaultText(
                text: 'No applications were rejected',
                fontSize: 23,
                fontWeight: FontWeight.bold),
            DefaultText(
                textAlign: TextAlign.center,
                text:
                    'If there is an application that is rejected by the company it will appear here')
          ],
        )));
  }
}
