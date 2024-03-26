import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/style.dart';
import '../../../../widgets/default_text.dart';

class NoSaved extends StatelessWidget {
  NoSaved({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('asset/images/no_saved.png'),
        J.sizeboxh20,
        DefaultText(
            text: 'Nothing has been saved yet',
            fontSize: 22.sp,
            fontWeight: FontWeight.bold),
        DefaultText(text: 'Press the star icon on the job you want to save.'),
        SizedBox(height: 50.h),
      ],
    ));
  }
}
