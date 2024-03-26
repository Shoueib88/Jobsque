import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/consts/assets.dart';
import 'package:jobsque/consts/style.dart';
import 'package:jobsque/view/HomePage/Home/Notification/no_notification.dart';
import 'package:jobsque/widgets/default_text.dart';

void main() => runApp(const AllNotification());

class AllNotification extends StatelessWidget {
  const AllNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
                color: J.greyColor.withOpacity(0.3),
                width: MediaQuery.of(context).size.width,
                height: 35,
                child: DefaultText(text: '     Now', fontSize: 17)),
            J.sizeboxh10,
            Container(
                height: 310.h,
                width: MediaQuery.of(context).size.width - 10,
                child: ListView.separated(
                    itemCount: 4,
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(height: 0.1.h));
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NoNotification()));
                        },
                        title: DefaultText(
                            text: notification[index]['title'], fontSize: 17),
                        subtitle: DefaultText(
                            text: 'Posted new design jobs', fontSize: 11),
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage(notification[index]['image'])),
                        trailing: DefaultText(text: '10.00AM'),
                        isThreeLine: true,
                      );
                    })),
            J.sizeboxh10,
            Container(
                color: J.greyColor.withOpacity(0.3),
                width: MediaQuery.of(context).size.width,
                height: 35,
                child: DefaultText(text: '     yesterday', fontSize: 17)),
            Container(
                height: 150.h,
                width: MediaQuery.of(context).size.width - 9,
                child: ListView.separated(
                    itemCount: 2,
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(height: 1.h));
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NoNotification()));
                        },
                        title: DefaultText(
                          text: notification2[index]['title'],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: DefaultText(
                            text: notification2[index]['subtitle'],
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage(notification2[index]['image'])),
                        trailing: DefaultText(text: '10.00AM'),
                        // isThreeLine: true,
                      );
                    })),
          ],
        ));
  }
}
