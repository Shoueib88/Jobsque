import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts/style.dart';
import '../../../../widgets/default_text.dart';

void main() => runApp(const NoNotification());

class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Image.asset(
                        'asset/images/notification/Notification_Ilustration.png',
                        fit: BoxFit.fill)),
                J.sizeboxh10,
                Container(
                    width: 290.w,
                    height: 130.h,
                    child: Center(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DefaultText(
                            text: 'No new notifications yet',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                          DefaultText(
                            text:
                                'You will receive a notification if there is something on your account',
                            fontSize: 13,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ))
              ]),
        ));
  }
}
