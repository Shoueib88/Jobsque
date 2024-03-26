import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/assets.dart';
import 'package:jobsque/widgets/homepage/custom_search_job.dart';

import '../../../consts/style.dart';
import '../../../widgets/default_text.dart';
import 'chatscreen.dart';

void main() => runApp(const UnreadMessage());

class UnreadMessage extends StatelessWidget {
  const UnreadMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SearchJobs(text: 'Search messages....', width: 240.w),
          GestureDetector(
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
        J.sizeboxh20,
        Container(
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            color: J.greyColor.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(text: 'Unread'),
                DefaultText(text: 'Read all messages', color: J.primaryColor)
              ],
            )),
        J.sizeboxh10,
        Expanded(
            child: ListView.separated(
                itemCount: unread_message.length,
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
                        unread_message[index]['title'] == 'Twitter'
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatScreen()))
                            : null;
                      },
                      title: DefaultText(
                          text: unread_message[index]['title'], fontSize: 17),
                      subtitle: DefaultText(
                          text: unread_message[index]['subtitle'],
                          fontSize: 11),
                      leading: Stack(
                        alignment: AlignmentDirectional.topStart,
                        children: [
                          CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage(unread_message[index]['image'])),
                          CircleAvatar(
                            radius: 8.r,
                            backgroundColor: J.primaryColor,
                            child: DefaultText(text: '1', color: J.whiteColor),
                          )
                        ],
                      ),
                      trailing: unread_message[index]['trailer'] != null
                          ? DefaultText(text: unread_message[index]['trailer'])
                          : DefaultText(
                              text: unread_message[index]['trailerblue'],
                              color: J.primaryColor));
                })),
      ])),
    );
  }
}
