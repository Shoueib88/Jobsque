import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/assets.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/widgets/homepage/custom_bottom_sheet.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
                width: 150.w,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(messages[0]['image'], scale: 1.1),
                      const Text('Twitter')
                    ])),
            actions: [
              MaterialButton(
                  onPressed: () {
                    CustomBottomSheet().customBottomSheet(context,
                        heightlistview: 320.h,
                        // heightbottomsheet: 500.h,
                        ontap: () {},
                        width: 165.w,
                        listtext: more,
                        haveleading: true,
                        iconlist: icondata,
                        title: '');
                  },
                  child: Icon(Icons.more_horiz, size: 30))
            ]),
        body: Center(
          child: Column(
            children: [
              Container(
                  color: J.greyColor.withOpacity(0.05),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  height: 550.h,
                  child: Image.asset('asset/images/notification/Chat.png',
                      fit: BoxFit.fill)),
              J.sizeboxh10,
              Container(
                  child: Image.asset(
                'asset/images/notification/Message.png',
                fit: BoxFit.fill,
              ))
            ],
          ),
        ));
  }
}
