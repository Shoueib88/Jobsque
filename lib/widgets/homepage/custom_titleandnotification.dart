import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Home/Notification/all_notif.dart';

import '../../consts/style.dart';
import '../default_text.dart';

class CustomTitleAndNotification extends StatelessWidget {
  const CustomTitleAndNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultText(
                      text: 'Hi, Rafif Dian👋',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  DefaultText(text: 'Create a better future for yourself here')
                ]),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AllNotification()));
              },
              child: Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: J.blackColor.withOpacity(0.3)),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.notifications_none_outlined,
                      color: J.blackColor.withOpacity(0.7))),
            )
          ],
        ));
  }
}
