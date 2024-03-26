import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Profile/view/widget/custom_switch.dart';
import 'package:jobsque/view/HomePage/Profile/widget/custom_taskbar.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            J.sizeboxh10,
            CustomTaskBar(text: 'Job notification'),
            J.sizeboxh10,
            Container(
                height: 320.h,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomSwitch()),
            CustomTaskBar(text: 'Other notification'),
            Container(
                // height: 260.h,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: OthersNotification())
          ],
        ));
  }
}
