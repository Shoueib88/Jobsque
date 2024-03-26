import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/widgets/default_text.dart';

class CustomBottomSheet {
  customBottomSheet(BuildContext context,
      {double? heightlistview,
      double? heightbottomsheet,
      double width = 150.0,
      required void Function() ontap,
      required List listtext,
      required bool haveleading,
      required List iconlist,
      required String title}) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: heightbottomsheet,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Center(
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultText(
                          text: title,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      J.sizeboxh10,
                      Container(
                        height: heightlistview,
                        child: ListView.separated(
                          // shrinkWrap: true,
                          itemCount: listtext.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return J.sizeboxh10;
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: ontap,
                              child: Container(
                                  width: 285.w,
                                  height: 38.h,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.r),
                                      border: Border.all(
                                          color:
                                              J.blackColor.withOpacity(0.3))),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        haveleading
                                            ? Container(
                                                width: width,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Image.asset(
                                                          iconlist[index],
                                                          fit: BoxFit.fill),
                                                      J.sizeboxw10,
                                                      DefaultText(
                                                          text: listtext[index])
                                                    ]))
                                            : DefaultText(
                                                text: listtext[index]),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            size: 15),
                                      ])),
                            );
                          },
                        ),
                      ),
                    ]),
              ));
        });
  }
}

List message_filter = ['Unread', 'Spam', 'Archieved'];
List icondata = [
  'asset/icons/notifications/briefcase.png',
  'asset/icons/notifications/note.png',
  'asset/icons/notifications/sms.png',
  'asset/icons/notifications/notification.png',
  'asset/icons/notifications/import.png',
  'asset/icons/notifications/trash.png',
];
List more = [
  'Visit job post',
  'View my application',
  'Mark as unread',
  'Mute',
  'Archive',
  'Delete conversation'
];

List savedtext = ['Apply Job', 'Shared via..', 'Cancel save'];
List savedicon = [
  'asset/icons/direct_box.png',
  'asset/icons/shared.png',
  'asset/icons/archive-minus.png'
];
