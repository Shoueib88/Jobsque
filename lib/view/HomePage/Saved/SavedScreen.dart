import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/view/HomePage/Applied/applyJobNow.dart';
import 'package:jobsque/view/HomePage/Profile/widget/custom_taskbar.dart';
import 'package:jobsque/view/HomePage/Saved/widget/no_jobsaved.dart';
import 'package:jobsque/widgets/homepage/custom_bottom_sheet.dart';

import '../../../consts/style.dart';
import '../../../widgets/default_text.dart';
import '../Home/controller/cubit/home_cubit.dart';

void main() => runApp(const SavedScreen());

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: J.whiteColor,
      appBar: AppBar(
        backgroundColor: J.whiteColor,
        title: const Text('Saved'),
        centerTitle: true,
        leading: J.sizeboxw10,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final homecontroller = context.read<HomeCubit>();
          return homecontroller.listOfSaved.isEmpty
              ? NoSaved()
              : Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      CustomTaskBar(text: '3 Job saved'),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          height: MediaQuery.of(context).size.height - 200,
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: homecontroller.listOfSaved.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(height: 25);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    height: 110.h,
                                    //color: J.activecolor,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ListTile(
                                              leading: Image.network(
                                                  homecontroller
                                                      .listOfSaved[index]
                                                      .image!,
                                                  //Assets.facebook,
                                                  height: 45.h,
                                                  width: 50.w,
                                                  fit: BoxFit.fill),
                                              trailing: GestureDetector(
                                                  onTap: () {
                                                    CustomBottomSheet()
                                                        .customBottomSheet(
                                                            context, ontap: () {
                                                      (index == 0)
                                                          ? Navigator.of(
                                                                  context)
                                                              .push(MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      ApplyJobNow(
                                                                          index:
                                                                              index)))
                                                          : null;
                                                    },
                                                            listtext: savedtext,
                                                            haveleading: true,
                                                            heightlistview:
                                                                150.h,
                                                            iconlist: savedicon,
                                                            heightbottomsheet:
                                                                230.h,
                                                            title: '');
                                                  },
                                                  child: const Icon(
                                                      Icons.more_horiz_outlined,
                                                      size: 26)),
                                              isThreeLine: true,
                                              title: DefaultText(
                                                  text: homecontroller
                                                      .listOfSaved[index].name!,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.sp),
                                              subtitle: DefaultText(
                                                  text:
                                                      ('${homecontroller.listOfSaved[index].jobType!} , ${homecontroller.listOfData[index].compName!}'))),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                DefaultText(
                                                    text: 'Posted 2 days ago',
                                                    fontSize: 12.sp),
                                                Container(
                                                    child: Row(children: [
                                                  Icon(Icons.timer_outlined,
                                                      color: J.greenColor,
                                                      size: 17),
                                                  DefaultText(
                                                      text:
                                                          'Be an early applicant',
                                                      fontSize: 12.sp)
                                                ]))
                                              ])
                                        ]));
                              }))
                    ]));
        },
      ),
    );
  }
}
