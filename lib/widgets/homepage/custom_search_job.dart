import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Home/search/searchScreenOne.dart';
import 'package:jobsque/widgets/default_text.dart';

import '../../consts/style.dart';

// ignore: must_be_immutable
class SearchJobs extends StatelessWidget {
  SearchJobs({super.key, required this.text, required this.width});
  double? width;
  String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SearchScreenOne()));
      },
      child: Container(
          width: width,
          height: 40.h,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: J.blackColor.withOpacity(0.2))),
          child: Row(
            children: [
              J.sizeboxw10,
              Image.asset('asset/icons/search-normal.png'),
              J.sizeboxw10,
              DefaultText(
                text: text!,
                fontSize: 15,
                color: J.blackColor.withOpacity(0.4),
              )
            ],
          )),
    );
  }
}
