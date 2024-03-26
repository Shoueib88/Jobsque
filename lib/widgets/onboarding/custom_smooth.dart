import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class CustomSmooth extends StatelessWidget {
  CustomSmooth({super.key, this.index});
  int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      child: AnimatedSmoothIndicator(
        activeIndex: index!,
        count: 3,
        effect: WormEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            activeDotColor: J.primaryColor,
            dotColor: J.primaryColor.withOpacity(0.3),
            radius: 20.0),
      ),
    );
  }
}
