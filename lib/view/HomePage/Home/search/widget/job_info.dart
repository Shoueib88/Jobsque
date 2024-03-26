import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Home/search/widget/set_filter.dart';

import '../../../../../consts/style.dart';
import 'costom_container.dart';

class JobInformation extends StatelessWidget {
  const JobInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 30.h,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              J.sizeboxw20,
              GestureDetector(
                onTap: () {
                  SetFilter().setFilter(context);
                },
                child: Image.asset('asset/icons/filter.png', fit: BoxFit.fill),
              ),
              J.sizeboxw10,
              CustomContainer(
                  color: J.whiteColor,
                  text: 'Full Time',
                  backgroundcolor: Color(0xff091A7A)),
              J.sizeboxw10,
              CustomContainer(
                  color: J.whiteColor,
                  text: 'Remote',
                  backgroundcolor: Color(0xff091A7A)),
              J.sizeboxw10,
              CustomContainer(
                  color: J.blackColor,
                  text: 'Post data',
                  backgroundcolor: J.whiteColor),
              J.sizeboxw10,
              CustomContainer(
                  color: J.blackColor,
                  text: 'Part Time',
                  backgroundcolor: J.whiteColor),
              J.sizeboxw10,
            ],
          ),
        ));
  }
}
