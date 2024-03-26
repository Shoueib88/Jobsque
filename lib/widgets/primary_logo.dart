import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/assets.dart';

void main() => runApp(const PrimaryLogo());

class PrimaryLogo extends StatelessWidget {
  const PrimaryLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.logo,
      fit: BoxFit.fill,
      width: 110.w,
      height: 40,
    );
  }
}
