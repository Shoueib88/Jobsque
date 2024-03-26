import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/assets.dart';
import 'package:jobsque/view/HomePage/Messages/not%20messages.dart';
import 'package:jobsque/widgets/homepage/custom_bottom_sheet.dart';
import 'package:jobsque/widgets/homepage/custom_search_job.dart';

import '../../../consts/style.dart';
import '../../../widgets/default_text.dart';
import 'unreadmessage.dart';

void main() => runApp(const MessageScreen());

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
        leading: J.sizeboxw10,
      ),
      body: Center(
          child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SearchJobs(text: 'Search messages....', width: 240.w),
          GestureDetector(
            onTap: () {
              CustomBottomSheet().customBottomSheet(context, ontap: () {
                message_filter[0] == 'Unread'
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UnreadMessage()))
                    : null;
              },
                  haveleading: false,
                  heightbottomsheet: 250,
                  heightlistview: 180,
                  iconlist: icondata,
                  listtext: message_filter,
                  title: 'Message Filter');
            },
            child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: J.blackColor.withOpacity(0.3)),
                  shape: BoxShape.circle,
                ),
                child: Image.asset('asset/icons/filter.png')),
          )
        ]),
        J.sizeboxh10,
        Expanded(
            child: ListView.separated(
                itemCount: messages.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                      margin: const EdgeInsets.only(right: 15, left: 60),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: J.blackColor.withOpacity(0.2))));
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      onTap: () {
                        messages[index]['trailer'] != null
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NoMessages()))
                            : Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UnreadMessage()));
                      },
                      title: DefaultText(
                          text: messages[index]['title'], fontSize: 17),
                      subtitle: DefaultText(
                          text: messages[index]['subtitle'], fontSize: 11),
                      leading: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage(messages[index]['image'])),
                      trailing: messages[index]['trailer'] != null
                          ? DefaultText(text: messages[index]['trailer'])
                          : DefaultText(
                              text: messages[index]['trailerblue'],
                              color: J.primaryColor)
                      // isThreeLine: true,
                      );
                })),
      ])),
    );
  }
}
