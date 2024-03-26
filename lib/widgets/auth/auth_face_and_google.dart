import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts/assets.dart';
import '../../consts/style.dart';
import '../../widgets/default_text.dart';

class AuthWithFaceAndGoogle extends StatelessWidget {
  const AuthWithFaceAndGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
                alignment: Alignment.center,
                width: 145.w,
                height: 45.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.google, scale: 15),
                    J.sizeboxw10,
                    DefaultText(text: 'Google'),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: J.greyColor),
                    borderRadius: BorderRadius.circular(10))),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                alignment: Alignment.center,
                width: 145.w,
                height: 45.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.facebook, scale: 20),
                    J.sizeboxw10,
                    DefaultText(text: 'Facebook'),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: J.greyColor),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
